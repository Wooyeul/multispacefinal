package multi.mypage.booking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;
import multi.mypage.booking.vo.BookingVO;

public class BookingDAO_MybatisImpl implements BookingDAO{
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	
	@Override
	public UserVO find_userInfo(String user_id) throws Exception {
		return sqlSession.selectOne("apple.mypage_booking_userInfo",user_id);
	}
	
	@Override
	public List<BookingVO> find_bookingInfo(String user_id) throws Exception {
		return sqlSession.selectList("apple.mypage_bookingInfo",user_id);
	}

}
