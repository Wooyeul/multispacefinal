package multi.community.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import main.vo.Community_boardVO;
import main.vo.Community_board_repleVO;
import multi.community.board.dao.Community_boardDAO;
import multi.community.board.dao.Community_board_searchDAO;
import multi.community.board.dao.Community_boardmytextDAO;
import multi.community.board.dao.Community_boardrepleDAO;
import multi.community.board.vo.Community_board_searchVO;

@Controller
public class CtrlBoard {
	
	@Autowired @Qualifier("community_boardDAO")
	private Community_boardDAO community_boardDAO = null;
	
	@Autowired @Qualifier("community_boardrepleDAO")
	private Community_boardrepleDAO community_boardrepleDAO = null;
	
	@Autowired @Qualifier("community_boardmytextDAO")
	private Community_boardmytextDAO community_boardmytextDAO =null;
	
	@Autowired @Qualifier("community_board_searchDAO")
	private Community_board_searchDAO community_board_searchDAO =null;
	
	
	//커뮤니티 보드 
	 @RequestMapping("/community_board_list.do")
	   public ModelAndView community_board(@CookieValue("user_id") String user_id) throws Exception{
	      ModelAndView mnv = new ModelAndView("community_board_list");
	      List<Community_boardVO> rl = community_boardDAO.findAll(user_id);
	      mnv.addObject("rl",rl);
	      
	      mnv.addObject("user_id", user_id);

	      return mnv;
	   }
	 
	 @RequestMapping("/community_board_mytext.do")
	   public ModelAndView community_board_mytext(@CookieValue("user_id") String user_id) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_board_mytext");
		 List<Community_boardVO> mrl = community_boardmytextDAO.findAll(user_id);
	      mnv.addObject("user_id", user_id);
	      mnv.addObject("mrl", mrl);
	      return mnv;
	 }
	 
	 
	 @RequestMapping("/community_board_add.do")
	 public ModelAndView community_board_add(@CookieValue("user_id") String user_id , @ModelAttribute Community_boardVO pvo ) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_board_add2");
		 return mnv;
		 
	 }
	 
	 @RequestMapping("/community_board_add2.do")
	 public String community_board_add2(@CookieValue("user_id") String user_id,@ModelAttribute Community_boardVO pvo)throws Exception {
		 pvo.setUser_id(user_id);
		 community_boardDAO.add(pvo);
		 return "redirect:/community_board_list.do";
	 }
	 
	 
	 @RequestMapping("/community_board_read.do")
	 public ModelAndView community_board_read(@CookieValue("user_id") String user_id, @ModelAttribute Community_boardVO pvo, @ModelAttribute Community_board_repleVO rvo) throws Exception{
		 System.out.println("qwer"+pvo.getCom_board_no());
		 Community_boardVO bvo = community_boardDAO.findByPK(pvo);
		 ModelAndView mnv = new ModelAndView("community_board_read");
		 mnv.addObject("vo", bvo);
		 
		 community_boardDAO.incViewLogic(pvo);
		 pvo.setUser_id(user_id);
		 List<Community_board_repleVO> rl = community_boardrepleDAO.findAllreple(rvo);
	     mnv.addObject("user_id", user_id);
		 mnv.addObject("rl",rl);
		 
	
		 return mnv;
		 
	 }
	 
	 
	 @RequestMapping("/community_board_mod.do")
	 public ModelAndView community_board_mod (@ModelAttribute Community_boardVO pvo)throws Exception {
		ModelAndView mnv= new ModelAndView("community_board_mod2");
		mnv.addObject("mvo", pvo);
		return mnv;
		 
	 } 
	 
	 @RequestMapping("/community_board_mod2.do")
	 public String community_board_mod2(@ModelAttribute Community_boardVO pvo)throws Exception {
		 community_boardDAO.mod(pvo);
		 return "redirect:/community_board_read.do?com_board_no="+pvo.getCom_board_no();
		 
	 }
	 
	 
	 @RequestMapping("/community_board_del.do")
	 
	 public String community_board_del(@ModelAttribute Community_boardVO pvo)throws Exception {
		 	community_boardDAO.delByPK(pvo);
			return "redirect:/community_board_list.do";
	 }
	 
	 
	@RequestMapping("/community_board_recom.do")
	@ResponseBody
	 public String community_board_recom(@ModelAttribute Community_boardVO pvo)throws Exception {

		 community_boardDAO.incRecomLogic(pvo);
		 return pvo.getRecom_count().toString();
	 
	 }
	
	@RequestMapping("/community_board_serch.do")
	public  ModelAndView  community_board_serch(@ModelAttribute Community_board_searchVO pvo) throws Exception{
		ModelAndView mnv = new ModelAndView("community_board_serch");
		 List<Community_boardVO> srl = community_board_searchDAO.comm_board_search(pvo);
	      mnv.addObject("srl", srl);
	      return mnv;
		
	}
	
	 
	
	//커뮤니티 보드 글 리플
	@RequestMapping("/community_board_addreple.do")
	public String community_board_addreple(@CookieValue("user_id") String user_id, @ModelAttribute Community_board_repleVO  pvo) throws Exception {
		pvo.setUser_id(user_id);
		community_boardrepleDAO.addReple(pvo);
		return "redirect:/community_board_read.do?com_board_no="+pvo.getCom_board_no();
	}
	
	@RequestMapping("/community_board_replemod.do")
	public String community_board_replemod(@ModelAttribute  Community_board_repleVO  pvo) throws Exception {
		community_boardrepleDAO.modReple(pvo);
		return  "redirect:/community_board_read.do?com_board_no="+pvo.getCom_board_no();
	}
	
	@RequestMapping("/community_board_repledel.do")
	public String community_board_repledel(@ModelAttribute  Community_board_repleVO  pvo) throws Exception {
		System.out.println("aa"+pvo.getCom_board_no());
	community_boardrepleDAO.delReple(pvo);
	return "redirect:/community_board_read.do?com_board_no="+pvo.getCom_board_no();
	}
	
	


}
