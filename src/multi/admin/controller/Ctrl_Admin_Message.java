package multi.admin.controller;
 
import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.MessageVO;
import multi.admin.dao.Admin_MessageDAO;


/* 
메시지 관리

// 메시지 보내기 작성 페이지
특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
특정 모임 정보를 확인하는 페이지
 */

@Controller
public class Ctrl_Admin_Message {
	@Autowired @Qualifier("admin_MessageDAO")
	private Admin_MessageDAO admin_MessageDAO = null;
	
	// 메시지 보내기 작성 페이지
	@RequestMapping("/admin_message_write.do")
	public ModelAndView admin_message_write( ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_write");
		
		return mnv;
	}
	
	// 메시지 보내기
	@RequestMapping("/admin_writing_message.do")
	public ModelAndView admin_writing_message( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_MessageDAO.writing_message(mvo);
		mnv.setViewName("redirect:/admin_message_write.do");
		
		return mnv;
	}

	@RequestMapping("/admin_message_read_get.do")
	public ModelAndView admin_message_read_get( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_read_get");
		List<MessageVO> ls = admin_MessageDAO.findAllGetMessages();
		mnv.addObject("ls", ls);
		return mnv;
	}
	
	@RequestMapping("/admin_message_read_to.do")
	public ModelAndView admin_message_read_to( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_read_to");
		List<MessageVO> ls = admin_MessageDAO.findToGetMessages();
		mnv.addObject("ls", ls);
		return mnv;
	}
}