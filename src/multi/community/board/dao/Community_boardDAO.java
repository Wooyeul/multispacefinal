package multi.community.board.dao;

import java.util.List;

import main.vo.Community_boardVO;

public interface Community_boardDAO {
	
	public List<Community_boardVO> findAll( String user_id) throws Exception;
	public Community_boardVO findByPK(Community_boardVO pvo) throws Exception;
	public int add(Community_boardVO pvo) throws Exception;
	public int delByPK(Community_boardVO pvo) throws Exception;
	public int mod(Community_boardVO pvo)throws Exception;
	public int incRecomLogic( Community_boardVO pvo ) throws Exception;
	public int incViewLogic(Community_boardVO pvo) throws Exception;
	

	

}


