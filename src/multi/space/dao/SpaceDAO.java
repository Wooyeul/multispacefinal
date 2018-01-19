package multi.space.dao;

import java.util.List;
import java.util.Map;

import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import main.vo.ZipcodeVO;
import multi.space.vo.ImageVO;
import multi.space.vo.Space2VO;
import multi.space.vo.Space_searchVO;

public interface SpaceDAO {
	
	//�׽�Ʈ��
	public String sysdate() throws Exception;
	
	//���� ��ü ����Ʈ �ҷ�����
	public List<SpaceVO> find_space_all() throws Exception; 
	
	//���� �߰�
	public Integer add_space(SpaceVO vo) throws Exception;
	
	//������ ��ȣ ����
	public Integer find_space_no() throws Exception;
	
	//���� �̹��� �߰�
	public Integer add_space_image(ImageVO image) throws Exception;
	
	//���� ����
	public Integer del_space_by_space_no(SpaceVO vo) throws Exception;
	
	//���� �ϳ� �ҷ�����
	public SpaceVO find_space_by_pk(SpaceVO vo) throws Exception;
	
	//���� �̹��� �ҷ�����
	public ImageVO find_image_by_space_no(ImageVO image) throws Exception;
	
	//���� �˻��ϰ� ������ ���� Ŭ�� �ҷ�����
	public List<ClubVO> find_user_club(String user_id) throws Exception;
	
	//���� �Ǹ��� ���� �ҷ�����
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception;
	
	//L_CATEGORY ��ü �ҷ�����
	public List<Map<Integer,String>> find_l_category() throws Exception;
	
	//S_CATEGORY ��ü �ҷ�����
	public List<Map<Integer,String>> find_s_category() throws Exception;
	
	//�ϳ��� SPACE���� S_CATEOGRY �ҷ�����
	public String find_s_category_by_space_no(SpaceVO vo) throws Exception;
	
	//�ϳ��� SPACE���� L_CATEGORY �ҷ�����
	public String find_l_category_by_space_no(SpaceVO vo) throws Exception;
	
	//���� search
	public List<SpaceVO> search_space(Space_searchVO vo) throws Exception;
	
	//���� ����
	public Integer mod_space(SpaceVO space) throws Exception;
	
	//����Ʈ ���� 3�� �̾ƿ���(����)
	public List<Space2VO> find_best_space() throws Exception;
	
	//��Ƽ��
	public List<Space2VO> find_best_space2() throws Exception;
	
	//�ּҰ� �̾ƿ���
	public ZipcodeVO find_space_addr(String zipcode) throws Exception;
}

