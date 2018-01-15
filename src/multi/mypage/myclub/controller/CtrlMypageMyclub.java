package multi.mypage.myclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.ClubVO;
import multi.mypage.myclub.dao.MyclubDAO;

/**
 * @author sb
 * 마이페이지 내 클럽
 */
@Controller
public class CtrlMypageMyclub {
	
	@Autowired @Qualifier("myclubDAO")
	private MyclubDAO myclubDAO;
	
	@RequestMapping("/myclub_findAll.do") 
	public ModelAndView findMyclub(@CookieValue("user_id") String user_id){
		
		ModelAndView mnv = new ModelAndView("myclub_findAll2");
		List<ClubVO> rl = myclubDAO.find_myClub(user_id);
		mnv.addObject("rl", rl);
		return mnv;
	}
}
