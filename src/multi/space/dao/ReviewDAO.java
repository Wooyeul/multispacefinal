package multi.space.dao;

import java.util.List;

import main.vo.ReviewVO;

public interface ReviewDAO {
	public Integer add_review(ReviewVO vo) throws Exception;
	public List<ReviewVO> find_review_by_space_no(ReviewVO vo) throws Exception;
}