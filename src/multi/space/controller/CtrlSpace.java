package multi.space.controller;

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
import main.ResponseBody;
import main.vo.BookingVO;
import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.ReviewVO;
import main.vo.SpaceVO;
import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;
import multi.space.dao.BookingDAO;
import multi.space.dao.ReviewDAO;
import multi.space.dao.SpaceDAO;
import multi.space.dao.Space_QnADAO;
import multi.space.dao.Space_QnA_RepleDAO;

@Controller
public class CtrlSpace {
	
	public Integer StringToInteger(String str){
		return Integer.parseInt(str);
	}
	
	@Autowired @Qualifier("spaceDAO")
	public SpaceDAO spaceDAO = null;
	
	@Autowired @Qualifier("bookingDAO")
	public BookingDAO bookingDAO = null;
	
	@Autowired @Qualifier("space_QnADAO")
	public Space_QnADAO space_QnADAO = null;
	
	@Autowired @Qualifier("space_QnA_RepleDAO")
	public Space_QnA_RepleDAO space_QnA_RepleDAO = null;
	
	@Autowired @Qualifier("reviewDAO")
	public ReviewDAO reviewDAO = null;
	
	//공간 첫화면
	@RequestMapping("/space_home.do")
	public ModelAndView space_home() throws Exception {
		ModelAndView mnv = new ModelAndView("space_home");
		List<SpaceVO> list = spaceDAO.find_space_all();
		mnv.addObject("list", list);
		return mnv;
	}
	
	//공간 등록 페이지
	@RequestMapping("/space_add.do")
	public String space_add() throws Exception{
		System.out.println("hi");
		return "space_add";
	}
	
	//공간 등록 작업
	@RequestMapping("/space_add2.do")
	public ModelAndView space_add2(HttpServletRequest request) throws Exception{
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
		String c_category_no_str = mpr.getParameter("c_category_no");
		Integer c_category_no = StringToInteger(c_category_no_str);
		System.out.println(c_category_no);
		
		String l_category_no_str = mpr.getParameter("l_category_no");
		Integer l_category_no = StringToInteger(l_category_no_str);
		
		vo.setCrn(crn); vo.setSpace_title(space_title); vo.setSpace_content(space_content); vo.setSpace_thumb_img(space_thumb_img); vo.setOpen_time(open_time);
		vo.setClose_time(close_time); vo.setPrice(price); vo.setMin_people(min_people); vo.setMax_people(max_people); vo.setSpace_call(space_call);
		vo.setC_category_no(c_category_no); vo.setL_category_no(l_category_no);
		
		spaceDAO.add_space(vo);
		return mnv;
	}
	
	//공간 상세
	@RequestMapping("/space_detail.do")
	public ModelAndView spacee_detail_find_by_pk(@ModelAttribute SpaceVO spaceVO,@ModelAttribute Space_qnaVO space_QnAVO,
			@ModelAttribute ReviewVO reviewVO) throws Exception{
		ModelAndView mnv = new ModelAndView("space_detail");
		List<Space_qnaVO> list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_QnAVO);
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		List<ReviewVO> list_review = reviewDAO.find_review_by_space_no(reviewVO);
		mnv.addObject("space", space);
		mnv.addObject("list_space_qna", list_space_qna);
		mnv.addObject("list_review", list_review);
		return mnv;
	}
	
	//공간 예약
	@RequestMapping("/space_reservation.do")
	public ModelAndView space_reseravtion_find_by_pk(@ModelAttribute SpaceVO spaceVO) throws Exception{
		ModelAndView mnv = new ModelAndView("space_reservation");
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		/*
		 나중에 수정해야함. 지금은 kmk4204로만 찾아옴. 로그인, 유저 연동하면 로그인 된 유저가
		가입된 클럽을 찾아올 수 있도록 수정*/
		List<ClubVO> club_list = spaceDAO.find_user_club();
		
		mnv.addObject("club_list", club_list);			
		mnv.addObject("space", space);
		return mnv;
	}
	
	//공간 결제 페이지
	@RequestMapping("/space_payment.do")
	public ModelAndView space_payment(@ModelAttribute BookingVO bookingVO,@ModelAttribute SpaceVO spaceVO) throws Exception{
		ModelAndView mnv = new ModelAndView("space_payment");
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		HostVO host = spaceDAO.find_host_by_space_no(spaceVO);
		
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
	public String add_space_qna(@ModelAttribute Space_qnaVO space_QnAVO) throws Exception{
		space_QnADAO.add_spaceQnA(space_QnAVO);
		return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no();
	}
	
	//space qna삭제
	@RequestMapping("/delete_space_qna.do")
	public String delete_space_qna(@ModelAttribute Space_qnaVO space_QnAVO) throws Exception{
		space_QnADAO.delete_spaceQnA_by_spane_qna_no(space_QnAVO);
		return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no();
	}
	
	//space reple 등록
	@RequestMapping("/add_space_qna_reple.do")
	public String add_space_qna_reple(@ModelAttribute Space_qna_repleVO space_QnA_RepleVO) throws Exception{
		space_QnA_RepleDAO.add_space_QnA_Reple_by_space_qna_no(space_QnA_RepleVO);
		return "redirect:/space_detail.do?space_no="+space_QnA_RepleVO.getSpace_no();
	}
	
	//qna_replw 뿌려주는 ajax
	@RequestMapping("/find_space_qna_reple.do")
	@ResponseBody
	public String find_space_qna_reple(@ModelAttribute Space_qna_repleVO space_QnA_RepleVO) throws Exception{
		Space_qna_repleVO space_qna_reple = space_QnA_RepleDAO.find_space_QnA_Reple(space_QnA_RepleVO);
		try{
		space_qna_reple.getSpace_qna_reple_content();
		String qna_reple = 
				" { 'qna_reple_content' :'"+ space_qna_reple.getSpace_qna_reple_content()+"',"
				+ "'qna_reple_title' :'"+space_qna_reple.getSpace_qna_reple_title()+"'}";
			return qna_reple;
		} catch( Exception e ) {return null;}	
	}
	
	
	//후기 작성
		@RequestMapping("/review_add.do")
		public ModelAndView add_review(@ModelAttribute ReviewVO reviewVO) throws Exception{
			ModelAndView mnv = new ModelAndView("review_add");
			mnv.addObject("review", reviewVO);
			return mnv;
		}
		
		
	//후기 추가
	@RequestMapping("/review_add2.do")
	public String add_review2(HttpServletRequest request) throws Exception{
		System.out.println("hi");
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
		return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no();
	}
	
	
}