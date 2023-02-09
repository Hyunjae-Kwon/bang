package bang.common.trip;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bang.common.comment.CommentService;
import bang.common.common.CommandMap;
import bang.common.report.ReportService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TripController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	/* 여행 일정 */
	@Resource(name="tripService")
	private TripService tripService;
	
	/* 댓글 */
	@Resource(name = "commentService")
	CommentService commentService;
	
	/* 신고 */
	@Resource(name="reportService")
	private ReportService reportService;

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
		List<Map<String, Object>> comment = commentService.selectCommentList(commandMap.getMap());
		
		/* 일정 Day 번호 불러오기 */
		List<Map<String, Object>> tripDayNum = tripService.tripDayNum(commandMap.getMap());
		
		/* 추천 이력 불러오기 */
		List<Map<String, Object>> like= tripService.selectLike(commandMap.getMap());
		
		mv.addObject("like", like);
		mv.addObject("trip", trip);
		mv.addObject("comment", comment);
		mv.addObject("dayNum", tripDayNum);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 해당 글에 추가된 장소 데이터 불러오기 */
	@RequestMapping(value="/tripPlaceDetail.tr", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView tripPlaceDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("TP_ID", TR_ID);
		
		/* 상세보기 시작시 TP_TRNUM이 NULL인 값 삭제 */
		tripService.deletePlaceListNull(commandMap.getMap());
		
		/* 상세보기 시작시 TP_DELPLACE Y=>N update */
		tripService.tpDelPlaceUpdate(commandMap.getMap());
		
		/* TP_RNUM과 TP_DATE를 이용해서 장소 상세 정보 불러오기 */
		List<Map<String, Object>> tripPlace = tripService.tripPlaceDetail(commandMap.getMap());
		mv.addObject("tripPlace", tripPlace);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시글 수정하기 폼 */
	@RequestMapping(value="/tripModifyForm.tr")
	@ResponseBody
	public ModelAndView tripModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripModifyForm");
		
		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("TP_ID", TR_ID);
		
		/* 일정 수정 시작시 TP_TRNUM이 NULL인 값 삭제 */
		tripService.deletePlaceListNull(commandMap.getMap());
		
		/* 일정 수정 시작시 TP_DELPLACE Y=>N update */
		tripService.tpDelPlaceUpdate(commandMap.getMap());
		
		/* TR_NUM 을 이용해서 글 상세 내용 불러오기 */
		Map<String, Object> trip = tripService.tripDetail(commandMap.getMap());
		mv.addObject("trip", trip);
		
		/* 일정 Day 번호 최대값 불러오기 */
		int maxDayNum = tripService.maxDayNum(commandMap.getMap());
		mv.addObject("maxDayNum", maxDayNum);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시글 수정하기 */
	@RequestMapping(value="/tripModify.tr")
	@ResponseBody
	public ModelAndView tripModify(CommandMap commandMap, HttpServletRequest request, MultipartHttpServletRequest fileRequest) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripDetail");
		
		/* 폼을 통해 입력받은 데이터로 수정하기 */
		tripService.tripModify(commandMap.getMap(), fileRequest);
		
		/* 여행 장소 테이블의 여행 일정 번호 업데이트 */
		tripService.tripplaceUpdate(commandMap.getMap());
		
		/* 수정시 TP_DELPLACE가 Y인값 삭제 */
		tripService.delModifyPlace(commandMap.getMap());
		
		return mv;
	}
	
	/* 일정 삭제(수정시) */
	@RequestMapping(value="/modifyDelSch.tr", method = RequestMethod.POST)
	public ModelAndView modifyDelSch(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		tripService.modifyDelSch(commandMap.getMap());
		
		return mv;
	}
	
	/* 추가 장소 삭제(수정시) */
	@RequestMapping(value="/delPlaceList.tr", method = RequestMethod.POST)
	public ModelAndView delPlaceList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		tripService.delPlaceList(commandMap.getMap());

		return mv;
	}
	
	/* 여행 일정 공유 게시글 삭제하기 */
	@RequestMapping(value="/tripDelete.tr")
	public ModelAndView tripDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myTripList.tr");
		
		String bc = (String) commandMap.get("TR_NUM");
		
		Map<String, Object> bcNum = new HashMap<String, Object>();
		
		bcNum.put("BC_NUM", bc);
		
		/* TR_NUM으로 해당 게시글 삭제하기 */
		tripService.tripDelete(commandMap.getMap());
		
		/* TR_NUM으로 해당 장소정보 삭제하기 */
		tripService.tripPlaceDelete(commandMap.getMap());
		
		/* 댓글 삭제 처리 */
		commentService.comBoardDelete(bcNum);
		
		/* 신고 게시글 삭제 처리 */
		reportService.reportDelBrdUpdate(commandMap.getMap());
				
		return mv;
	}
	
	/* 마이페이지 여행 일정 리스트 */
	@RequestMapping(value="/myTripList.tr")
	public ModelAndView myTripList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myTripList");
		
		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", TR_ID);
			
		Map<String, Object> resultMap = tripService.myTripList(commandMap.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("myTripList", resultMap.get("result"));
		mv.addObject("tripList", resultMap);
		
		return mv;
     }
	
	
	/* 여행 일정 만들기 폼 */
	@RequestMapping(value="/tripWriteForm.tr")
	public ModelAndView tripWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripWriteForm");
		
		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("TP_ID", TR_ID);
		
		/* 일정 만들기 시작시 TP_TRNUM이 NULL인 값 삭제 */
		tripService.deletePlaceListNull(commandMap.getMap());
		
		/* 일정 만들기 시작시 TP_DELPLACE Y=>N update */
		tripService.tpDelPlaceUpdate(commandMap.getMap());

		return mv;
	}
	
	/* 여행 일정 만들기 */
	@RequestMapping(value="/tripWrite.tr", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView tripWrite(CommandMap commandMap, HttpServletRequest request, MultipartHttpServletRequest fileRequest) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		tripService.tripWrite(commandMap.getMap(), fileRequest);
		
		int maxTRNUM = tripService.maxTRNUM();
		
		commandMap.put("TP_TRNUM", maxTRNUM);
		
		/* 여행 장소 테이블의 여행 일정 번호 업데이트 */
		tripService.tripplaceUpdate(commandMap.getMap());

		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("TR_ID", TR_ID);
		
		return mv;
	}
	
	/* 일정 삭제(작성시) */
	@RequestMapping(value="/deleteSch.tr", method = RequestMethod.POST)
	public ModelAndView deleteSch(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		tripService.deleteSch(commandMap.getMap());

		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("TR_ID", TR_ID);
		
		return mv;
	}
	
	/* 일정별 추가 장소 리스트(작성시) */
	@RequestMapping(value="/writePlaceList.tr", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView writePlaceList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		String TR_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("TR_ID", TR_ID);
		
		List<Map<String,Object>> writePlaceList = tripService.writePlaceList(commandMap.getMap(), request);
	    mv.addObject("writePlaceList", writePlaceList);
	    		
		return mv;
	}
	
	/* 추가 장소 저장(작성시, 수정시) */
	@RequestMapping(value="/addPlaceList.tr", method = RequestMethod.POST)
	public ModelAndView addPlaceList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		tripService.addPlaceList(commandMap.getMap());

		return mv;
	}
	
	/* 추가 장소 삭제(작성시) */
	@RequestMapping(value="/deletePlaceList.tr", method = RequestMethod.POST)
	public ModelAndView deletePlaceList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		tripService.deletePlaceList(commandMap.getMap());

		return mv;
	}
	
	/* 취소하기(작성시, 수정시) */
	@RequestMapping(value="/tripCancel.tr")
	public ModelAndView tripCancel(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		/* 일정 만들기 시작시 TP_TRNUM이 NULL인 값 삭제 */
		tripService.deletePlaceListNull(commandMap.getMap());
		
		/* 일정 만들기 시작시 TP_DELPLACE Y=>N update */
		tripService.tpDelPlaceUpdate(commandMap.getMap());

		return mv;
	}
	
	/* 추천하기 */
	@RequestMapping(value="/tripLike.tr",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView tripLike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/tripDetail.tr");	
		tripService.tripLike(commandMap.getMap());
		
		/* 추천 이력 남기기 */
		tripService.insertLike(commandMap.getMap());
		
		mv.addObject("TR_NUM", commandMap.get("TR_NUM"));
		
		return mv;
	}
	
	/* 여행 일정 공유하기 */
	@RequestMapping(value="/tripShare.tr")
	public ModelAndView tripShare(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myTripList.tr");
		
		/* 폼을 통해 입력받은 데이터로 수정하기 */
		tripService.tripShare(commandMap.getMap());
				
		return mv;
	}
}
