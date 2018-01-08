package multi.space.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;

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

	@Override
	public List<ClubVO> find_user_club(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space.find_user_club",user_id);
	}

	@Override
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.find_host_by_space_no",vo);
	}

	
	


}

