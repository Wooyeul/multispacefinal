package multi.mypage.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Space_qnaVO;
import multi.mypage.vo.Mypage_searchVO;

public class Space_qnaDAO_MybatisImpl implements Space_qnaDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public List<Space_qnaVO> find_qnaInfo(String user_id) throws Exception {
		return sqlSession.selectList("apple.mypage_qna_qnaInfo",user_id);
	}

	@Override
	public Space_qnaVO find_qnaByspace_no(String space_qna_no) throws Exception {
		return sqlSession.selectOne("apple.mypage_qna_byqnano",space_qna_no);
	}

	@Override
	public List<Space_qnaVO> search_QnA(Mypage_searchVO search) throws Exception {
		return sqlSession.selectList("apple.mypage_search_QnA",search);
	}

	@Override
	public int del_space_qna(String space_qna_no) throws Exception {
		return sqlSession.delete("apple.del_space_qna",space_qna_no);
	}

}
