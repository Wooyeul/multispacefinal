package multi.admin.controller;
 
import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.ClubVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.admin.dao.Admin_ClubDAO;
import multi.admin.vo.Admin_searchVO;

/* 
모임 관리

모임 리스트 확인 페이지
특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
특정 모임 정보를 확인하는 페이지
 */

@Controller
public class Ctrl_Admin_Clubs {
	@Autowired @Qualifier("admin_ClubDAO")
	private Admin_ClubDAO admin_ClubDAO = null;
	
	// 모임 리스트 확인 페이지
	@RequestMapping("/admin_clubs.do")
	public ModelAndView admin_clubs( @ModelAttribute ClubVO cvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_clubs");
		List<ClubVO> ls = admin_ClubDAO.findAllClub();
		mnv.addObject("ls", ls);
		
		return mnv;
	}
	// 특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
	@RequestMapping("/admin_club_remove.do")
	public ModelAndView admin_club_remove( @ModelAttribute ClubVO cvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_ClubDAO.removeClub(cvo);
		mnv.setViewName("redirect:/admin_clubs.do");
		return mnv;
	}
	// 특정 모임 정보를 확인하는 페이지
	@RequestMapping("/admin_club_detail.do")
	public ModelAndView admin_club_detail( @ModelAttribute ClubVO cvo, @ModelAttribute User_clubVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_club_detail");
		ClubVO vo = admin_ClubDAO.check_specific_Club(cvo);
		List<User_clubVO> ls = admin_ClubDAO.check_joined_Users(cvo);
		mnv.addObject("vo", vo);
		mnv.addObject("ls", ls);
		return mnv;
	}
	
	@RequestMapping("/admin_clubs_search.do")
	public ModelAndView admin_clubs_search(@ModelAttribute  Admin_searchVO  pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_clubs_search");
		List<ClubVO> ls = admin_ClubDAO.club_search(pvo);
		mnv.addObject("ls", ls);
		return mnv;
	}
	
	
}