package multi.admin.controller;

import java.util.List;
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.UserVO;
import multi.admin.dao.Admin_ClubDAO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;


/* 
맴버 관리

유저 리스트 페이지
특정 유저 클릭시 확인 페이지
특정 유저 삭제. 리다이렉트 유저 리스트 페이지
유저 정보 수정 페이지. 특정 유저 정보 불러옴
유저 정보 수정 페이지에서 유저 정보 수정 완료 시. 리다이렉트 유저 리스트 페이지.
유저 통계 페이지. 미구현. 사진 하나 대체
 */

@Controller
public class Ctrl_Admin_Users {
	@Autowired @Qualifier("admin_UserDAO")
	private Admin_UserDAO admin_UserDAO = null;
	
	// 유저 리스트 페이지
	@RequestMapping("/admin_users.do")
	public ModelAndView admin_users() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_users");
		List<UserVO> ls = admin_UserDAO.user_findAll();
		mnv.addObject("ls", ls);
		return mnv;
	}
	// 특정 유저 클릭시 확인 페이지
	@RequestMapping("/admin_user_check.do")
	public ModelAndView admin_user_check( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_check");
		UserVO vo = admin_UserDAO.user_check(uvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	// 특정 유저 삭제. 리다이렉트 유저 리스트 페이지
	@RequestMapping("/admin_user_del.do")
	public ModelAndView admin_user_del( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_UserDAO.user_del(uvo);
		mnv.setViewName("redirect:/admin_users.do");
		return mnv;
	}
	// 유저 정보 수정 페이지. 특정 유저 정보 불러옴
	@RequestMapping("/admin_user_mod.do")
	public ModelAndView admin_user_mod( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_mod");
		UserVO vo = admin_UserDAO.user_check(uvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	// 유저 정보 수정 페이지에서 유저 정보 수정 완료 시. 리다이렉트 유저 리스트 페이지.
	@RequestMapping("/admin_user_mod2.do")
	public ModelAndView admin_user_mod2( @ModelAttribute UserVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_UserDAO.user_modify(uvo);
		mnv.setViewName("redirect:/admin_users.do");
		return mnv;
	}
	// 유저 통계 페이지. 미구현. 사진 하나 대체
	@RequestMapping("/admin_user_stastic.do")
	public ModelAndView admin_user_stastic() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_stastic");
		return mnv;
	}
	
}