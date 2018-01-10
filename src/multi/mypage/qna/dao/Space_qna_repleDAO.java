package multi.mypage.qna.dao;

import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;

public interface Space_qna_repleDAO {
	public Space_qna_repleVO find_qna_repleInfo(Space_qnaVO sqvo) throws Exception;
}
