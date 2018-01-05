package multi.space.dao;

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
	
}
