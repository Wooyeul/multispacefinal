package multi.mypage.myreview.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ReviewVO;

public class MPReviewDAO_MybatisProcImpl implements MPReviewDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	
	@Override
	public List<ReviewVO> review_findAll(String user_id) {
		return sqlSession.selectList("mypage_review.p_MPreview_find",user_id);
	}
}
