package multi.club.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.ClubVO;
import multi.club.dao.ClubDAO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_notice_repleVO;

@Controller
public class CtrlClub_notice {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
	//���� Ŀ�´�Ƽ �������� �ۼ� ������ ȣ��
	@RequestMapping("/club_add_community_notice.do")
	public ModelAndView club_add_community_notice(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_add_community_notice");
		mnv.addObject("club_no", pvo.getClub_no());
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	//���� Ŀ�´�Ƽ �������� �ۼ�
	@RequestMapping("/club_add_community_notice_submit.do")
	public String club_add_community_notice_submit(@ModelAttribute Club_noticeVO pvo) throws Exception {
		clubDAO.club_add_community_notice_submit(pvo);
		return "redirect:/club_community.do?club_no="+pvo.getClub_no();
	}
	
	//���� Ŀ�´�Ƽ �������� ������ ������ ȣ��
	@RequestMapping("/club_notice_detail.do")
	public ModelAndView club_notice_detail(@CookieValue("user_id") String user_id, @ModelAttribute Club_noticeVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_notice_detail");
		//�������� ������ ��ȸ
		Club_noticeVO vo = clubDAO.club_find_notice_detail(pvo);
		
		//���� ����Ʈ ��ȸ
		List<Club_notice_repleVO> reVO = clubDAO.club_find_notice_reple(pvo);

		mnv.addObject("vo", vo);
		mnv.addObject("reVO", reVO);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//���� �������� ���� ������ ȣ��
	@RequestMapping("/club_mod_notice_detail.do")
	public ModelAndView club_mod_notice_detail(@ModelAttribute Club_noticeVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_mod_notice_detail");
		Club_noticeVO vo = clubDAO.club_find_notice_detail(pvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	//���� �������� ����
	@RequestMapping("/club_mod_notice_detail_submit.do")
	public String club_mod_notice_detail_submit(@ModelAttribute Club_noticeVO pvo) throws Exception {
		clubDAO.club_mod_notice_detail(pvo);
		return "redirect:/club_notice_detail.do?c_notice_no="+pvo.getC_notice_no();
	}
	//���� �������� ����
	@RequestMapping("/club_del_notice_detail.do")
	public String club_del_notice_detail(@ModelAttribute Club_noticeVO pvo) throws Exception {
		clubDAO.club_del_notice_detail(pvo);
		return "redirect:/club_community.do?club_no="+pvo.getClub_no();
	}
	
	//���� Ŀ�´�Ƽ �������� ��� �ۼ�
	@RequestMapping("/club_add_notice_reple.do")
	public String club_add_notice_reple(@ModelAttribute Club_notice_repleVO pvo) throws Exception {
		clubDAO.club_add_notice_reple(pvo);
		return "redirect:/club_notice_detail.do?c_notice_no="+pvo.getC_notice_no();
	}
	//���� Ŀ�´�Ƽ �������� ��� ����
	@RequestMapping("/club_del_notice_reple.do")
	public String club_del_notice_reple(@ModelAttribute Club_notice_repleVO pvo) throws Exception {
		clubDAO.club_del_notice_reple(pvo);
		return "redirect:/club_notice_detail.do?c_notice_no="+pvo.getC_notice_no();
	}
	//���� Ŀ�´�Ƽ �������� ��� ����
	@RequestMapping("/club_mod_notice_reple.do")
	public String club_mod_notice_reple(@ModelAttribute Club_notice_repleVO pvo) throws Exception {
		clubDAO.club_mod_notice_reple(pvo);
		return "redirect:/club_notice_detail.do?c_notice_no="+pvo.getC_notice_no();
	}
	
}
