package multi.home.userjoin.dao;

import main.vo.UserVO;
import main.vo.ZipcodeVO;

public interface UserJoinDAO {
	public int addUser(UserVO uvo) throws Exception;
	public int ckId(UserVO uvo) throws Exception;
	public int addZipcode(ZipcodeVO zvo) throws Exception;
	
}
