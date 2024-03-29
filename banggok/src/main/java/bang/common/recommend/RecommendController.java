package bang.common.recommend;

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

@Controller
public class RecommendController {

	/* 로그 출력 */
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "recommendService")
	RecommendService recommendService;
	
	/* 댓글 */
	@Resource(name = "commentService")
	CommentService commentService;
	
	/* 여행지 추천 폼(전체&검색) */
	@RequestMapping(value = "/recommendList.tr", method=RequestMethod.GET)
	public ModelAndView recommendList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("recommend/recommendList");
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

		/* 여행지 추천 게시글 수(전체&검색) */
	    int totalRow = recommendService.recommendCount(commandMap.getMap(), request);
	    mv.addObject("totalRow", totalRow);
	    
	    /* 여행지 추천 게시글 페이지 수(전체&검색) */
	    totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    mv.addObject("totalPageCount", totalPageCount);
		
		return mv;
	}
	
	/* 여행지 추천 리스트(전체&검색) */
	@RequestMapping(value="/recommendListScroll.tr", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView recommendListScroll(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("scroll/recommendListScroll");
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
		/* 페이지 게시글 시작번호 */
	    int startRowNum = 1 + (pageNum - 1) * rowCount;
	    /* 페이지 게시글 끝번호 */
	    int endRowNum = pageNum * rowCount;
		
	    /* 여행지 추천 게시글 수(전체&검색) */
	    int totalRow = recommendService.recommendCount(commandMap.getMap(), request);
	    mv.addObject("totalRow", totalRow);
	    
	    /* 여행지 추천 게시글 페이지 수(전체&검색) */
	    totalPageCount = (int) Math.ceil(totalRow / (double) rowCount);
	    mv.addObject("totalPageCount", totalPageCount);
	    
	    /* 여행지 추천 게시글 리스트(전체&검색) */
	    commandMap.put("START", startRowNum);
	    commandMap.put("END", endRowNum);
		List<Map<String, Object>> recom = recommendService.recommendListPaging(commandMap.getMap(), request);
		mv.addObject("recom", recom);
		
		/* 확인 */
	    System.out.println("searchKeyword="+searchKeyword);
	    System.out.println("totalRow="+totalRow);
	    System.out.println("totalPageCount="+totalPageCount);
	    System.out.println("pageNum="+pageNum);
	    System.out.println("startRowNum="+startRowNum);
	    System.out.println("endRowNum="+endRowNum);
	    
		return mv;
	}
	
	/* 여행지 추천 게시글 상세보기 */
	@RequestMapping(value = "/recommendDetail.tr")    
	public ModelAndView recommendDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("recommend/recommendDetail");
		Map<String,Object> map = recommendService.recommendDetail(commandMap.getMap());
		
		/* 댓글 리스트 불러오기 */
		List<Map<String, Object>> comment = commentService.selectCommentList(commandMap.getMap());
		
		/* 추천 이력 불러오기 */
		List<Map<String, Object>> like= recommendService.selectLike(commandMap.getMap());
		
		mv.addObject("like", like);
		mv.addObject("map", map);
		mv.addObject("comment", comment);
		
		return mv;
	}
	
	/* 여행지 추천 게시글 작성하기 폼 */
	@RequestMapping(value="/recommendWriteForm.tr")
	public ModelAndView recommendWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("recommend/recommendWriteForm");
		
		return mv;
	}
	
	/* 여행지 추천 게시글 작성하기 */
	@RequestMapping(value="/recommendWrite.tr", method = RequestMethod.POST)
	public ModelAndView recommendWrite(CommandMap commandMap, HttpServletRequest request, MultipartHttpServletRequest fileRequest) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/recommendList.tr");

		recommendService.insertRecommend(commandMap.getMap(), fileRequest);

		HttpSession session = request.getSession();
		String RC_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("RC_ID",RC_ID);
		return mv;
	}
	
	/* 여행지 추천 게시글 삭제하기 */
	@RequestMapping(value = "/recommendDelete.tr")
	public ModelAndView recommendDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/recommendList.tr");
		
		String bc = (String) commandMap.get("RC_NUM");
		
		Map<String, Object> bcNum = new HashMap<String, Object>();
		
		bcNum.put("BC_NUM", bc);
		
		recommendService.deleteRecommend(commandMap.getMap());
		
		/* 댓글 삭제 처리 */
		commentService.comBoardDelete(bcNum);

		return mv;      
	}
	
	/* 여행지 추천 게시글 수정 폼 */
	@RequestMapping(value="/recommendModifyForm.tr") 
	public ModelAndView recommendModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("recommend/recommendModifyForm");
		Map<String, Object> map = recommendService.recommendDetail(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

	/* 여행지 추천 게시글 수정하기 */
	@RequestMapping(value="/recommendModify.tr", method = RequestMethod.POST)
	public ModelAndView recommendModify(CommandMap commandMap, MultipartHttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/recommendList.tr");
		recommendService.recommendModify(commandMap.getMap(), request);

		return mv;
	}
	
	/* 추천하기 */
	@RequestMapping(value="/recommendLike.tr",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView recommendLike(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/recommendDetail.tr");	
		/* like 증가 */
		recommendService.recommendLike(commandMap.getMap());
		
		/* 추천 이력 남기기 */
		recommendService.insertLike(commandMap.getMap());
		
		mv.addObject("RC_NUM", commandMap.get("RC_NUM"));
		
		return mv;
	}
	
}
