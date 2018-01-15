package multi.mypage.myhost.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.mypage.myhost.dao.MyHostDAO;

/**
 * @author sb
 * 마이페이지 판매자 페이지
 */
@Controller
public class CtrlMypageMyHost {
	
	@Autowired @Qualifier("myhostDAO")
	private MyHostDAO myhostDAO;
	
	//판매자 여부 확인
	@RequestMapping("/myhost_findAll.do")
	public ModelAndView findHost(@CookieValue("user_id") String user_id,@ModelAttribute HostVO hvo) throws Exception{
		
		ModelAndView mnv = new ModelAndView();
		int flag = myhostDAO.ckhost(user_id);
		mnv.addObject("user_id", user_id);
		if(flag >= 1){
			//이미 판매자일때
			mnv.setViewName("myhost_findSpace");
			List<SpaceVO> rl = myhostDAO.findMySpace(user_id);
			
			mnv.addObject("rl", rl);
		} else if(flag == 0 ){	
			//판매자 아닐때
			mnv.setViewName("myhost_addButton");
		}
		mnv.addObject("flag", flag);
		
		return mnv;
	}
	
	//판매자 추가
	@RequestMapping("/myhost_addForm.do")
	public ModelAndView addHost(@ModelAttribute HostVO hvo)throws Exception{
		
		ModelAndView mnv = new ModelAndView("myhost_addForm");
		mnv.addObject("user_id",hvo.user_id);
		
		return mnv;
	}
	@RequestMapping("/myhost_addhost.do")
	public ModelAndView addHost2(@ModelAttribute HostVO hvo)throws Exception{
		
		ModelAndView mnv = new ModelAndView("myhost_addCom");
		myhostDAO.addhost(hvo);
		
		return mnv;
	}
	
}
