package multi.mypage.myinfo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;

public class MyInfoDAO_MybatisProcImpl implements MyInfoDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession  sqlSession = null; 
	
	@Override
	public int ckpass(UserVO uvo) throws Exception {
		return sqlSession.selectOne("myinfo.p_mypage_ckpass",uvo);
	}

	@Override
	public UserVO find_user(String user_id) throws Exception {
		return sqlSession.selectOne("myinfo.p_mypage_find_user",user_id);
	}

	@Override
	public int mod_user(UserVO uvo) throws Exception {
		return sqlSession.update("myinfo.p_mypage_mod_user",uvo);
	}

	@Override
	public int del_user(String user_id) throws Exception {
		return sqlSession.delete("myinfo.p_mypage_del_user",user_id);
	}
}
