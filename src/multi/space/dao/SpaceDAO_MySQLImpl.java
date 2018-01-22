package multi.space.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.BookmarkVO;
import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import main.vo.ZipcodeVO;
import multi.space.vo.ImageVO;
import multi.space.vo.Space2VO;
import multi.space.vo.Space_searchVO;

public class SpaceDAO_MySQLImpl implements SpaceDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public String sysdate() throws Exception {
		return sqlSession.selectOne("space.sysdate");
	}

	//���� ��ü �ҷ�����
	@Override
	public List<SpaceVO> find_space_all() throws Exception {
		return sqlSession.selectList("space.find_space_all");
	}

	//���� �߰��ϱ�
	@Override
	public Integer add_space(SpaceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("space.add_space",vo);
	}

	//���� �ϳ� �ҷ�����
	@Override
	public SpaceVO find_space_by_pk(SpaceVO vo) throws Exception {
		return sqlSession.selectOne("space.find_space_by_pk",vo);
	}
	
	//������ ������ ���� ��������
	@Override
	public List<ClubVO> find_user_club(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.find_user_club",user_id);
	}
	
	//���� �ѹ��� ���� ȣ��Ʈ�� ���� ��������
	@Override
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_host_by_space_no",vo);
	}
	
	//���� ī�װ� ��������
	@Override
	public List<Map<Integer, String>> find_l_category() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.find_l_category");
	}
	
	//spaceī�װ� ��������
	@Override
	public List<Map<Integer, String>> find_s_category() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.find_s_category");
	}
	
	//�ϳ��� �����̽����� s_category��������
	@Override
	public String find_s_category_by_space_no(SpaceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_s_category_by_space_no",vo);
	}
	
	//�ϳ��� �����̽����� l_category ��������
	@Override
	public String find_l_category_by_space_no(SpaceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_l_category_by_space_no",vo);
	}

	//���� �˻�
	@Override
	public List<SpaceVO> search_space(Space_searchVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.search_space",vo);
	}

	//���� ����
	@Override
	public Integer del_space_by_space_no(SpaceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("space.del_space_by_space_no",vo);
	}
	
	//���� ����
	@Override
	public Integer mod_space(SpaceVO space) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("space.mod_space",space);
	}

	@Override
	public Integer add_space_image(ImageVO image) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("space.add_space_image",image);
	}
	
	//�̹��� �ֱ� ���ؼ� ���������� �߰��� space_no����
	@Override
	public Integer find_space_no() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_space_no");
	}

	@Override
	public ImageVO find_image_by_space_no(ImageVO image) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_image_by_space_no",image);
	}

	//best_space ����
	@Override
	public List<Space2VO> find_best_space() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.find_best_space");
	}

	//best_space ��Ƽ��
	@Override
	public List<Space2VO> find_best_space2() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.find_best_space2");
	}

	@Override
	public ZipcodeVO find_space_addr(String zipcode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_space_addr",zipcode);
	}




	
	


}

