package multi.mypage.mybookmark.dao;

import java.util.List;

import main.vo.BookmarkVO;
import main.vo.SpaceVO;

public interface BookmarkDAO {
	
	public List<SpaceVO> bookmarkFindAll(BookmarkVO bvo);
	public int bookmarkDel(int space_no);
}
