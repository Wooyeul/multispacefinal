package multi.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.Community_qnaVO;
import main.vo.ReviewVO;
import multi.admin.dao.Admin_ReviewDAO;
import multi.community.review.dao.Community_board_reviewDAO;


@Controller
public class Ctrl_Admin_Review {
	
	@Autowired 	@Qualifier("admin_ReviewDAO")
	private Admin_ReviewDAO admin_ReviewDAO = null;
	
	@RequestMapping("/admin_community_review_list.do")
	public ModelAndView admin_community_review_list() throws Exception{
		
		List<ReviewVO> rl = admin_ReviewDAO.review_findAll();
		ModelAndView mnv = new ModelAndView("admin_community_review_list");
		mnv.addObject("rl", rl);
		return mnv; 
		
	}
	
	@RequestMapping("/admin_community_review_remove.do")
	public ModelAndView admin_community_review_remove( @ModelAttribute ReviewVO rvo ) throws Exception{
		
		ModelAndView mnv = new ModelAndView();
		admin_ReviewDAO.remove_review(rvo);
		mnv.setViewName("redirect:/admin_community_review_list.do");
		return mnv; 
		
	}
	

}
