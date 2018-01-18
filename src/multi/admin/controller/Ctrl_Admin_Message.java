package multi.admin.controller;
 
import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.MessageVO;
import multi.admin.dao.Admin_MessageDAO;
import multi.admin.vo.Admin_searchVO;


/* 
�޽��� ����

// �޽��� ������ �ۼ� ������
Ư�� ���� ������ �̿�. �����̷�Ʈ �� ���� ����Ʈ Ȯ�� ������
Ư�� ���� ������ Ȯ���ϴ� ������
 */

@Controller
public class Ctrl_Admin_Message {
	@Autowired @Qualifier("admin_MessageDAO")
	private Admin_MessageDAO admin_MessageDAO = null;
	
	// �޽��� ������ �ۼ� ������
	@RequestMapping("/admin_message_write.do")
	public ModelAndView admin_message_write( ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_write");
		
		return mnv;
	}
	
	// �޽��� ������
	@RequestMapping("/admin_writing_message.do")
	@ResponseBody
	public String admin_writing_message( @ModelAttribute MessageVO mvo ) throws Exception {
		
		admin_MessageDAO.writing_message(mvo);
		
		return null;
	}
/*	@RequestMapping("/admin_writing_message.do")
	public ModelAndView admin_writing_message( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_MessageDAO.writing_message(mvo);
		mnv.setViewName("redirect:/admin_message_write.do");
		
		return mnv;
	}*/
	
	@RequestMapping("/admin_message_read_to.do")
	public ModelAndView admin_message_read_to( @ModelAttribute MessageVO mvo, 
			@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_read_to");
		/*List<MessageVO> ls = admin_MessageDAO.findToGetMessages();
		mnv.addObject("ls", ls);*/
		List<MessageVO> ls = admin_MessageDAO.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_MessageDAO.search_All(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		return mnv;
	}
}