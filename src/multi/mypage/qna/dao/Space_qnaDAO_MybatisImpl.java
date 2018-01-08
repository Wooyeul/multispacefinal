package multi.mypage.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Space_qnaVO;

public class Space_qnaDAO_MybatisImpl implements Space_qnaDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public List<Space_qnaVO> find_qnaInfo(String user_id) throws Exception {
		return sqlSession.selectList("apple.mypage_qna_qnaInfo",user_id);
	}

}
