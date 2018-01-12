package multi.community.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.RequestMapping;
import main.vo.ReviewVO;
import multi.community.review.dao.Community_board_reviewDAO;


@Controller
public class CtrlReview {
	
	@Autowired 	@Qualifier("community_board_reviewDAO")
	private Community_board_reviewDAO community_board_reviewDAO = null;
	
	@RequestMapping("/community_review_list.do")
	public ModelAndView community_review_list() throws Exception{
		
		List<ReviewVO> rl = community_board_reviewDAO.review_findAll();
		ModelAndView mnv = new ModelAndView("community_review_list");
		mnv.addObject("rl", rl);
		return mnv;
		
	}
	

}
