package multi.club.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ClubVO;
import main.vo.MessageVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.club.dao.ClubDAO;
import multi.club.vo.Club_applyVO;
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_noticeVO;

@Controller
public class CtrlClub {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
	//모임 리스트 페이지 호출
	@RequestMapping("/club_list.do")
	public ModelAndView club_list() throws Exception {
		ModelAndView mnv = new ModelAndView("club_list");
		List<ClubVO> pvo = clubDAO.club_findAll();
		mnv.addObject("pvo", pvo);
		return mnv;
	}
	
	//모임 등록 페이지 호출
	@RequestMapping("/club_add_page.do")
	public ModelAndView club_add_page() throws Exception {
		ModelAndView mnv = new ModelAndView("club_add_page");
		return mnv;
	}
	//모임 신청
	@RequestMapping("/club_apply.do")
	public ModelAndView club_apply(@ModelAttribute Club_applyVO pvo) throws Exception {
		clubDAO.club_add_apply(pvo);
		String url = "redirect:/club_detail.do?club_no="+pvo.getClub_no()+"&flag="+pvo.getFlag();
		ModelAndView mnv = new ModelAndView(url);
		return mnv;
	}
	
	//모임 등록 실행
	@RequestMapping("/club_add_page_submit.do")
	public String club_add_submit(HttpServletRequest request) throws Exception {
		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
	    int sizeLimit = 1024*1024*15;
	    MultipartRequest mpr = new MultipartRequest(request,savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	      
	    ClubVO pvo = new ClubVO();	      
	    pvo.setClub_name(mpr.getParameter("club_name"));
	    pvo.setClub_title(mpr.getParameter("club_title"));
	    pvo.setMax_member(Integer.parseInt(mpr.getParameter("max_member")));
	    pvo.setClub_content(mpr.getParameter("club_content"));
	    pvo.setClub_thumb_img(mpr.getFilesystemName("club_thumb_img"));
	    pvo.setL_category_no(Integer.parseInt(mpr.getParameter("l_category_no")));
	    pvo.setC_category_no(Integer.parseInt(mpr.getParameter("c_category_no")));
	    pvo.setUser_id(mpr.getParameter("user_id"));
		
	    System.out.println(pvo.getClub_thumb_img());
		clubDAO.club_add_page_submit(pvo);
		
		return "redirect:/club_list.do";
	}
	
	//모임 리스트 페이지 호출
	@RequestMapping("/club_detail.do")
	public ModelAndView club_detail(@ModelAttribute ClubVO pvo, @RequestParam("flag") int flag ) throws Exception {
		ModelAndView mnv = new ModelAndView("club_detail");
		ClubVO vo = clubDAO.club_find_detail(pvo);
		List<SpaceVO> sVO = clubDAO.club_find_detail_space(pvo);
		
		Club_applyVO club_applyVO = new Club_applyVO();
		club_applyVO.setClub_no(pvo.getClub_no());
		club_applyVO.setUser_id("admin2");
		club_applyVO = clubDAO.club_find_apply_detail(club_applyVO);

		mnv.addObject("vo", vo);
		mnv.addObject("sVO", sVO);
		mnv.addObject("flag", flag);
		mnv.addObject("club_applyVO", club_applyVO);
		return mnv;
	}
	
	//모임 커뮤니티 페이지 호출
	@RequestMapping("/club_community.do")
	public ModelAndView club_community(@ModelAttribute ClubVO pvo, @RequestParam("flag") int flag) throws Exception {
		ModelAndView mnv = new ModelAndView("club_community");
		ClubVO vo = clubDAO.club_find_detail(pvo);
		String master = clubDAO.club_find_master(pvo);
		List<Club_noticeVO> noticeVO = clubDAO.club_findAll_notice(pvo);
		List<Club_boardVO> boardVO = clubDAO.club_findAll_board(pvo);
		List<UserVO> userVO = clubDAO.club_find_community_user(pvo);
		List<Club_applyVO> applyVO = clubDAO.club_find_apply(pvo);

		mnv.addObject("vo", vo);
		mnv.addObject("master", master);
		mnv.addObject("noticeVO", noticeVO);
		mnv.addObject("boardVO", boardVO);
		mnv.addObject("userVO", userVO);
		mnv.addObject("applyVO", applyVO);
		mnv.addObject("flag", flag);

		return mnv;
	}
	//모임 신청자 수락
	@RequestMapping("/club_apply_agree.do")
	public String club_apply_agree(@ModelAttribute User_clubVO pvo) throws Exception {
		try{
			clubDAO.club_apply_agree(pvo);
			return "redirect:/club_community.do?club_no="+pvo.getClub_no()+"&flag=1";
			
		}catch(Exception e){
			return "redirect:/club_community.do?club_no="+pvo.getClub_no()+"&flag=-1";
		}
	}
	//모임 신청자 거절
	@RequestMapping("/club_apply_disagree.do")
	public String club_apply_disagree(@ModelAttribute User_clubVO pvo) throws Exception {
		clubDAO.club_apply_disagree(pvo);
		return "redirect:/club_community.do?club_no="+pvo.getClub_no();
	}
	
	//쪽지 보내기 팝업 실행
	@RequestMapping("/club_message_popup.do")
	public ModelAndView club_message_popup(@ModelAttribute MessageVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_message_popup");
		mnv.addObject("vo", pvo);
		return mnv;
	}
	//쪽지 보내기 팝업 실행
	@RequestMapping("/club_add_message.do")
	public ModelAndView club_add_message(@ModelAttribute MessageVO pvo) throws Exception {
		clubDAO.club_add_message(pvo);
		ModelAndView mnv = new ModelAndView("club_message_success");
		return mnv;
	}

}