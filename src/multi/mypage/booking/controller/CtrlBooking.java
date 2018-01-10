package multi.mypage.booking.controller;

import java.util.List;
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import multi.mypage.booking.dao.BookingDAO;
import multi.mypage.booking.dao.UserDAO;
import multi.mypage.booking.vo.BookingVO;
import main.vo.SpaceVO;
import main.vo.UserVO;


@Controller
public class CtrlBooking {

	@Autowired	@Qualifier("mypage_booking_UserDAO")
	private UserDAO UserDAO = null;
	
	@Autowired	@Qualifier("mypage_booking_BookingDAO")
	private BookingDAO BookingDAO = null;

	@RequestMapping("/mypage_moveMypageBookingPage.do")
	public ModelAndView moveMypageBookingPage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);		
		List<BookingVO> bookingInfo = BookingDAO.find_bookingInfo(user_id);
		
		if(userInfo != null){			
			ModelAndView mnv = new ModelAndView("mypage_booking");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("bookingInfo", bookingInfo);
			return mnv;
		}else{
			return null;
		}


	}
	@RequestMapping("/mypage_moveSpaceinfo.do")
	public ModelAndView moveSpaceinfo(@ModelAttribute SpaceVO svo) throws Exception {
		
		ModelAndView mnv = new ModelAndView("space_info");
		mnv.addObject("space_no", svo.getSpace_no());
		return mnv;

	}


}