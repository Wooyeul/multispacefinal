package multi.mypage.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import main.vo.Space_qnaVO;



public interface Space_qnaDAO {
	
	public List<Space_qnaVO> find_qnaInfo(String user_id) throws Exception;
}
