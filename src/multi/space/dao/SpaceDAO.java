package multi.space.dao;

import java.util.List;
import java.util.Map;

import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;

public interface SpaceDAO {
	
	//테스트용
	public String sysdate() throws Exception;
	
	//공간 전체 리스트 불러오기
	public List<SpaceVO> find_space_all() throws Exception; 
	
	//공간 추가
	public Integer add_space(SpaceVO vo) throws Exception;
	
	//공간 하나 불러오기
	public SpaceVO find_space_by_pk(SpaceVO vo) throws Exception;
	
	//유저 검색하고 유저가 가진 클럽 불러오기
	public List<ClubVO> find_user_club(String user_id) throws Exception;
	
	//공간 판매자 정보 불러오기
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception;
}

