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
import main.vo.O2OQnAVO;
import main.vo.UserVO;
import multi.admin.dao.Admin_ClubDAO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.mail.EmailUtility;
import multi.admin.vo.Admin_User_Del_EmailVO;


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
/*	// 특정 유저 삭제. 리다이렉트 유저 리스트 페이지
	@RequestMapping("/admin_user_del.do")
	public ModelAndView admin_user_del( @ModelAttribute Admin_User_Del_EmailVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_UserDAO.user_del(uvo);
		mnv.setViewName("redirect:/admin_users.do");
		return mnv;
	}*/
	
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
	// 특정 유저 삭제시 이메일로 탈퇴 사유 작성하는 페이지
	@RequestMapping("/admin_user_del_write.do")
	public ModelAndView admin_user_del_write( @ModelAttribute Admin_User_Del_EmailVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_del_write");
		System.out.println(uvo.getUser_id());
		System.out.println(uvo.getUser_name());
		System.out.println(uvo.getEmail());
		mnv.addObject("vo", uvo);
		return mnv;
	}
	@RequestMapping("/admin_user_del.do")
	public ModelAndView admin_user_del( @ModelAttribute Admin_User_Del_EmailVO uvo  ) throws Exception {
		ModelAndView mnv = new ModelAndView();
        String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "multipro2018@gmail.com";
        String password = "rmfnpdlxm2";
        
		System.out.println(uvo.getUser_id());
		System.out.println(uvo.getUser_name());
		System.out.println(uvo.getEmail());

        String customer_email = uvo.getEmail();
        String admin_subject = uvo.getSubject();
        String admin_opinion = uvo.getMail_content();
        
        String subject = "안녕하세요 멀티 스페이스입니다." + admin_subject;
        String message = admin_opinion +"\n\n\n\n 항상 멀티 스페이스를 이용해 주셔서 감사했니다.\n"
        				+ "\n본메일은 발신 전용입니다."
        				+ "\n\n감사합니다.";
        
        String result_message = null;
        try {
        	admin_UserDAO.user_del(uvo);
            EmailUtility.sendEmail(host, port, mailFrom, password, customer_email, subject,
            		message);
            result_message = "The e-mail was sent successfully";
            uvo.setMail_content(message);
            //admin_UserDAO.user_del(uvo);
        } catch (Exception e) {
            e.printStackTrace();
            result_message = "There were an error: " + e.getMessage();
        }
        
        mnv.setViewName("redirect:/admin_user_del_write_status.do?message="+result_message);
		return mnv;
	}
	
	// 이메일로 메일이 정상적으로 보내졌는지 확인 하는 페이지
	@RequestMapping("/admin_user_del_write_status.do")
	public ModelAndView admin_user_del_write_status( @RequestParam("message")String message  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_del_write_status");
		mnv.addObject("message", message);
		return mnv;
	}
	
	// 유저 통계 페이지. 미구현. 사진 하나 대체
	@RequestMapping("/admin_user_stastic.do")
	public ModelAndView admin_user_stastic() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_user_stastic");
		return mnv;
	}
	
}