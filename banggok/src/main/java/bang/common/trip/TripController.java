package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bang.common.comment.CommentService;
import bang.common.common.CommandMap;

@Controller
public class TripController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	/* 여행 일정 */
	@Resource(name="tripService")
	private TripService tripService;
	
	/* 댓글 */
	@Resource(name = "commentService")
	CommentService commentService;

	/* 여행 일정 공유 게시판 리스트 */
	@RequestMapping(value="/tripList.tr", method=RequestMethod.GET)
	public ModelAndView tripList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripList");
		
		/* 검색시, 키워드 받아옴 */
		String searchKeyword = request.getParameter("searchKeyword");
		mv.addObject("searchKeyword", searchKeyword);
		
		/* 한 페이지에 표시할 게시글 개수 */
		int rowCount = 9;
		/* 첫 페이지 초기값 1 */
		int pageNum = 1;
		/* 페이지 수(전체&검색) */
		int totalPageCount;
		
		/* 스크롤시 증가하는 페이지 번호 받아옴 */
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {
	        pageNum = Integer.parseInt(strPageNum);
	    }
		mv.addObject("pageNum", pageNum);
		
		/* 여행 일정 공유글 수(전체&검색) */
	    int totalRow = tripService.tripCount(commandMap.getMap(), request);
	    mv.addObject("totalRow", totalRow);
	    
		/* 여행 일정 공유글 페이지 수(전체&검색) */
	    totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    mv.addObject("totalPageCount", totalPageCount);
	    
	    return mv;
	}

	/* 여행 일정 공유 게시판 검색 */
	@RequestMapping(value="/tripListScroll.tr", method=RequestMethod.GET)
	public ModelAndView tripListScroll(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("scroll/tripListScroll");
		/* 검색시, 키워드 받아옴 */
		String searchKeyword = request.getParameter("searchKeyword");
		mv.addObject("searchKeyword", searchKeyword);
		
		/* 한 페이지에 표시할 게시글 개수 */
		int rowCount = 9;
		/* 첫 페이지 초기값 1 */
		int pageNum = 1;
		/* 페이지 수(전체&검색) */
		int totalPageCount;
		
		/* 스크롤시 증가하는 페이지 번호 받아옴 */
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {
	        pageNum = Integer.parseInt(strPageNum);
	    }
		mv.addObject("pageNum", pageNum);
		/* 페이지 게시물 시작번호 */
	    int startRowNum = 1 + (pageNum - 1) * rowCount;
	    /* 페이지 게시물 끝번호 */
	    int endRowNum = pageNum * rowCount;
	    
		/* 여행 일정 공유글 수(전체&검색) */
	    int totalRow = tripService.tripCount(commandMap.getMap(), request);
	    mv.addObject("totalRow", totalRow);
	    
		/* 여행 일정 공유글 페이지 수(전체&검색) */
	    totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    mv.addObject("totalPageCount", totalPageCount);
	    
	    /* 여행 일정 공유글 리스트(전체&검색) */
	    commandMap.put("START", startRowNum);
	    commandMap.put("END", endRowNum);
	    List<Map<String,Object>> trip = tripService.tripListPaging(commandMap.getMap(), request);
	    mv.addObject("trip", trip);
	    
		/* 확인 */
	    System.out.println("searchKeyword="+searchKeyword);
	    System.out.println("totalRow="+totalRow);
	    System.out.println("totalPageCount="+totalPageCount);
	    System.out.println("pageNum="+pageNum);
	    System.out.println("startRowNum="+startRowNum);
	    System.out.println("endRowNum="+endRowNum);
				
		return mv;
	}
	
	/* 여행 일정 공유 게시글 상세보기 */
	@ResponseBody
	@RequestMapping(value="/tripDetail.tr")
	public ModelAndView tripDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripDetail");
		
		/* TR_NUM 을 이용해서 글 상세 내용 불러오기 */
		Map<String, Object> trip = tripService.tripDetail(commandMap.getMap());
		
		/* 댓글 정보 불러오기 */
		List<Map<String, Object>> comment = commentService.selectTripComment(commandMap.getMap());
				
		mv.addObject("comment", comment);
		mv.addObject("trip", trip);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시글 수정하기 폼 */
	@RequestMapping(value="/tripModifyForm.tr")
	public ModelAndView tripModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripModifyForm");
		
		/* TR_NUM 을 이용해서 글 상세 내용 불러오기 */
		Map<String, Object> trip = tripService.tripDetail(commandMap.getMap());
				
		mv.addObject("trip", trip);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시글 수정하기 */
	@RequestMapping(value="/tripModify.tr")
	public ModelAndView tripModify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/tripList.tr");
		
		/* 폼을 통해 입력받은 데이터로 수정하기 */
		tripService.tripModify(commandMap.getMap());
				
		return mv;
	}
	
	/* 여행 일정 공유 게시글 삭제하기 */
	@RequestMapping(value="/tripDelete.tr")
	public ModelAndView tripDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/tripList.tr");
		
		/* TR_NUM으로 해당 게시글 삭제하기 */
		tripService.tripDelete(commandMap.getMap());
				
		return mv;
	}
	
	/* 마이페이지 여행 일정 리스트 */
	@RequestMapping(value="/myTripList.tr")
	public ModelAndView myTripList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myTripList");
		
		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", TR_ID);
	
		
		List<Map<String, Object>> myTripList = tripService.myTripList(commandMap.getMap());
		
		mv.addObject("myTripList", myTripList);
		
		return mv;
     }
	
	/* 여행 일정 만들기 폼 */
	@RequestMapping(value="/tripWriteForm.tr")
	public ModelAndView tripWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripWriteForm");
		
		return mv;
	}
}
