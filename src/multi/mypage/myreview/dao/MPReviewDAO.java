package multi.mypage.myreview.dao;

import java.util.List;

import main.vo.ReviewVO;

public interface MPReviewDAO {
	public List<ReviewVO> review_findAll(String user_id);
}
