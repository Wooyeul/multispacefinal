package multi.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.SpaceVO;

public class Admin_SpaceDAO_MysqlImpl implements Admin_SpaceDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	public List<SpaceVO> findHostPlaces( SpaceVO svo ) throws Exception {
		return sqlSession.selectList("admin_space.p_admin_host_space_check",svo);
	}

	@Override
	public List<SpaceVO> findAllPlacesCreatedDesc(SpaceVO svo) throws Exception {
		return sqlSession.selectList("admin_space.p_admin_space_created_desc");
	}

	@Override
	public List<SpaceVO> findAllPlacesCreatedAsc(SpaceVO svo) throws Exception {
		return sqlSession.selectList("admin_space.p_admin_space_created_asc");
	}

	@Override
	public List<SpaceVO> findAllPlacesPriceDesc(SpaceVO svo) throws Exception {
		return sqlSession.selectList("admin_space.p_admin_space_price_desc");
	}

	@Override
	public List<SpaceVO> findAllPlacesPriceAsc(SpaceVO svo) throws Exception {
		return sqlSession.selectList("admin_space.p_admin_space_price_asc");
	}

}
