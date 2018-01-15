package multi.community.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
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
	
	//QnA 게시판 리스트
	@RequestMapping("/community_qna_list.do")
	public ModelAndView community_qna(@CookieValue("user_id") String user_id) throws Exception{
	
		List<Community_qnaVO> rl=community_qnaDAO.findAll(user_id);
		ModelAndView mnv = new ModelAndView("community_qna_list");
		mnv.addObject("rl", rl);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	//QNA 게시판 읽기
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
	//QNA 게시판 글쓰기
	@RequestMapping("/community_qna_add.do")
	public ModelAndView community_qna_add(@CookieValue("user_id") String user_id) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_add");
			mnv.addObject("user_id", user_id);
			return mnv;
	}
	//QNA 게시판 글쓴내용 전송 후 리스트 복귀
	@RequestMapping("/community_qna_add2.do")
	public String community_qna_add2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.add(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	//QNA 내용 수정
	@RequestMapping("/community_qna_mod.do")
	public ModelAndView community_qna_mod(@ModelAttribute Community_qnaVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_mod");
			mnv.addObject("vo",pvo);
			return mnv;
	}
	//QNA 내용 수정후 해당 QNA 보이기
	@RequestMapping("/community_qna_mod2.do")
	public String community_qna_mod2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.mod(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA 내용 삭제
	@RequestMapping("/community_qna_del.do")
	public String community_qna_del(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.delByPK(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	// 아래부터는 리플
	
	//QNA 리플 쓰기
	@RequestMapping("/community_qna_reple_add.do")
	public String community_qna_reple_add(@CookieValue("user_id") String user_id,@ModelAttribute Community_qna_repleVO pvo) throws Exception{
			pvo.setUser_id(user_id);	
			community_qna_repleDAO.addReple(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA 리플 삭제
	@RequestMapping("/community_qna_reple_del.do")
	public String community_qna_reple_del(@ModelAttribute Community_qna_repleVO pvo) throws Exception
	{
		System.out.println( pvo.getCom_qna_reple_no() );
		System.out.println( pvo.getCom_qna_no() );
		
		community_qna_repleDAO.delReple(pvo);
		return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA 리플 수정
	@RequestMapping("/community_qna_reple_mod.do")
	public String community_board_replemod(@ModelAttribute  Community_qna_repleVO  pvo) throws Exception {
			community_qna_repleDAO.modReple(pvo);
		return  "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA 리플 추천
	@RequestMapping("/community_qna_reple_recom.do")
	@ResponseBody
	public String community_board_recom(@ModelAttribute Community_qna_repleVO pvo)throws Exception {
		System.out.println(pvo.getUser_id());
		System.out.println(pvo.getCom_qna_reple_no());
		community_qna_repleDAO.incRecom(pvo);
		//return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
		return pvo.getRecom_count().toString();
    }
	
	// QNA 내가쓴글보기
	 @RequestMapping("/community_qna_mytext.do")
	   public ModelAndView community_board_mytext(@CookieValue("user_id") String user_id) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_qna_mytext");
		 List<Community_qnaVO> mrl = community_qna_mytextDAO.findAll(user_id);
	      mnv.addObject("user_id", user_id);
	      mnv.addObject("mrl", mrl);
	      System.out.println(user_id);
	      return mnv;
	 }
	 // QNA 글 찾기
	 @RequestMapping("/community_qna_serch.do")
		public  ModelAndView  community_board_serch(@ModelAttribute Community_qna_searchVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_serch");
			 List<Community_qnaVO> srl = community_qna_searchDAO.comm_qna_search(pvo);
		      mnv.addObject("srl", srl);
		      return mnv;
			
		}
	 
	
}


