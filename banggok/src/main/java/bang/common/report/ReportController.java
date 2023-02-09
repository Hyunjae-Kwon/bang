package bang.common.report;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class ReportController {
	
	Logger log = Logger.getLogger(this.getClass());

	/* 관리자 */
	@Resource(name="reportService")
	private ReportService reportService;
	
	/* 게시글 신고 하기 */
	@RequestMapping(value="/reportBoardWrite.tr")
	public ModelAndView reportBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/");	/* 메인화면으로 리다이렉트 -> 마이페이지 신고내역 추가 후 변경 */
		
		reportService.reportBoardWrite(commandMap.getMap());
		
		return mv;
	}
	
	/* 게시글 댓글 신고 하기 */
	@RequestMapping(value="/reportComWrite.tr")
	public ModelAndView reportComWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/");	/* 메인화면으로 리다이렉트 -> 마이페이지 신고내역 추가 후 변경 */
		
		reportService.reportComWrite(commandMap.getMap());
		
		return mv;
	}
}
