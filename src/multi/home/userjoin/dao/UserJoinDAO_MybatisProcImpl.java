package multi.home.userjoin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;

public class UserJoinDAO_MybatisProcImpl implements UserJoinDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession;

	@Override
	public int addUser(UserVO uvo) throws Exception {
		
		return sqlSession.insert("userjoin.p_userJoin_add",uvo);
	}

	@Override
	public int ckId(UserVO uvo) throws Exception {
		
		return sqlSession.selectOne("userjoin.p_ckId",uvo);
	}
}
