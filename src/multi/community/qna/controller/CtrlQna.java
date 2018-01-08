package multi.community.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import multi.community.qna.dao.Community_qnaDAO;
import multi.community.qna.dao.Community_qna_repleDAO;
import multi.community.qna.vo.Community_qnaVO;
import multi.community.qna.vo.Community_qna_repleVO;

@Controller
public class CtrlQna {
	@Autowired @Qualifier("community_qnaDAO")
	private Community_qnaDAO community_qnaDAO=null;
	
	@Autowired @Qualifier("community_qna_repleDAO")
	private Community_qna_repleDAO community_qna_repleDAO=null;
	
	//QnA 게시판
	@RequestMapping("/community_qna_list.do")
	public ModelAndView community_qna() throws Exception{
		List<Community_qnaVO> rl=community_qnaDAO.findAll();
		ModelAndView mnv = new ModelAndView("community_qna_list");
		mnv.addObject("rl", rl);
		return mnv;
	}
	
	@RequestMapping("/community_qna_read.do")
	public ModelAndView community_qna_read(@ModelAttribute Community_qnaVO pvo,
			@ModelAttribute Community_qna_repleVO rpl) throws Exception{
			community_qnaDAO.modView(pvo);
			Community_qnaVO vo=community_qnaDAO.findByPK(pvo);
			List<Community_qna_repleVO> rp=community_qna_repleDAO.findAllReple(rpl);
			
			ModelAndView mnv = new ModelAndView("community_qna_read");
			mnv.addObject("vo", vo);
			mnv.addObject("rp", rp);
			return mnv;
	}
	
	@RequestMapping("/community_qna_add.do")
	public ModelAndView community_qna_add() throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_add");
			return mnv;
	}
	
	@RequestMapping("/community_qna_add2.do")
	public String community_qna_add2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.add(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	@RequestMapping("/community_qna_mod.do")
	public ModelAndView community_qna_mod(@ModelAttribute Community_qnaVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_mod");
			mnv.addObject("vo",pvo);
			return mnv;
	}
	
	@RequestMapping("/community_qna_mod2.do")
	public String community_qna_mod2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.mod(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/community_qna_del.do")
	public String community_qna_del(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.delByPK(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	// 아래부터는 리플
	
	@RequestMapping("/community_qna_reple_add.do")
	public String community_qna_reple_add(@ModelAttribute Community_qna_repleVO pvo) throws Exception{
			community_qna_repleDAO.addReple(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/community_qna_reple_del.do")
	public String community_qna_reple_del(@ModelAttribute Community_qna_repleVO pvo) throws Exception{
			community_qna_repleDAO.delReple(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/community_qna_reple_mod.do")
	public String community_board_replemod(@ModelAttribute  Community_qna_repleVO  pvo) throws Exception {
			community_qna_repleDAO.modReple(pvo);
		return  "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/community_qna_reple_recom.do")
	public String community_board_recom(@ModelAttribute Community_qna_repleVO pvo)throws Exception {
		System.out.println(pvo.getUser_id());
		System.out.println(pvo.getCom_qna_reple_no());
		community_qna_repleDAO.incRecom(pvo);
		
		return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
    }
}


