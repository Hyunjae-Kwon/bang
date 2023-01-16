package bang.common.recommend;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class RecommendController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "recommendService")
	RecommendService recommendService;
	
	/* 관리자 추천글 리스트 */
	@RequestMapping(value = "/allRecommendList.tr", method=RequestMethod.GET)
	public ModelAndView recommendList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("recommend/recommendList");

		List<Map<String, Object>> list = recommendService.recommendList(commandMap);
		mv.addObject("recommendList", list);

		return mv;
	}   
	
	/* 글상세 */
	@RequestMapping(value = "/recommendDetail.tr")    
	public ModelAndView recommendDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("recommend/recommendDetail");
		Map<String,Object> map = recommendService.recommendDetail(commandMap.getMap());
		/* 댓글 */
		List<Map<String, Object>> rcComment = recommendService.rcCommentList(commandMap.getMap());
		
		mv.addObject("map", map);
		mv.addObject("rcComment", rcComment);
		
		return mv;
	}
	
	/* 글입력폼 */
	@RequestMapping(value="/recommendWriteForm.tr")
	public ModelAndView recommendWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("recommend/recommendWriteForm");
		
		return mv;
	}
	
	/* 글쓰기  */
	@RequestMapping(value="/recommendWrite.tr", method = RequestMethod.POST)
	public ModelAndView recommendWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/allRecommendList.tr");

		recommendService.insertRecommend(commandMap.getMap());

		HttpSession session = request.getSession();
		String RC_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("RC_ID",RC_ID);
		return mv;
	}
	
	/* 글삭제 */
	@RequestMapping(value = "/recommendDelete.tr")
	public ModelAndView recommendDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/allRecommendList.tr");
		recommendService.deleteRecommend(commandMap.getMap());

		return mv;      
	}
	
	/* 글수정폼 */
	@RequestMapping(value="/recommendModifyForm.tr") 
	public ModelAndView recommendModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("recommend/recommendModifyForm");
		Map<String, Object> map = recommendService.recommendModifyForm(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

	/* 글수정 */
	@RequestMapping(value="/recommendModify.tr", method = RequestMethod.POST)
	public ModelAndView recommendModify(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/allRecommendList.tr");
		recommendService.recommendModify(commandMap.getMap());

		return mv;
	}
	
	/* 추천 */
	@RequestMapping(value="/recommendLike.tr",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView recommendLike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/recommendDetail.tr");	
		recommendService.recommendLike(commandMap.getMap());
		mv.addObject("RC_NUM", commandMap.get("RC_NUM"));
		return mv;
	}
	
	/* 댓글입력 */
	@RequestMapping(value="/rcCommentWrite.tr")
	public String rcCommentWrite(CommandMap commandMap, Model model) throws Exception {	

		model.addAttribute("msg", "댓글 작성이 완료되었습니다.");
		model.addAttribute("url", "/recommendDetail.tr?RC_NUM="+commandMap.get("BC_NUM"));
		recommendService.rcCommentWrite(commandMap.getMap());		
	         
		return "recommend/rcCommentWrite";
	}
	
	/* 댓글삭제 */
	@RequestMapping(value="/rcCommentDelete.tr")
	public String rcCommentDelete(CommandMap commandMap, Model model) throws Exception {
	
		model.addAttribute("msg", "댓글 삭제가 완료되었습니다.");
		model.addAttribute("url", "/recommendDetail.tr?RC_NUM="+commandMap.get("RC_NUM"));
		recommendService.rcCommentDelete(commandMap.getMap());				
		
		return "recommend/rcCommentDelete";
	}
	
}
