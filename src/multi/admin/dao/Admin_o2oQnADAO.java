package multi.admin.dao;
 
import java.util.List; 

import main.vo.O2OQnAVO;

public interface Admin_o2oQnADAO {
	public List<O2OQnAVO> findAllAskWithNoRe() throws Exception;
	public List<O2OQnAVO> findAllAskWithRe() throws Exception;
	public int addAsking ( O2OQnAVO ovo ) throws Exception;
	public O2OQnAVO check_oneAsking ( O2OQnAVO ovo ) throws Exception;
	public int writeConsult ( O2OQnAVO ovo ) throws Exception;
}
