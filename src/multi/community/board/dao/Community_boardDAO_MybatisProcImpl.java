package multi.community.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Community_boardVO;

public class Community_boardDAO_MybatisProcImpl implements Community_boardDAO{
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	
	@Override
	public List<Community_boardVO> findAll( String user_id) throws Exception {
		return sqlSession.selectList("community_board.p_comm_boardFindAllTexts");
	}


	@Override
	public Community_boardVO findByPK(Community_boardVO pvo) throws Exception {
		return sqlSession.selectOne("community_board.p_comm_boardFindText",pvo);
	}


	@Override
	public int add(Community_boardVO pvo) throws Exception {
		return sqlSession.insert("community_board.p_comm_boardAdd",pvo);
	}


	@Override
	public int delByPK(Community_boardVO pvo) throws Exception {
		
		return sqlSession.delete("community_board.p_comm_boardDelByPK",pvo);
	}


	@Override
	public int mod(Community_boardVO pvo) throws Exception {
	
		return sqlSession.update("community_board.p_comm_boardMod",pvo);
	}


	@Override
	public int incRecomLogic(Community_boardVO pvo) throws Exception {
		
		return sqlSession.update("community_board.p_comm_boardIncRecomLogic",pvo);
	}


	@Override
	public int incViewLogic(Community_boardVO pvo) throws Exception {
		
		return sqlSession.update("community_board.p_comm_boardIncViewLogic",pvo);
	}


	
}
