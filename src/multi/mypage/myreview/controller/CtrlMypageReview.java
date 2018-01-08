package multi.mypage.myreview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.ReviewVO;
import multi.mypage.myreview.dao.MPReviewDAO;

@Controller
public class CtrlMypageReview {
	
	@Autowired @Qualifier("MPreviewDAO")
	private MPReviewDAO MPreviewDAO = null;
	
	
	@RequestMapping("/PMreview_findAll.do")
	public ModelAndView PMreview_findAll(@CookieValue("user_id") String user_id) throws Exception{
		
		ModelAndView mnv = new ModelAndView("PMreview_findAll2");
		List<ReviewVO> rl = MPreviewDAO.review_findAll(user_id);
		mnv.addObject("rl", rl);
		
		return mnv;
	}
	
}
