package multi.home.userjoin.dao;

import main.vo.UserVO;

public interface UserJoinDAO {
	public int addUser(UserVO uvo) throws Exception;
	public int ckId(UserVO uvo) throws Exception;
}
