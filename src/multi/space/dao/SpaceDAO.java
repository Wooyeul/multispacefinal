package multi.space.dao;

import java.util.List;

import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;

public interface SpaceDAO {
	
	//�׽�Ʈ��
	public String sysdate() throws Exception;
	
	//���� ��ü ����Ʈ �ҷ�����
	public List<SpaceVO> find_space_all() throws Exception; 
	
	//���� �߰�
	public Integer add_space(SpaceVO vo) throws Exception;
	
	//���� �ϳ� �ҷ�����
	public SpaceVO find_space_by_pk(SpaceVO vo) throws Exception;
	
	//���� �˻��ϰ� ������ ���� Ŭ�� �ҷ�����
	public List<ClubVO> find_user_club() throws Exception;
	
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception;
}
