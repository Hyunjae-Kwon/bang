package bang.common.comment;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;
import bang.common.report.ReportService;

@Controller
public class CommentController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "commentService")
	CommentService commentService;
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	/* 댓글 작성하기 */
	@RequestMapping(value="/comWrite.tr", method=RequestMethod.GET)
	public ModelAndView comWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		commentService.comWrite(commandMap.getMap());
		
		return mv;
	}
	
	/* 댓글 삭제하기 */
	@RequestMapping(value="/comDelete.tr", method=RequestMethod.GET)
	public ModelAndView comDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		commentService.comDelete(commandMap.getMap());
		
		/* 신고 리스트에서 삭제 처리 업데이트 */
		reportService.reportDelComUpdate(commandMap.getMap());
		
		return mv;
	}
}
