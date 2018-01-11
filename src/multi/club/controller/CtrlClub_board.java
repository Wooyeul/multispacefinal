package multi.club.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import main.vo.ClubVO;
import multi.club.dao.ClubDAO;
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_board_repleVO;

@Controller
public class CtrlClub_board {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
		//모임 커뮤니티 게시판 작성 페이지 호출
		@RequestMapping("/club_add_community_board.do")
		public ModelAndView club_add_community_board(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo) throws Exception {
			ModelAndView mnv = new ModelAndView("club_add_community_board");
			mnv.addObject("club_no", pvo.getClub_no());
			mnv.addObject("user_id", user_id);
			return mnv;
		}
		//모임 커뮤니티 게시판 글 작성
		@RequestMapping("/club_add_community_board_submit.do")
		public String club_add_community_board_submit(@ModelAttribute Club_boardVO pvo) throws Exception {
			clubDAO.club_add_community_board_submit(pvo);
			return "redirect:/club_community.do?club_no="+pvo.getClub_no();
		}
		
		//모임 커뮤니티 게시판 디테일 페이지 호출
		@RequestMapping("/club_board_detail.do")
		public ModelAndView club_board_detail(@CookieValue("user_id") String user_id, @ModelAttribute Club_boardVO pvo) throws Exception {
			ModelAndView mnv = new ModelAndView("club_board_detail");
			Club_boardVO vo = clubDAO.club_find_board_detail(pvo);
			List<Club_board_repleVO> reVO = clubDAO.club_find_board_reple(pvo);
			mnv.addObject("vo", vo);
			mnv.addObject("reVO", reVO);
			mnv.addObject("user_id", user_id);
			return mnv;
		}
		//모임 커뮤니티 게시판 수정 페이지 호출
		@RequestMapping("/club_mod_board_detail.do")
		public ModelAndView club_mod_board_detail(@ModelAttribute Club_boardVO pvo) throws Exception {
			ModelAndView mnv = new ModelAndView("club_mod_board_detail");
			System.out.println();
			Club_boardVO vo = clubDAO.club_find_board_detail(pvo);
			mnv.addObject("vo", vo);
			return mnv;
		}
		//모임 커뮤니티 게시판 수정 작업
		@RequestMapping("/club_mod_board_detail_submit.do")
		public String club_mod_board_detail_submit(@ModelAttribute Club_boardVO pvo) throws Exception {
			clubDAO.club_mod_board_detail(pvo);
			return "redirect:/club_board_detail.do?c_board_no="+pvo.getC_board_no();
		}
		
		//모임 커뮤니티 게시판 글 삭제
		@RequestMapping("/club_del_board_detail.do")
		public String club_del_board_detail(@ModelAttribute Club_boardVO pvo) throws Exception {
			clubDAO.club_del_board(pvo);
			return "redirect:/club_community.do?club_no="+pvo.getClub_no();
		}

		//모임 커뮤니티 게시판의 댓글 등록
		@RequestMapping("/club_add_board_reple.do")
		public String club_add_board_reple(@ModelAttribute Club_board_repleVO pvo) throws Exception {
			clubDAO.club_add_board_reple(pvo);
			return "redirect:/club_board_detail.do?c_board_no="+pvo.getC_board_no();
		}
		
		//모임 커뮤니티 게시판의 댓글 삭제
		@RequestMapping("/club_del_board_reple.do")
		@ResponseBody
		public String club_del_board_reple(@ModelAttribute Club_board_repleVO pvo) throws Exception {
			try{
				clubDAO.club_del_board_reple(pvo);
				return "ok";
			}catch(Exception e){
				return "no";
			}
		}

		//모임 커뮤니티 게시판의 댓글 수정
		@RequestMapping("/club_mod_board_reple.do")
		@ResponseBody
		public String club_mod_board_reple(@ModelAttribute Club_board_repleVO pvo) throws Exception {
			try{
				System.out.println(pvo.getC_board_reple_content());
				clubDAO.club_mod_board_reple(pvo);
				return "ok";
			}catch(Exception e){
				return "no";
			}
		}
}
