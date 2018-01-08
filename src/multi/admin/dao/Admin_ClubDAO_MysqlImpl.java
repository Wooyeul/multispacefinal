package multi.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ClubVO;


public class Admin_ClubDAO_MysqlImpl implements Admin_ClubDAO {
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<ClubVO> findAllClub() throws Exception {
		return sqlSession.selectList("admin_club.p_admin_club_FindAllClubs");
	}

	@Override
	public int removeClub(ClubVO cvo) throws Exception {
		return sqlSession.delete("admin_club.p_admin_club_Remove",cvo);
	}

	@Override
	public ClubVO check_specific_Club(ClubVO cvo) throws Exception {
		return sqlSession.selectOne("admin_club.p_admin_club_FindSpecificClub", cvo);
	}

}
