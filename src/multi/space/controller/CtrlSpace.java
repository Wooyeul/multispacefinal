package multi.space.controller;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.BookingVO;
import main.vo.BookmarkVO;
import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.ReviewVO;
import main.vo.SpaceVO;
import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;
import main.vo.UserVO;
import multi.space.dao.BookingDAO;
import multi.space.dao.BookmarkDAO;
import multi.space.dao.HostDAO;
import multi.space.dao.ReviewDAO;
import multi.space.dao.SpaceDAO;
import multi.space.dao.Space_QnADAO;
import multi.space.dao.Space_QnA_RepleDAO;
import multi.space.dao.UserDAO;
import multi.space.vo.Space_searchVO;

@Controller
public class CtrlSpace {
	
	public Integer StringToInteger(String str){
		return Integer.parseInt(str);
	}
	
	@Autowired @Qualifier("space_spaceDAO")
	public SpaceDAO spaceDAO = null;
	
	@Autowired @Qualifier("space_bookingDAO")
	public BookingDAO bookingDAO = null;
	
	@Autowired @Qualifier("space_space_QnADAO")
	public Space_QnADAO space_QnADAO = null;
	
	@Autowired @Qualifier("space_space_QnA_RepleDAO")
	public Space_QnA_RepleDAO space_QnA_RepleDAO = null;
	
	@Autowired @Qualifier("space_reviewDAO")
	public ReviewDAO reviewDAO = null;
	
	@Autowired @Qualifier("space_userDAO")
	public UserDAO userDAO = null;
	
	@Autowired @Qualifier("space_hostDAO")
	public HostDAO hostDAO = null;
	
	@Autowired @Qualifier("space_bookmarkDAO")
	public BookmarkDAO bookmarkDAO = null;
	

	
	//공간 첫화면
	@RequestMapping("/space_home.do")
	public ModelAndView space_home(@RequestParam("space_code") String space_code) throws Exception {
		ModelAndView mnv = new ModelAndView("space_home");
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		List<Map<Integer,String>> category_list = spaceDAO.find_s_category();
		
		mnv.addObject("space_code", space_code);
		mnv.addObject("local_list", local_list);
		mnv.addObject("category_list", category_list);
		return mnv;
	}
	
	//공간 첫화면 아이프레임
	@RequestMapping("/space_home_iframe.do")
	public ModelAndView space_home_iframe(@ModelAttribute Space_searchVO search,@RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("space_home_iframe");
		List<SpaceVO> list2 = spaceDAO.search_space(search); // 찾고자 하는 게시판의 전체 글 갯수를 가져와야합니다.
		/*
		 * 처음 시작에는 검색이 되지 않은 전체 글 갯수가 리턴됩니당. 100개 글이면 처음 들어갈 땐 검색이 없기 때문에 100개가 리턴됨.
		 */
		PaginationDTO pz = new PaginationDTO().init(pg, list2.size()) ;
		/* pg값은 현재 페이지를 뜻합니다!
		 * 처음 시작에는 pg 값이 없기 때문에 PaginationDTO에서 pg값이 null일 경우 1로 만들어주기 때문에 현재 페이지 1로 페이지네이션이 시작됩니다.
		 * 
		 */
		search.setStart_no(pz.getSkip());
		list2 = spaceDAO.search_space(search);
		
		
		
		
		mnv.addObject("list2", list2);
		mnv.addObject("pz", pz); // 페이지네이션을 심어줍니다!
		mnv.addObject("search", search);
		return mnv;
	}
	
	
	//공간 등록 페이지
	@RequestMapping("/space_add.do")
	public ModelAndView space_add(@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null || user_id.length()<=1){
			ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
			return mnv;
		}
		UserVO user2 = userDAO.find_user_by_user_id(user_id);
		List<HostVO> host = hostDAO.find_host_by_user_id(user_id);
		
		//등급이 판매자가 아니면 홈화면으로 돌려보냄
		if(user2.getGrade()!=2){
			ModelAndView mnv = new ModelAndView("redirect:/space_home.do?space_code=20007");
			return mnv;
		}
		
