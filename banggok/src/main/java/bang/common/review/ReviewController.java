package bang.common.review;
  
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
  
/* Controller 객체임을 선언 */
@Controller
public class ReviewController {

	/* 로그 출력 */
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	/* 댓글 */
	@Resource(name = "commentService")
	CommentService commentService;
	
	/* 신고 */
	@Resource(name="reportService")
	private ReportService reportService;
	
	/* 여행 후기 폼(전체&검색) */
	@RequestMapping(value = "/reviewList.tr", method=RequestMethod.GET)
	public ModelAndView reviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewList");
		
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
//	    int startRowNum = 1 + (pageNum - 1) * rowCount;
	    /* 페이지 게시물 끝번호 */
//	    int endRowNum = pageNum * rowCount;
	    
		/* 여행 후기 수(전체&검색) */
	    int totalRow = reviewService.reviewCount(commandMap.getMap(), request);
	    mv.addObject("totalRow", totalRow);
	    
		/* 여행 후기 페이지 수(전체&검색) */
	    totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    mv.addObject("totalPageCount", totalPageCount);
	    
	    /* 여행 후기 리스트(전체&검색) */
//	    commandMap.put("START", startRowNum);
//	    commandMap.put("END", endRowNum);

		return mv;
	}
	
	/* 여행 후기 리스트(전체&검색) */
	@RequestMapping(value = "/reviewListScroll.tr", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView reviewListScroll(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("scroll/reviewListScroll");
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
	    
		/* 여행 후기 수(전체&검색) */
	    int totalRow = reviewService.reviewCount(commandMap.getMap(), request);
	    mv.addObject("totalRow", totalRow);
	    
		/* 여행 후기 페이지 수(전체&검색) */
	    totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    mv.addObject("totalPageCount", totalPageCount);
	    
	    /* 여행 후기 리스트(전체&검색) */
	    commandMap.put("START", startRowNum);
	    commandMap.put("END", endRowNum);
	    List<Map<String,Object>> reviewList = reviewService.reviewListPaging(commandMap.getMap(), request);
	    mv.addObject("review", reviewList);
	    
		/* 확인 */
	    System.out.println("searchKeyword="+searchKeyword);
	    System.out.println("totalRow="+totalRow);
	    System.out.println("totalPageCount="+totalPageCount);
	    System.out.println("pageNum="+pageNum);
	    System.out.println("startRowNum="+startRowNum);
	    System.out.println("endRowNum="+endRowNum);
	    
		return mv;
	}
	
	/* 여행 후기 디테일 */
	@RequestMapping(value = "/reviewDetail.tr")	/* reviewList.tr url을 요청 */
	public ModelAndView reviewDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewDetail");	/* 화면에 보여줄 reviewList.jsp파일을 의미함 */
		
		/* 여행후기 디테일 */
		Map<String,Object> review = reviewService.reviewDetail(commandMap.getMap());
		
		/* 댓글 리스트 불러오기 */
		List<Map<String, Object>> comment = commentService.selectCommentList(commandMap.getMap());
		
		/* 추천 이력 불러오기 */
		List<Map<String, Object>> like= reviewService.selectLike(commandMap.getMap());
		
		mv.addObject("like", like);
		mv.addObject("review", review);
		mv.addObject("comment", comment);
		
		return mv;
	}
	
	/* 여행후기 글쓰기 폼 */
	@RequestMapping(value="/reviewWriteForm.tr")
	public ModelAndView reviewWriteForm(CommandMap commandMap , HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("review/reviewWriteForm");

		return mv;
	}

	/* 여행후기 글쓰기 */
	@RequestMapping(value="/reviewWrite.tr", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request, MultipartHttpServletRequest fileRequest) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");

		reviewService.insertReview(commandMap.getMap(), fileRequest);

		HttpSession session = request.getSession();
		String RV_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("RV_ID", RV_ID);
		return mv;
	}
	
	/* 여행후기 수정 폼 */
	@RequestMapping(value="/reviewModifyForm.tr") 
	public ModelAndView reviewModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/review/reviewModifyForm");
		Map<String, Object> map = reviewService.reviewDetail(commandMap.getMap());

		mv.addObject("review", map);

		return mv;
	}
	
	/* 여행후기 수정 */
	@RequestMapping(value="/reviewModify.tr", method = RequestMethod.POST)
	public ModelAndView reviewModify(CommandMap commandMap, MultipartHttpServletRequest fileRequest)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");
		
		reviewService.reviewModify(commandMap.getMap(), fileRequest);

		return mv;
	}
		
	/* 여행후기 삭제 */
	@RequestMapping(value = "/reviewDelete.tr")
	public ModelAndView reviewDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");
		
		String bc = (String) commandMap.get("RV_NUM");
		
		Map<String, Object> bcNum = new HashMap<String, Object>();
		
		bcNum.put("BC_NUM", bc);
		
		reviewService.reviewDelete(commandMap.getMap());
		
		/* 신고 게시글 삭제 처리 */
		reportService.reportDelBrdUpdate(commandMap.getMap());
		
		/* 댓글 삭제 처리 */
		commentService.comBoardDelete(bcNum);

		return mv;      
	}
	
	/* 추천하기 */
	@RequestMapping(value="/reviewLike.tr",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView recommendLike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewDetail.tr");	
		reviewService.reviewLike(commandMap.getMap());
		
		mv.addObject("RV_NUM", commandMap.get("RV_NUM"));
		
		/* 추천 이력 남기기 */
		reviewService.insertLike(commandMap.getMap());
		
		return mv;
	}
	
	/* 마이페이지 여행 후기 리스트 */
	@RequestMapping(value = "/myReviewList.tr")
	public ModelAndView myReviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myReviewList");
		
		HttpSession session = request.getSession();
		String RV_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", RV_ID);

		Map<String, Object> resultMap = reviewService.myReviewList(commandMap.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("myReviewList", resultMap.get("result"));
		
		return mv;
	}
}