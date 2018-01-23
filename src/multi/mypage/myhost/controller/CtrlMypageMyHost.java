package multi.mypage.myhost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.mypage.myhost.dao.MyHostDAO;
import multi.mypage.vo.Mypage_searchVO;

/**
 * @author sb
 * ���������� �Ǹ��� ������
 */
@Controller
public class CtrlMypageMyHost {
	
	@Autowired @Qualifier("myhostDAO")
	private MyHostDAO myhostDAO;
	
	//�Ǹ��� ���� Ȯ��
	@RequestMapping("/myhost_findAll.do")
	public ModelAndView findHost(@CookieValue("user_id") String user_id,
			@ModelAttribute HostVO hvo,
			@ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception{
		
		ModelAndView mnv = new ModelAndView();
		int flag = myhostDAO.ckhost(user_id);
		mnv.addObject("user_id", user_id);
		if(flag >= 1){
			//�̹� �Ǹ����϶�
			mnv.setViewName("myhost_findSpace");
			//List<SpaceVO> rl = myhostDAO.findMySpace(user_id);
			search.setUser_id(user_id);
			
			List<SpaceVO> rl = myhostDAO.searchSpace(search);
			PaginationDTO pz = new PaginationDTO().init(pg, rl.size());
			search.setStart_no(pz.getSkip());
			rl = myhostDAO.searchSpace(search);
			
			mnv.addObject("rl", rl);
			mnv.addObject("pz", pz);
			mnv.addObject("search", search);
			mnv.addObject("user_id", user_id);
			
		} else if(flag == 0 ){	
			//�Ǹ��� �ƴҶ�
			mnv.setViewName("myhost_addButton");
		}
		mnv.addObject("flag", flag);
		
		return mnv;
	}
	
	//�Ǹ��� �߰�
	@RequestMapping("/myhost_addForm.do")
	public ModelAndView addHost(@CookieValue("user_id") String user_id,@ModelAttribute HostVO hvo)throws Exception{
		
		ModelAndView mnv = new ModelAndView("myhost_addForm");
		mnv.addObject("user_id",user_id);
		
		return mnv;
	}
	
	@RequestMapping("/myhost_addhost.do")
	public ModelAndView addHost2(@CookieValue("user_id") String user_id,@ModelAttribute HostVO hvo)throws Exception{
		
		ModelAndView mnv = new ModelAndView("myhost_addCom");
		hvo.setUser_id(user_id);
		mnv.addObject("user_id", user_id);
		myhostDAO.addhost(hvo);
		
		return mnv;
	}
	
	@RequestMapping("/crn_overlap.do")
	@ResponseBody
	public String crn_overlap( @RequestParam("crn") String crn) throws Exception{
		
		Integer r = myhostDAO.ckcrn(crn);
		
		return r.toString();
	}
}
