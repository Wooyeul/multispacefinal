package multi.admin.dao;

import java.util.List;

import main.vo.UserVO;

public interface Admin_UserDAO {
	public List<UserVO> user_findAll() throws Exception;
	public UserVO user_check( UserVO uvo ) throws Exception;
	public UserVO user_del( UserVO uvo ) throws Exception;
	public int user_modify(UserVO uvo) throws Exception;
}