		ModelAndView mnv = new ModelAndView("space_add");
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		List<Map<Integer,String>> category_list = spaceDAO.find_s_category();
		
		mnv.addObject("local_list", local_list);
		mnv.addObject("category_list", category_list);
		mnv.addObject("host", host);
		return mnv;
	}
	
	//공간 등록 작업
	@RequestMapping("/space_add2.do")
	public ModelAndView space_add2(HttpServletRequest request,@CookieValue("user_id") String user_id) throws Exception{
		ModelAndView mnv = new ModelAndView("redirect:/space_add_clear.jsp");
		//String savePath = request.getServletContext().getRealPath("images");
		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
		
		SpaceVO vo = new SpaceVO();
		
		String crn = mpr.getParameter("crn");
		String space_title = mpr.getParameter("space_title");
		String space_content = mpr.getParameter("space_content");
		String space_thumb_img = mpr.getFilesystemName("space_thumb_img");
		
		String open_time = mpr.getParameter("open_time");
		
		String close_time= mpr.getParameter("close_time");
		
		String price_str = mpr.getParameter("price");
		Integer price = StringToInteger(price_str);
		
		String min_people_str = mpr.getParameter("min_people");
		Integer min_people = StringToInteger(min_people_str);
		
		String max_people_str = mpr.getParameter("max_people");
		Integer max_people = StringToInteger(max_people_str);
		
		String space_call = mpr.getParameter("space_call");
		String s_category_no_str = mpr.getParameter("s_category_no");
		Integer s_category_no = StringToInteger(s_category_no_str);
		
		String l_category_no_str = mpr.getParameter("l_category_no");
		Integer l_category_no = StringToInteger(l_category_no_str);
		
		vo.setCrn(crn); vo.setSpace_title(space_title); vo.setSpace_content(space_content); vo.setSpace_thumb_img(space_thumb_img); vo.setOpen_time(open_time);
		vo.setClose_time(close_time); vo.setPrice(price); vo.setMin_people(min_people); vo.setMax_people(max_people); vo.setSpace_call(space_call);
		vo.setS_category_no(s_category_no); vo.setL_category_no(l_category_no);
		
		spaceDAO.add_space(vo);
		return mnv;
	}
	
	//공간 삭제
	@RequestMapping("/space_del.do")
	public String space_del(@ModelAttribute SpaceVO spaceVO) throws Exception{
		spaceDAO.del_space_by_space_no(spaceVO);
		return "redirect:/space_home.do?space_code=20006";
	}
	
	//공간 수정
	@RequestMapping("/space_mod.do")
	public ModelAndView space_mod(@ModelAttribute SpaceVO spaceVO) throws Exception{
		ModelAndView mnv = new ModelAndView("space_mod");
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		List<Map<Integer,String>> category_list = spaceDAO.find_s_category();
		
		mnv.addObject("local_list", local_list);
		mnv.addObject("category_list", category_list);
		mnv.addObject("space", spaceVO);
		return mnv;
	}
	
	//공간 수정
		@RequestMapping("/space_mod2.do")
		public ModelAndView space_mod2(@ModelAttribute SpaceVO spaceVO) throws Exception{

			spaceDAO.mod_space(spaceVO);
			ModelAndView mnv = new ModelAndView("redirect:/space_detail.do?space_no="+spaceVO.getSpace_no());
			return mnv;
		}
	
	//공간 상세
	@RequestMapping("/space_detail.do")
	public ModelAndView spacee_detail_find_by_pk(@ModelAttribute SpaceVO spaceVO,@ModelAttribute Space_qnaVO space_QnAVO,
			@ModelAttribute ReviewVO reviewVO,@ModelAttribute BookmarkVO bookmark, @CookieValue("user_id") String user_id,@RequestParam("space_code") String space_code
			,HttpServletRequest request) throws Exception{
		ModelAndView mnv = new ModelAndView("space_detail");
		List<Space_qnaVO> list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_QnAVO);
		
		
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);

		List<ReviewVO> list_review = reviewDAO.find_review_by_space_no(reviewVO);

		String s_category = spaceDAO.find_s_category_by_space_no(spaceVO);

		List<HostVO> host = hostDAO.find_host_by_user_id(user_id);
		
		bookmark.setUser_id(user_id);
		BookmarkVO return_bookmark = bookmarkDAO.find_bookmark(bookmark);
		
		mnv.addObject("bookmark", return_bookmark);
		mnv.addObject("space", space);
		mnv.addObject("list_space_qna", list_space_qna);
		mnv.addObject("list_review", list_review);
		mnv.addObject("user_id", user_id);
		mnv.addObject("space_code", space_code);
		mnv.addObject("s_category", s_category);
		mnv.addObject("host", host);
		return mnv;
	}
	
	//공간 예약
	@RequestMapping("/space_reservation.do")
	public ModelAndView space_reseravtion_find_by_pk(@ModelAttribute SpaceVO spaceVO,@CookieValue("user_id") String user_id,@ModelAttribute BookingVO bookingVO) throws Exception{
		if(user_id==null || user_id.length()<=1){
			ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
			return mnv;
		}
		
		ModelAndView mnv = new ModelAndView("space_reservation");
		String booking_date = "2018-01-15";
		bookingVO.setBooking_date(booking_date);
		System.out.println(bookingVO.getSpace_no());
		System.out.println(bookingVO.getBooking_date());
		
		List<BookingVO> booking_list = bookingDAO.find_booking_by_space_no_and_booking_date(bookingVO);

		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		List<ClubVO> club_list = spaceDAO.find_user_club(user_id);
		mnv.addObject("club_list", club_list);			
		mnv.addObject("space", space);
		mnv.addObject("user_id", user_id);
		mnv.addObject("booking_list", booking_list);
		return mnv;
	}
	
	//공간 결제 페이지
	@RequestMapping("/space_payment.do")
	public ModelAndView space_payment(@ModelAttribute BookingVO bookingVO,@ModelAttribute SpaceVO spaceVO,@CookieValue("user_id") String user_id) throws Exception{
		System.out.println(user_id);
		if(user_id==null || user_id.length()<=1 ){
			ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
			return mnv;
		}
		ModelAndView mnv = new ModelAndView("space_payment");
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		HostVO host = spaceDAO.find_host_by_space_no(spaceVO);
		System.out.println(bookingVO.getBooking_date());
		mnv.addObject("host", host);
		mnv.addObject("space", space);
		mnv.addObject("booking", bookingVO);
		return mnv;
	}
	
	//공간 결제 완료 페이지
	@RequestMapping("/space_payment_clear.do")
	public ModelAndView space_payment_clear(@ModelAttribute BookingVO bookingVO) throws Exception{
		ModelAndView mnv = new ModelAndView("space_payment_clear");
		bookingDAO.add_booking(bookingVO);
		mnv.addObject("booking", bookingVO);
		return mnv;
	}
	
	//space qna등록
	@RequestMapping("/add_space_qna.do")
	public String add_space_qna(@ModelAttribute Space_qnaVO space_QnAVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null || user_id.length()<=1 ){
			return "redirect:/home_moveLoginPage.do";
		}
		space_QnADAO.add_spaceQnA(space_QnAVO);
		return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no()+"&space_code=20006";
	}
	
	//space qna삭제
	@RequestMapping("/delete_space_qna.do")
	public String delete_space_qna(@ModelAttribute Space_qnaVO space_QnAVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		
		Space_qnaVO qna = space_QnADAO.find_space_QnA_by_space_qna_no(space_QnAVO);
		if(user_id.equals(qna.getUser_id())) {
			space_QnADAO.delete_spaceQnA_by_spane_qna_no(space_QnAVO);
			space_QnA_RepleDAO.delete_spaceQnA_by_space_qna_no(space_QnAVO);
			return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no()+"&space_code=20005";
			
		}
		return "redirect:/space_detail.do?space_no="+qna.getSpace_no()+"&space_code=20001";
	}
	
	//qna 수정
	@RequestMapping("/mod_space_qna.do")
	public String mod_space_qna(@ModelAttribute Space_qnaVO space_QnAVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		Space_qnaVO qna = space_QnADAO.find_space_QnA_by_space_qna_no(space_QnAVO);
		if(user_id.equals(qna.getUser_id())) {
			space_QnADAO.mod_spaceQnA_by_spane_qna_no(space_QnAVO);
			return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no()+"&space_code=20004";
			
		}
		return "redirect:/space_detail.do?space_no="+qna.getSpace_no()+"&space_code=20001";
	}
	
	//space reple 등록
	@RequestMapping("/add_space_qna_reple.do")
	public String add_space_qna_reple(@ModelAttribute Space_qna_repleVO space_QnA_RepleVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		space_QnA_RepleDAO.add_space_QnA_Reple_by_space_qna_no(space_QnA_RepleVO);
		return "redirect:/space_detail.do?space_no="+space_QnA_RepleVO.getSpace_no();
	}
	
	//qna_replw 뿌려주는 ajax
	@RequestMapping("/find_space_qna_reple.do")
	@ResponseBody
	public String find_space_qna_reple(@ModelAttribute Space_qna_repleVO space_QnA_RepleVO) throws Exception{
		Space_qna_repleVO space_qna_reple = space_QnA_RepleDAO.find_space_QnA_Reple(space_QnA_RepleVO);
		try{
		String qna_reple = 
				" { 'qna_reple_content' :'"+ space_qna_reple.getSpace_qna_reple_content()+"',"
				+ "'qna_reple_title' :'"+space_qna_reple.getSpace_qna_reple_title()+"'}";
			return qna_reple;
		} catch( Exception e ) {return null;}	
	}
	
	
	//후기 작성
		@RequestMapping("/review_add.do")
		public ModelAndView add_review(@ModelAttribute ReviewVO reviewVO,@CookieValue("user_id") String user_id) throws Exception{
			if(user_id==null|| user_id.length()<=1){
				ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
				return mnv;
			}
			ModelAndView mnv = new ModelAndView("review_add");
			mnv.addObject("review", reviewVO);
			return mnv;
		}
		
		
	//후기 추가
	@RequestMapping("/review_add2.do")
	public String add_review2(HttpServletRequest request) throws Exception{
		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\review_img";
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
		
		String review_title = mpr.getParameter("review_title");
		
		String review_content = mpr.getParameter("review_content");
		
		String user_id = mpr.getParameter("user_id");
		
		String space_no_str = mpr.getParameter("space_no");
		Integer space_no = Integer.parseInt(space_no_str);
		
		String review_score_str = mpr.getParameter("review_score");
		Double review_score = Double.parseDouble(review_score_str);
		
		String review_img = mpr.getFilesystemName("review_img");
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReview_title(review_title);
		reviewVO.setReview_content(review_content);
		reviewVO.setUser_id(user_id);
		reviewVO.setSpace_no(space_no);
		reviewVO.setReview_img(review_img);
		reviewVO.setReview_score(review_score);
		
		reviewDAO.add_review(reviewVO);
		return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no()+"&space_code=20003";
	}
	
	//후기 삭제
	@RequestMapping("/del_review.do")
	public String del_review(@ModelAttribute ReviewVO reviewVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		ReviewVO review = reviewDAO.find_review_by_review_no(reviewVO);
		if(user_id.equals(review.getUser_id())) {
			reviewDAO.del_review(reviewVO);
			return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no()+"&space_code=20002";
		}
		return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no()+"&space_code=20001";
		
	}
	
	//북마크 등록
	@RequestMapping("/add_bookmark.do")
	@ResponseBody
	public String add_bookmark(@ModelAttribute BookmarkVO bookmark) throws Exception{
		bookmarkDAO.add_bookmark(bookmark);
		return null;
	}
	
	//북마크 해제
	@RequestMapping("/del_bookmark.do")
	@ResponseBody
	public String del_bookmark(@ModelAttribute BookmarkVO bookmark) throws Exception{
		bookmarkDAO.del_bookmark(bookmark);
		return null;
	}
	
	
}