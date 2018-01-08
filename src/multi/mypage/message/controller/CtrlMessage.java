package multi.mypage.message.controller;

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
import main.ResponseBody;
import multi.mypage.message.dao.MessageDAO;
import multi.mypage.message.dao.UserDAO;
import multi.mypage.message.dao.User_clubDAO;
import main.vo.MessageVO;
import main.vo.UserVO;
import main.vo.User_clubVO;

@Controller
public class CtrlMessage {

	@Autowired	@Qualifier("mypage_message_UserDAO")
	private UserDAO UserDAO = null;
	
	@Autowired	@Qualifier("mypage_message_MessageDAO")
	private MessageDAO MessageDAO = null;
	
	@Autowired	@Qualifier("mypage_message_User_clubDAO")
	private User_clubDAO User_clubDAO = null;

	@RequestMapping("/mypage_moveMypageReceiveMessagePage.do")
	public ModelAndView moveMypageReceiveMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<MessageVO> receiveMessage = MessageDAO.find_receiveMessage(user_id);
		
		
		ModelAndView mnv = new ModelAndView("mypage_receive_message");
		mnv.addObject("userInfo", userInfo);
		mnv.addObject("receiveMessage", receiveMessage);
		return mnv;

	}
	
	@RequestMapping("/mypage_moveMypageReceiveMessageRead.do")
	public ModelAndView moveMypageReceiveMessageRead(@CookieValue("user_id") String user_id,@RequestParam("msg_no")String msg_no) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO receiveMessageRead = MessageDAO.read_receiveMessage(msg_no);

		ModelAndView mnv = new ModelAndView("mypage_read_receive_message");
		mnv.addObject("userInfo", userInfo);
		mnv.addObject("receiveMessageRead", receiveMessageRead);
		return mnv;

	}
	
	@RequestMapping("/mypage_moveMypageSendMessagePage.do")
	public ModelAndView moveMypageSendMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<MessageVO> sendMessage = MessageDAO.find_sendMessage(user_id);
		
		
		ModelAndView mnv = new ModelAndView("mypage_send_message");
		mnv.addObject("userInfo", userInfo);
		mnv.addObject("sendMessage", sendMessage);
		return mnv;

	}
	
	
	@RequestMapping("/mypage_moveMypageSendMessageRead.do")
	public ModelAndView moveMypageSendMessageRead(@CookieValue("user_id") String user_id,@RequestParam("msg_no")String msg_no) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO sendMessageRead = MessageDAO.read_sendMessage(msg_no);

		ModelAndView mnv = new ModelAndView("mypage_read_send_message");
		mnv.addObject("userInfo", userInfo);
		mnv.addObject("sendMessageRead", sendMessageRead);
		return mnv;

	}

	@RequestMapping("/mypage_moveMypageWriteMessagePage.do")
	public ModelAndView moveMypageWriteMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<User_clubVO> user_clubInfo = User_clubDAO.find_user_clubInfo(user_id);
		
		ModelAndView mnv = new ModelAndView("mypage_write_send_message");
		mnv.addObject("userInfo", userInfo);
		mnv.addObject("user_clubInfo", user_clubInfo);
		return mnv;

	}
	

	@RequestMapping("/mypage_moveMypageWriteMessageFindUserClubMemberPage.do")
	@ResponseBody
	public String moveMypageWriteMessageFindUserClubMemberPage(@CookieValue("user_id") String user_id,@RequestParam("club_no")String club_no) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<User_clubVO> user_club_MemberInfo = User_clubDAO.find_user_club_MemberInfo(club_no);

		StringBuffer sb = null;

		for (User_clubVO vo : user_club_MemberInfo) {

			if (sb == null) {
				sb = new StringBuffer();
				sb.append("{data:[");
			} else {
				sb.append(",");
			}
			sb.append("'").append(vo.getUser_id()).append("'");

			// System.out.println("user_id : " + rl.getUser_id());

		}
		sb.append("]}");
		System.out.println(sb.toString());
		return sb.toString();

	}
	
	

}