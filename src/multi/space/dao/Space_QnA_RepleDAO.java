package multi.space.dao;

import java.util.List;

import main.vo.Space_qna_repleVO;

public interface Space_QnA_RepleDAO {
	public Integer add_space_QnA_Reple_by_space_qna_no(Space_qna_repleVO vo) throws Exception;
	public List<Space_qna_repleVO> find_space_QnA_Reple(Space_qna_repleVO vo) throws Exception;
}
