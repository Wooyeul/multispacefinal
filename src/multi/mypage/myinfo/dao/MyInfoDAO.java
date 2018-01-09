package multi.mypage.myinfo.dao;

import main.vo.UserVO;

public interface MyInfoDAO {
	
	public int ckpass(UserVO uvo) throws Exception;
	public UserVO find_user(String user_id) throws Exception; 
	public int mod_user(UserVO uvo) throws Exception;
	public int del_user(String user_id) throws Exception;
	
	
}
