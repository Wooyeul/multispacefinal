package multi.mypage.myclub.dao;

import java.util.List;

import main.vo.ClubVO;

public interface MyclubDAO {
	public List<ClubVO> find_myClub(String user_id);
}
