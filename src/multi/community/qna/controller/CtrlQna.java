package multi.community.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import multi.community.qna.dao.Community_qnaDAO;
import multi.community.qna.dao.Community_qna_mytextDAO;
import multi.community.qna.dao.Community_qna_repleDAO;
import multi.community.qna.dao.Community_qna_searchDAO;
import multi.community.qna.vo.Community_qnaVO;
import multi.community.qna.vo.Community_qna_repleVO;
import multi.community.qna.vo.Community_qna_searchVO;

@Controller
public class CtrlQna {
	@Autowired @Qualifier("community_qnaDAO")
	private Community_qnaDAO community_qnaDAO=null;
	
	@Autowired @Qualifier("community_qna_repleDAO")
	private Community_qna_repleDAO community_qna_repleDAO=null;
	
	@Autowired @Qualifier("community_qna_mytextDAO")
	private Community_qna_mytextDAO community_qna_mytextDAO =null;
	
	@Autowired @Qualifier("community_qna_searchDAO")
	private Community_qna_searchDAO community_qna_searchDAO =null;
	
	//QnA �Խ��� ����Ʈ
	@RequestMapping("/community_qna_list.do")
	public ModelAndView community_qna(@CookieValue("user_id") String user_id,
			@ModelAttribute Community_qna_searchVO pvo, @RequestParam("cur_page") String cur_page) throws Exception{
		ModelAndView mnv = new ModelAndView("community_qna_list");
		pvo.setStart(null);
		List<Community_qnaVO> qna_list = community_qna_searchDAO.comm_qna_search(pvo);
	    // ������ ������ ���� ó��(������ ���ڵ� ���)
	    PaginationDTO board_pz = new PaginationDTO().init(cur_page, qna_list.size());
	    pvo.setStart(board_pz.getSkip());
	    qna_list = community_qna_searchDAO.comm_qna_search(pvo);		
	    mnv.addObject("qna_list", qna_list);
		mnv.addObject("user_id", user_id);
		mnv.addObject("board_pz", board_pz);
		return mnv;
	}
	
	//QNA �Խ��� �б�
	@RequestMapping("/community_qna_read.do")
	public ModelAndView community_qna_read(@ModelAttribute Community_qnaVO pvo,
			@ModelAttribute Community_qna_repleVO rpl, 
			@CookieValue("user_id") String user_id) throws Exception{
			
			pvo.setUser_id(user_id);
			community_qnaDAO.modView(pvo);
			Community_qnaVO vo=community_qnaDAO.findByPK(pvo);
			List<Community_qna_repleVO> rp=community_qna_repleDAO.findAllReple(rpl);
			
			ModelAndView mnv = new ModelAndView("community_qna_read");
			mnv.addObject("vo", vo);
			mnv.addObject("rp", rp);
			mnv.addObject("user_id", user_id);
			return mnv;
	}
	//QNA �Խ��� �۾���
	@RequestMapping("/community_qna_add.do")
	public ModelAndView community_qna_add(@CookieValue("user_id") String user_id) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_add");
			mnv.addObject("user_id", user_id);
			return mnv;
	}
	//QNA �Խ��� �۾����� ���� �� ����Ʈ ����
	@RequestMapping("/community_qna_add2.do")
	public String community_qna_add2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.add(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	//QNA ���� ����
	@RequestMapping("/community_qna_mod.do")
	public ModelAndView community_qna_mod(@ModelAttribute Community_qnaVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_mod");
			mnv.addObject("vo",pvo);
			return mnv;
	}
	//QNA ���� ������ �ش� QNA ���̱�
	@RequestMapping("/community_qna_mod2.do")
	public String community_qna_mod2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.mod(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA ���� ����
	@RequestMapping("/community_qna_del.do")
	public String community_qna_del(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.delByPK(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	// �Ʒ����ʹ� ����
	
	//QNA ���� ����
	@RequestMapping("/community_qna_reple_add.do")
	@ResponseBody
	public String community_qna_reple_add(@CookieValue("user_id") String user_id, HttpServletRequest request) throws Exception{
		try{
			Community_qna_repleVO pvo = new Community_qna_repleVO();
			pvo.setCom_qna_no(BeanUtil.pInt(request.getParameter("com_qna_no")));
			pvo.setCom_qna_reple_content(request.getParameter("com_qna_reple_content"));
			pvo.setUser_id(user_id);
			community_qna_repleDAO.addReple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
			
	}
	//QNA ���� ����
	@RequestMapping("/community_qna_reple_del.do")
	public String community_qna_reple_del(@ModelAttribute Community_qna_repleVO pvo) throws Exception
	{
		community_qna_repleDAO.delReple(pvo);
		return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA ���� ����
	@RequestMapping("/community_qna_reple_mod.do")
	public String community_board_replemod(@ModelAttribute Community_qna_repleVO pvo) throws Exception {
			System.out.println("getCom_qna_reple_content() : "+pvo.getCom_qna_reple_content());
			System.out.println(pvo.getCom_qna_reple_no());
			community_qna_repleDAO.modReple(pvo);
			return  "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA ���� ��õ
	@RequestMapping("/community_qna_reple_recom.do")
	@ResponseBody
	public String community_board_recom(@ModelAttribute Community_qna_repleVO pvo)throws Exception {
		community_qna_repleDAO.incRecom(pvo);
		//return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
		return pvo.getRecom_count().toString();
    }
	
	// QNA �������ۺ���
	 @RequestMapping("/community_qna_mytext.do")
	   public ModelAndView community_board_mytext(@CookieValue("user_id") String user_id) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_qna_mytext");
		 List<Community_qnaVO> mrl = community_qna_mytextDAO.findAll(user_id);
	      mnv.addObject("user_id", user_id);
	      mnv.addObject("mrl", mrl);
	      System.out.println(user_id);
	      return mnv;
	 }
	 // QNA �� ã��
	 @RequestMapping("/community_qna_serch.do")
		public  ModelAndView  community_board_serch(@ModelAttribute Community_qna_searchVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_serch");
			 List<Community_qnaVO> srl = community_qna_searchDAO.comm_qna_search(pvo);
		      mnv.addObject("srl", srl);
		      return mnv;
			
		}
	 
	
}


