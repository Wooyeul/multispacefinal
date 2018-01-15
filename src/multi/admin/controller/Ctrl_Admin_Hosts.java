package multi.admin.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.HostApplyVO;
import main.vo.HostVO;
import main.vo.UserVO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.vo.Admin_Host_DowngradeVO;
 
/* 
판매자 관리

판매자 리스트 호출 페이지
판매자 요청 정보 리스트 확인 페이지
특정 판매자 요청 정보 확인 페이지
특정 판매자 요청을 받아들일 때. 리다이렉트 시 판매자 요청 정보 리스트 확인 페이지
특정 판매자 요청을 거절 시 참고사항 작성 하는 페이지
거절 사유 작성 시 이용. 리다이렉트 시 특정 판매자 요청 정보 확인 페이지
특정 판매자 요청 정보 삭제하는 페이지. 리다이렉트 시 특정 판매자 요청 정보 확인 페이지
판매자로 등록된 사람 유저로 강등할 시 이용. 리다이렉트 시 판매자 리스트 정보 확인 페이지
판매자 유저 삭제. 리다이렉트 시 판매자 리스트 정보 확인 페이지
판매자 유저 특정 정보를 보고자 할 때 이용하는 페이지
 */

@Controller
public class Ctrl_Admin_Hosts {
	@Autowired @Qualifier("admin_HostDAO")
	private Admin_HostDAO admin_HostDAO = null;
	// 판매자 리스트 호출 페이지
	@RequestMapping("/admin_hosts.do")
	public ModelAndView admin_hosts() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_hosts");
		List<HostVO> ls = admin_HostDAO.host_findAll();
		mnv.addObject("ls", ls);
		return mnv;
	}
	// 판매자 요청 정보 리스트 확인 페이지
	@RequestMapping("/admin_host_request.do")
	public ModelAndView admin_host_request() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_request");
		List<HostApplyVO> ls = admin_HostDAO.host_request_findAll();
		mnv.addObject("ls", ls);
		return mnv;
	}
	// 특정 판매자 요청 정보 확인 페이지
	@RequestMapping("/admin_host_request_view.do")
	public ModelAndView admin_host_request_view( @ModelAttribute HostApplyVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_request_view");
		HostApplyVO vo = admin_HostDAO.host_check(hvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	// 특정 판매자 요청을 받아들일 때. 리다이렉트 시 판매자 요청 정보 리스트 확인 페이지
	@RequestMapping("/admin_host_user_accept.do")
	public ModelAndView admin_host_user_accept( @ModelAttribute HostApplyVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_HostDAO.host_user_accept(hvo);
		mnv.setViewName("redirect:/admin_host_request.do");
		return mnv;
	}
	// 특정 판매자 요청을 거절 시 참고사항 작성 하는 페이지
	@RequestMapping("/admin_host_user_refuse_write.do")
	public ModelAndView admin_host_user_refuse_write( @ModelAttribute HostApplyVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_user_refuse_write");
		mnv.addObject("vo", hvo);
		return mnv;
	}
	// 거절 사유 작성 시 이용. 리다이렉트 시 특정 판매자 요청 정보 확인 페이지
	@RequestMapping("/admin_host_user_refuse.do")
	public ModelAndView admin_host_user_refuse( @ModelAttribute HostApplyVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_HostDAO.host_user_refuse(hvo);
		mnv.setViewName("redirect:/admin_host_request.do");
		return mnv;
	}
	// 특정 판매자 요청 정보 삭제하는 페이지. 리다이렉트 시 특정 판매자 요청 정보 확인 페이지
	@RequestMapping("/admin_host_user_remove_request.do")
	public ModelAndView admin_host_user_remove_request( @ModelAttribute HostApplyVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_HostDAO.host_user_remove_request(hvo);
		mnv.setViewName("redirect:/admin_host_request.do");
		return mnv;
	}
	// 특정 판매자 요청을 거절 시 참고사항 작성 하는 페이지
	@RequestMapping("/admin_host_user_downgrade_write.do")
	public ModelAndView admin_host_user_downgrade_write( @ModelAttribute Admin_Host_DowngradeVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_user_downgrade_write");
		mnv.addObject("vo", hvo);
		return mnv;
	}
	// 판매자로 등록된 사람 유저로 강등할 시 이용. 리다이렉트 시 판매자 리스트 정보 확인 페이지
	@RequestMapping("/admin_host_user_downgrade.do")
	public ModelAndView admin_host_user_downgrade( @ModelAttribute Admin_Host_DowngradeVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_HostDAO.host_user_downgrade(hvo);
		mnv.setViewName("redirect:/admin_hosts.do"); 
		return mnv;
	}
	// 판매자 유저 삭제. 리다이렉트 시 판매자 리스트 정보 확인 페이지
	@RequestMapping("/admin_host_user_remove.do")
	public ModelAndView admin_host_user_remove( @ModelAttribute HostVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_HostDAO.host_user_remove(hvo);
		mnv.setViewName("redirect:/admin_hosts.do");
		return mnv;
	}
	// 판매자 유저 특정 정보를 보고자 할 때 이용하는 페이지
	@RequestMapping("/admin_host_user_check.do")
	public ModelAndView admin_host_user_check( @ModelAttribute HostVO hvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_user_check");
		UserVO vo = admin_HostDAO.host_user_check(hvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	
}