package multi.admin.dao;
 
import java.util.List; 

import main.vo.MessageVO;

public interface Admin_MessageDAO {
	public int writing_message ( MessageVO mvo ) throws Exception;
	public List<MessageVO> findAllGetMessages () throws Exception;
	public List<MessageVO> findToGetMessages () throws Exception;
}
