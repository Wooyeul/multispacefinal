package multi.home.userjoin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.UserVO;
import multi.home.userjoin.dao.UserJoinDAO;

@Controller
public class CtrlUserJoin {
	
	@Autowired @Qualifier("userJoinDAO") 
	private UserJoinDAO userJoinDAO = null;

//////////////////////약관동의 시작///////////////////////
	@RequestMapping("/home_terms.do")
	public ModelAndView terms() throws Exception{
		
		ModelAndView mnv = new ModelAndView("home_terms");
		
		return mnv;
	}
	
//////////////////////약관동의 끝///////////////////////
	
	
/////////////////////회원가입 시작//////////////////////
	@RequestMapping("/home_user_join.do")
	public ModelAndView joinUser(@ModelAttribute UserVO uvo) throws Exception{
		
		ModelAndView mnv = new ModelAndView("home_user_join");
		
		return mnv;
	}
	
	@RequestMapping("/home_user_join2.do")
	public String joinUser2(@ModelAttribute UserVO uvo,
			@RequestParam(value = "home") String r,
			@RequestParam(value="num") String num, 
			@RequestParam(value="phone_cen") String phone_cen,
			@RequestParam(value="phone_end") String phone_end ) throws Exception{
		
		String e = uvo.getEmail()+"@"+r;
		uvo.setEmail(e);
		String phone = num + phone_cen + phone_end;
		uvo.setPhone(phone);
		
		userJoinDAO.addUser(uvo);
		
		return "redirect:/home_complete.do?user_id="+uvo.getUser_id();
	}
	
	@RequestMapping("/home_complete.do")
	public ModelAndView join_complete(@RequestParam("user_id") String user_id) throws Exception{
		
		ModelAndView mnv = new ModelAndView("home_complete"); 
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	@RequestMapping("/overlap.do")
	@ResponseBody
	public String overlap(@ModelAttribute UserVO uvo) throws Exception{
		
		Integer r = userJoinDAO.ckId(uvo);
		return r.toString();
	}
/////////////////////회원가입 끝//////////////////////	
	
}
