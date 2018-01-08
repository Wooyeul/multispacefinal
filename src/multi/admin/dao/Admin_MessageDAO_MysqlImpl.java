package multi.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.MessageVO;

public class Admin_MessageDAO_MysqlImpl implements Admin_MessageDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	@Override
	public int writing_message(MessageVO mvo) throws Exception {
		return sqlSession.insert("admin_message.p_admin_message_write",mvo);
	}
	
}
