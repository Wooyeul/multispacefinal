package multi.mypage.myclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.ClubVO;
import multi.mypage.myclub.dao.MyclubDAO;

@Controller
public class CtrlMypageMyclub {
	
	@Autowired @Qualifier("myclubDAO")
	private MyclubDAO myclubDAO;
	
	@RequestMapping("/myclub_findAll.do") 
	public ModelAndView findMyclub(@ModelAttribute ClubVO mvo){
		
		ModelAndView mnv = new ModelAndView("myclub_findAll2");
		List<ClubVO> rl = myclubDAO.find_myClub(mvo);
		mnv.addObject("rl", rl);
		return mnv;
	}
}
