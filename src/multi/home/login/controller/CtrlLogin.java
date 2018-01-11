package multi.home.login.controller;

import java.util.List;
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import multi.home.login.dao.UserDAO;
import main.vo.UserVO;

@Controller
public class CtrlLogin {

	@Autowired	@Qualifier("home_login_UserDAO")
	private UserDAO UserDAO = null;

	
	
	
	/*
	 * main.html 실행시 chk_login.do 실행
	 */
	@RequestMapping("/chk_login.do")
	@ResponseBody
	public String chk_login(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		if( userInfo == null ){ //로그인을 안했으면
			return "10002";
		}
		else{ // 로그인을 했으면
			String user_name = userInfo.getUser_name();
			return user_name;
		}
		
	}
	

	@RequestMapping("/main.do")
	public Object main(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		
		if (user_id != null) {
			ModelAndView mnv = new ModelAndView("main");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("user_name", userInfo.getUser_name());
			mnv.addObject("top_nav_code", "20000");
			return mnv;
		}else {
			return "redirect:/main.html";
		}
	}


	@RequestMapping("/home_moveLoginPage.do")
	public ModelAndView moveLoginPage(@CookieValue("code") String code, HttpServletRequest request) throws Exception {

		if (code == null) {
			ModelAndView mnv = new ModelAndView("home_login");
			return mnv;
		} else if (code.equals("10001")) {
			ModelAndView mnv = new ModelAndView("home_login");
			mnv.addObject("code", "ID 가 없거나 암호가 틀립니다.");
			return mnv;
		}/* else if (code.equals("10002")) {
			ModelAndView mnv = new ModelAndView("home_login");
			mnv.addObject("code", "로그인이 필요한 페이지 입니다.");
			return mnv;
		}*/ else {
			return null;
		}

	}

	
	/*
	 * 로그인 성공 여부에 따라 code값 심어줌.
	 */
	
	@RequestMapping("/home_login.do")
	public Object login(@ModelAttribute UserVO uvo, HttpServletResponse response) throws Exception {

		UserVO userInfo = UserDAO.find_user(uvo);

		if (userInfo != null && uvo.getUser_id().equals(userInfo.getUser_id())
				&& uvo.getPasswd().equals(userInfo.getPasswd())) {
			Cookie ck = new Cookie("user_id", userInfo.getUser_id());
			response.addCookie(ck);

			//Cookie ck1 = new Cookie("code", "");
			//response.addCookie(ck1);
			
			return "redirect:/main.do";
			//user_id 와 passwd가 제대로 맞으면 로그인 성공 -> cookie에 code가 없다.
			
		} else {
			//user_id 와 passwd가 제대로 맞지 않으면 로그인 실패 -> code 값이 10001
			Cookie ck = new Cookie("code", "10001");
			response.addCookie(ck);
			return "redirect:/home_moveLoginPage.do";
		}

	}
	
	
	@RequestMapping("/home_moveFindIdPage.do")
	public ModelAndView moveFindIdPage() throws Exception {
		ModelAndView mnv = new ModelAndView("home_findId");
		return mnv;

	}

	@RequestMapping("/home_findId.do")
	public ModelAndView findId(@ModelAttribute UserVO uvo) throws Exception {
		

		UserVO userInfo = UserDAO.find_userId(uvo);
		System.out.println(uvo.getUser_name());
		System.out.println(uvo.getSsn1());

		ModelAndView mnv = new ModelAndView("home_findId");
		mnv.addObject("user_id",userInfo.getUser_id());		
		return mnv;

	}
	
	@RequestMapping("/home_moveFindPasswdPage.do")
	public ModelAndView moveFindPasswdPage() throws Exception {

		ModelAndView mnv = new ModelAndView("home_findPasswd");
		return mnv;

	}
	
	@RequestMapping("/home_findPassswd.do")
	public ModelAndView findPasswd(@ModelAttribute UserVO uvo) throws Exception {

		
		UserVO userInfo = UserDAO.find_userPasswd(uvo);

		
		ModelAndView mnv = new ModelAndView("home_findPasswd");
		mnv.addObject("passwd",userInfo.getPasswd());		
		return mnv;
	}
	
	 @RequestMapping("/home_logout.do")
	   public String logout( HttpServletResponse response) throws Exception{
		 		 
	      Cookie ck = new Cookie("user_id","");
	      response.addCookie(ck);
	      
	      return "redirect:/main.html";
	   }
	   
	   
	

}