package multi.mypage.myclub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ClubVO;

public class MyclubDAO_MybatisProcImpl implements MyclubDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null; 
	
	@Override
	public List<ClubVO> find_myClub(String user_id) {
		return sqlSession.selectList("myclub.p_myclub_find",user_id);
	}
}
