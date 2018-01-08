package multi.mypage.myhost.dao;

import java.util.List;

import main.vo.HostVO;
import main.vo.SpaceVO;

public interface MyHostDAO {
	
	public int ckhost(HostVO hvo) throws Exception;
	public int addhost(HostVO hvo) throws Exception;
	public List<SpaceVO> findMySpace(HostVO hvo) throws Exception;
}
