package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.NoticeVO;

public class Admin_NoticeDAO_MysqlImpl implements Admin_NoticeDAO {
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<NoticeVO> findAll() throws Exception {
		return sqlSession.selectList("admin_notice.p_admin_notice_FindAllTexts");
	}

	@Override
	public NoticeVO findByPK(NoticeVO pvo) throws Exception {
		return sqlSession.selectOne("admin_notice.p_admin_notice_FindText",pvo);
	}
	
	@Override
	public int add(NoticeVO pvo) throws Exception {
		return sqlSession.insert("admin_notice.p_admin_notice_AddText",pvo);
	}

	@Override
	public int mod(NoticeVO pvo) throws Exception {
		return sqlSession.update("admin_notice.p_admin_notice_modText",pvo);
	}

	@Override
	public int delByPK(NoticeVO pvo) throws Exception {
		return sqlSession.delete("admin_notice.p_admin_notice_DelByPK",pvo);
	}
}
