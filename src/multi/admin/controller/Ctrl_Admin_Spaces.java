package multi.admin.controller;
 
import java.util.ArrayList;
import java.util.List; 
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.BeanUtil;
import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ClubVO;
import main.vo.Community_boardVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.vo.AdminSearchVO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_search2VO;
import multi.admin.vo.Admin_searchVO;

/* 
��ǰ ����

��ǰ ���� ����Ʈ ������
��ҿ� ���� �Ǹ��� ���� Ȯ�� ������
 */

@Controller
public class Ctrl_Admin_Spaces {
	@Autowired @Qualifier("admin_SpaceDAO")
	private Admin_SpaceDAO admin_SpaceDAO = null;
	
	@Autowired @Qualifier("admin_HostDAO")
	private Admin_HostDAO admin_HostDAO = null;

	// ��ǰ ���� ����Ʈ ������
	@RequestMapping("/admin_spaces.do")
	public ModelAndView admin_space( @ModelAttribute SpaceVO svo,
			@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_spaces");
		
		List<SpaceVO> ls = admin_SpaceDAO.host_spaces_search(search);
		
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_SpaceDAO.host_spaces_search(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);

		return mnv;
	}

	@RequestMapping("/admin_spaces_search.do")
	public ModelAndView admin_spaces_search( @RequestParam("pg") String pg, 
		@RequestParam("re") String re,
		@RequestParam("option") String field ,
		@RequestParam("option2") String field2 ,
		@RequestParam("content") String keyword ,
		@ModelAttribute Admin_searchVO search,
		HttpSession session ) throws Exception 
	{
		ModelAndView mnv = new ModelAndView("admin_spaces_search");
		if( field.equals("s_category_no") ){
			if(keyword.equals("����")){
				keyword = "1";
			} else if( keyword.equals("ȸ��") ){
				keyword = "2";
			} else if( keyword.equals("��Ƽ") ){
				keyword = "3";
			} else if( keyword.equals("����") ){
				keyword = "4";
			} else if( keyword.equals("������") ){
				keyword = "5";
			} else if( keyword.equals("��Ÿ") ){
				keyword = "6";
			}
		}
		
		if( field.equals("l_category_no") ){
			if(keyword.equals("����")){
				keyword = "1";
			} else if( keyword.equals("���") ){
				keyword = "2";
			} else if( keyword.equals("��õ") ){
				keyword = "3";
			} else if( keyword.equals("����") ){
				keyword = "4";
			} else if( keyword.equals("����") ){
				keyword = "5";
			} else if( keyword.equals("����") ){
				keyword = "6";
			} else if( keyword.equals("�泲") ){
				keyword = "7";
			} else if( keyword.equals("���") ){
				keyword = "8";
			} else if( keyword.equals("�λ�") ){
				keyword = "9";
			} else if( keyword.equals("���") ){
				keyword = "10";
			} else if( keyword.equals("�泲") ){
				keyword = "11";
			}  else if( keyword.equals("���") ){
				keyword = "12";
			} else if( keyword.equals("�뱸") ){
				keyword = "13";
			} else if( keyword.equals("����") ){
				keyword = "14";
			} else if( keyword.equals("����") ){
				keyword = "15";
			} else if( keyword.equals("����") ){
				keyword = "16";
			} else if( keyword.equals("����") ){
				keyword = "17";
			} else if( keyword.equals("����") ){
				keyword = "18";
			}
		}
		
		System.out.println("RE ==> " + re);
		//		STEP 1. ���� �˻��� ��˻��� �ƴϸ� ���ǿ� Ȥ�� ���� �� �ִ� �˻������� �����Ѵ�.
		if( re == null || !re.equals("Y") ) {
			session.removeAttribute("club_search");
		}

		//		STEP 2. ���ǿ� �ִ� ������ �˻� ������ �����´�. ������ ������ �����.   
		List<AdminSearchVO> searchs = (List<AdminSearchVO>)session.getAttribute("club_search");
		if( searchs == null ) {
			searchs = new ArrayList<AdminSearchVO>();
			session.setAttribute( "club_search", searchs );
		}
		//		STEP 3. �˻������� ���ǿ� �߰��Ѵ�.
		if( keyword != null && !keyword.equals("") ) {
			searchs.add( new AdminSearchVO( field ,field2, keyword ) );
		}
		
		for( AdminSearchVO vo : searchs){
			System.out.println( ">> " + vo.getOption() + "," + vo.getContent() );
		}

		List<SpaceVO> ls = spring().getBean("sqlSession",SqlSession.class).
			selectList("admin_space_search_All", new Admin_search2VO(searchs) );
		
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = spring().getBean("sqlSession",SqlSession.class).
				selectList("admin_space_search_All", new Admin_search2VO(searchs) );
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		return mnv;
	}
	
	// ��ҿ� ���� �Ǹ��� ���� Ȯ�� ������
	@RequestMapping("/admin_host_spaces.do")
	public ModelAndView admin_host_spaces( @ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_spaces");
		/*List<SpaceVO> ls = admin_SpaceDAO.findHostPlaces(svo);
		mnv.addObject("ls", ls);*/
		
		List<SpaceVO> ls = admin_SpaceDAO.search_All_specific_host(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_SpaceDAO.search_All_specific_host(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		mnv.addObject("crn", search.getCrn() );
		mnv.addObject("host_name", search.getHost_name() );
		return mnv;
	}
	
	// Ư�� ���� ������ �̿�. �����̷�Ʈ �� ���� ����Ʈ Ȯ�� ������
	@RequestMapping("/admin_space_remove.do")
	public ModelAndView admin_space_remove( @ModelAttribute SpaceVO svo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_SpaceDAO.removeSpace(svo);
		mnv.setViewName("redirect:/admin_spaces.do");
		return mnv;
	}
	
	// Ư�� ����� ��ȣ�� ���� ������ Ȯ�� �ϴ� ������ @ModelAttribute HostVO hvo
	@RequestMapping("/admin_space_crn_check.do")
	public ModelAndView admin_host_space_rooms( @ModelAttribute SpaceVO svo  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_space_crn_check");
		HostVO vo = admin_SpaceDAO.space_crn_check(svo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	
}