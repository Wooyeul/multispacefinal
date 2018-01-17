package multi.admin.dao;

import java.util.List;

import main.vo.ReviewVO;

public interface Admin_ReviewDAO {
	public List<ReviewVO> review_findAll() throws Exception;
	public int remove_review(ReviewVO rvo) throws Exception;

}
