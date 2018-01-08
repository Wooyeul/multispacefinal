package multi.admin.dao;

import java.util.List;

import main.vo.SpaceVO;

public interface Admin_SpaceDAO {
	public List<SpaceVO> findHostPlaces( SpaceVO svo ) throws Exception;
	public List<SpaceVO> findAllPlacesCreatedDesc( SpaceVO svo ) throws Exception;	
	public List<SpaceVO> findAllPlacesCreatedAsc( SpaceVO svo ) throws Exception;
	public List<SpaceVO> findAllPlacesPriceDesc( SpaceVO svo ) throws Exception;	
	public List<SpaceVO> findAllPlacesPriceAsc( SpaceVO svo ) throws Exception;
}
