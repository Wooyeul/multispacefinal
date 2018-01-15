package multi.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.BookingVO;

public class BookingDAO_MySQLImpl implements BookingDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public Integer add_booking(BookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("booking.add_booking",vo);
	}

	@Override
	public List<BookingVO> find_booking_by_space_no_and_booking_date(BookingVO booking) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("booking.find_booking_by_space_no_and_booking_date",booking);
	}
	
}
