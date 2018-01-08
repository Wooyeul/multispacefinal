package multi.mypage.mybookmark.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.BookmarkVO;
import main.vo.SpaceVO;
import multi.mypage.mybookmark.dao.BookmarkDAO;

@Controller
public class CtrlMypageBookmark {
	
	@Autowired @Qualifier("bookmarkDAO")
	private BookmarkDAO bookmakrDAO;
	
	@RequestMapping("/temp.do")
	public ModelAndView Temp() throws Exception{
		ModelAndView mnv = new ModelAndView("bookmark_findAll");
		
		return mnv;
	}
	
	@RequestMapping("/bookmark_findAll.do")
	public ModelAndView findBookmark(@ModelAttribute BookmarkVO bvo) throws Exception{
		
		ModelAndView mnv = new ModelAndView("bookmark_findAll2");
		List<SpaceVO> rl = bookmakrDAO.bookmarkFindAll(bvo);
		mnv.addObject("rl", rl);
		
		return mnv;
	}
	
	@RequestMapping("/bookmark_del.do")
	public String delBookmark(HttpServletRequest request){
		String[] r = request.getParameterValues("check");
		for(String t : r){
			int m = Integer.parseInt(t);
			bookmakrDAO.bookmarkDel(m);
		}
		
		return "redirect:/temp.do";
	}
}
