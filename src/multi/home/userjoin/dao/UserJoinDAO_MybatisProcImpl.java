package multi.home.userjoin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;
import main.vo.ZipcodeVO;

public class UserJoinDAO_MybatisProcImpl implements UserJoinDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession;

	
	//회원가입
	@Override
	public int addUser(UserVO uvo) throws Exception {
		
		return sqlSession.insert("userjoin.p_userJoin_add",uvo);
	}

	//아이디 중복체크
	@Override
	public int ckId(UserVO uvo) throws Exception {
		
		return sqlSession.selectOne("userjoin.p_ckId",uvo);
	}

	//zipcode테이블 추가
	@Override
	public int addZipcode(ZipcodeVO zvo) throws Exception {
		return sqlSession.insert("userjoin.p_user_zipcode_add",zvo);
	}
}
