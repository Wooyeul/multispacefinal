package multi.mypage.myinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.UserVO;
import multi.mypage.myinfo.dao.MyInfoDAO;
import multi.mypage.myinfo.dao.UserDAO;

@Controller
public class CtrlMypageInfo {
	
	@Autowired @Qualifier("myInfoDAO")
	private MyInfoDAO myInfoDAO = null;
	
	@RequestMapping("/myinfo_ckpass.do")
	public ModelAndView ckpasswd() throws Exception{
		ModelAndView mnv = new ModelAndView("myinfo_ckpass");
		
		return mnv;
	}
	
	@RequestMapping("/mypage_mod_user.do")
	public ModelAndView modUser(@ModelAttribute UserVO uvo) throws Exception{
		
		ModelAndView mnv = new ModelAndView();
		
		int r = myInfoDAO.ckpass(uvo);
		
		if(r==0){
			mnv.setViewName("myinfo_fail");
		} else if( r==1){
			mnv.setViewName("myinfo_mod_form");
			UserVO rvo = myInfoDAO.find_user(uvo);
			String phone_cen = rvo.getPhone().substring(2,4);
			String phone_end = rvo.getPhone().substring(4);
			String email = rvo.getEmail().substring(0, rvo.getEmail().indexOf("@"));
			mnv.addObject("phone_cen", phone_cen);
			mnv.addObject("phone_end", phone_end);
			mnv.addObject("email", email);
			mnv.addObject("rvo", rvo);
		}
		
		return mnv;
	}
	
	@RequestMapping("/myinfo_mod_user2.do")
	public String modUser2(@ModelAttribute UserVO uvo,
			@RequestParam(value = "home") String r,
			@RequestParam(value="num") String num, 
			@RequestParam(value = "phone_cen") String phone_cen,
			@RequestParam(value = "phone_end") String phone_end,
			@RequestParam(value = "phone") String home) throws Exception{
		
		String e = uvo.getEmail()+"@"+r;
		uvo.setEmail(e);
		String phone = num + phone_cen + phone_end;
		uvo.setPhone(phone);
	
		myInfoDAO.mod_user(uvo);
		return "redirect:/myinfo_complete.do";
	}
	
	@RequestMapping("/myinfo_complete.do")
	public ModelAndView myinfo_complete() throws Exception{
		ModelAndView mnv = new ModelAndView("myinfo_complete");
		
		return mnv;
	}
	
	@RequestMapping("/myinfo_delete.do")
	public String myinfo_delete(@ModelAttribute UserVO uvo) throws Exception{
		System.out.println(uvo.getUser_id());
		
		myInfoDAO.del_user(uvo);
		
		return "redirect:/myinfo_del_complete.do";
	}
	
	@RequestMapping("/myinfo_del_complete.do")
	public ModelAndView myinfo_del_complete() throws Exception{
		ModelAndView mnv = new ModelAndView("myinfo_del_complete");
		
		return mnv;
	}
	
	
	
}
