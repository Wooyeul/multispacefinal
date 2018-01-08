package multi.admin.dao;

import java.util.List;

import main.vo.ClubVO;


public interface Admin_ClubDAO {
	public List<ClubVO> findAllClub() throws Exception;
	public int removeClub( ClubVO cvo ) throws Exception;
	public ClubVO check_specific_Club( ClubVO cvo ) throws Exception;
}
