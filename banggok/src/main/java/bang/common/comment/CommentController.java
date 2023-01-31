package bang.common.comment;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class CommentController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "commentService")
	CommentService commentService;
	
	/* 여행 일정 공유 게시글 댓글 작성하기 */
	@RequestMapping(value="/tripComWrite.tr", method=RequestMethod.GET)
	public ModelAndView tripComWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		commentService.tripComWrite(commandMap.getMap());
		
		return mv;
	}
	
	/* 동행댓글입력 */
	@RequestMapping(value="/tgCommentWrite.tr")
	public String tgCommentWrite(CommandMap commandMap, Model model) throws Exception {	

		model.addAttribute("url", "/togetherDetail.tr?TG_NUM="+commandMap.get("BC_NUM"));
		commentService.tgComWrite(commandMap.getMap());		
	         
		return "together/tgCommentWrite";
	}
	
	/* 댓글 삭제하기 */
	@RequestMapping(value="/comDelete.tr", method=RequestMethod.POST)
	public ModelAndView comDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		commentService.comDelete(commandMap.getMap());
		
		return mv;
	}
	
}
