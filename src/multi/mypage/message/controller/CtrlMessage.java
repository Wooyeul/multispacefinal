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

	@Autowired
	@Qualifier("mypage_message_UserDAO")
	private UserDAO UserDAO = null;

	@Autowired
	@Qualifier("mypage_message_MessageDAO")
	private MessageDAO MessageDAO = null;

	@Autowired
	@Qualifier("mypage_message_User_clubDAO")
	private User_clubDAO User_clubDAO = null;

	@RequestMapping("/mypage_moveMypageReceiveMessagePage.do")
	public ModelAndView moveMypageReceiveMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<MessageVO> receiveMessage = MessageDAO.find_receiveMessage(user_id);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_receive_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("receiveMessage", receiveMessage);
			return mnv;
		} else {
			return null;
		}
	}

	@RequestMapping("/mypage_moveMypageReceiveMessageRead.do")
	public ModelAndView moveMypageReceiveMessageRead(@CookieValue("user_id") String user_id,
			@ModelAttribute MessageVO mvo) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO receiveMessageRead = MessageDAO.read_receiveMessage(mvo);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_read_receive_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("receiveMessageRead", receiveMessageRead);
			return mnv;
		} else {
			return null;
		}

	}

	@RequestMapping("/mypage_moveMypageSendMessagePage.do")
	public ModelAndView moveMypageSendMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<MessageVO> sendMessage = MessageDAO.find_sendMessage(user_id);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_send_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("sendMessage", sendMessage);
			return mnv;
		} else {
			return null;
		}

	}

	@RequestMapping("/mypage_moveMypageSendMessageRead.do")
	public ModelAndView moveMypageSendMessageRead(@CookieValue("user_id") String user_id, @ModelAttribute MessageVO mvo)
			throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO sendMessageRead = MessageDAO.read_sendMessage(mvo);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_read_send_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("sendMessageRead", sendMessageRead);
			return mnv;
		} else {
			return null;
		}

	}

	@RequestMapping("/mypage_moveMypageWriteMessagePage.do")
	public ModelAndView moveMypageWriteMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<User_clubVO> user_clubInfo = User_clubDAO.find_user_clubInfo(user_id);
		System.out.println(user_clubInfo);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_write_send_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("user_clubInfo", user_clubInfo);
			return mnv;
		} else {
			return null;
		}

	}

	@RequestMapping("/mypage_moveMypageWriteMessageFindUserClubMemberPage.do")
	@ResponseBody
	public String moveMypageWriteMessageFindUserClubMemberPage(@CookieValue("user_id") String user_id,
			@ModelAttribute User_clubVO ucvo) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<User_clubVO> user_club_MemberInfo = User_clubDAO.find_user_club_MemberInfo(ucvo);

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
		return sb.toString();

	}

	@RequestMapping("/mypage_sendMessage.do")
	@ResponseBody
	public String sendMessage(@CookieValue("user_id") String user_id, @ModelAttribute MessageVO mvo) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);

		if (userInfo != null) {
			mvo.setSend_user_id(user_id);
			MessageDAO.send_Message(mvo);
			return "30003";
		} else {
			return "error";
		}

	}

}