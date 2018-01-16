package multi.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ReviewVO;

public class Admin_ReviewDAO_MysqlImpl implements Admin_ReviewDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<ReviewVO> review_findAll() throws Exception {
		
		return sqlSession.selectList("admin_community_review.p_admin_comm_boardreviewFindAllTexts");
	}

}
