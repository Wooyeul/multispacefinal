package multi.admin.dao;
 
import java.util.List; 

import main.vo.EventVO;
import multi.admin.vo.Admin_searchVO;


/*	DAO �� �������̽��� �����Ѵ�.
 	SELECT �� find , INSERT �� add, DELETE �� del, 
 	By ���Ŀ��� WHERE ������ ����Ѵ�.
 	throws Exception �Ǵ� throws RuntimeException ���� ����
 	
 	������ mod ���ξ ���δ� ( ���������δ� + 1 ������ inc ������ )
*/

public interface Admin_EventDAO {
	public List<EventVO> findAll() throws Exception;
	public int add( EventVO pvo ) throws Exception;
	public int delByPK(EventVO pvo) throws Exception;
	
	public EventVO getByPK( int pk) throws Exception;
	
	public int mod(EventVO pvo) throws Exception;
	public List<EventVO> search_All(Admin_searchVO search) throws Exception;
	
	
}






	