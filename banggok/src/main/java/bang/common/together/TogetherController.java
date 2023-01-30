package bang.common.together;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TogetherController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "togetherService")
	private TogetherService togetherService;

	/* 동행게시판 리스트 */
	@RequestMapping(value = "/togetherList.tr")
	public ModelAndView togetherList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/together/togetherList");

		Map<String, Object> resultMap = togetherService.togetherList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		
		return mv;
	}
	
	/* 동행게시판 디테일 */
	@RequestMapping(value="/togetherDetail.tr")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/together/togetherDetail");
		
		Map<String,Object> map = togetherService.togetherDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	/* 동행게시판 글쓰기 폼 */
	@RequestMapping(value = "/togetherWriteForm.tr")
	public ModelAndView togetherWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/together/togetherWriteForm");

		return mv;
	}

	/* 동행게시판 글쓰기 */
	@RequestMapping(value = "/togetherWrite.tr")
	public ModelAndView togetherWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/togetherList.tr");

		togetherService.togetherWrite(commandMap.getMap());

		HttpSession session = request.getSession();
		String TG_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("TG_ID", TG_ID);
		return mv;
	}

	/* 동행게시판 글수정 폼 */
	@RequestMapping(value = "/togetherModifyForm.tr")
	public ModelAndView togetherModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/together/togetherModifyForm");

		Map<String, Object> map = togetherService.togetherDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	/* 동행게시판 글수정 */
	@RequestMapping(value = "/togetherModify.tr")
	public ModelAndView togetherModify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/togetherDetail.tr");

		togetherService.togetherModify(commandMap.getMap());

		mv.addObject("TG_NUM", commandMap.get("TG_NUM"));
		return mv;
	}

	/* 동행게시판 글삭제 */
	@RequestMapping(value = "/togetherDelete.tr")
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/togetherList.tr");
		togetherService.togetherDelete(commandMap.getMap());

		return mv; 
	}
	
	/* 동행 게시판 검색 */
	@RequestMapping(value="/searchTogether.tr", method=RequestMethod.GET)
	public ModelAndView searchTogether(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("together/searchTogether");
		
		String searchKeyword = request.getParameter("searchKeyword");
		
		/* 동행 구하기 검색 */
		List<Map<String, Object>> together = togetherService.searchTogether(commandMap.getMap(), request);
				
		mv.addObject("searchKeyword", searchKeyword);
		mv.addObject("together", together);
		
		return mv;
	}
	
	/* 마이페이지 동행 리스트 */
	@RequestMapping(value="/myTogetherList.tr")
	public ModelAndView myTogetherList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myTogetherList");
		
		HttpSession session = request.getSession();
		String TG_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", TG_ID);	
		
		Map<String, Object> resultMap = togetherService.myTogetherList(commandMap.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("myTogetherList", resultMap.get("result"));
		
		return mv;
	}
	
}
