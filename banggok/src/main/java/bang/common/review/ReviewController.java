package bang.common.review;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

/* Controller 객체임을 선언 */
@Controller
public class ReviewController {

	/* 로그 출력 */
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	/* 여행 후기 리스트 */
	@RequestMapping(value = "/reviewList.tr")	/* reviewList.tr url을 요청 */
	public ModelAndView reviewList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewList");	/* 화면에 보여줄 reviewList.jsp파일을 의미함 */
		
		List<Map<String,Object>> reviewList = reviewService.reviewList(commandMap.getMap());
		
		mv.addObject("reviewList", reviewList);
		
		return mv;
	}

	/* 여행 후기 디테일 */
	@RequestMapping(value = "/reviewDetail.tr")	/* reviewList.tr url을 요청 */
	public ModelAndView reviewDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewDetail");	/* 화면에 보여줄 reviewList.jsp파일을 의미함 */
		
		/* 여행후기 디테일 */
		List<Map<String,Object>> reviewDetail = reviewService.reviewDetail(commandMap.getMap());
		
		/* 여행후기 댓글 리스트*/
		List<Map<String, Object>> reviewCommentList = reviewService.reviewCommentList(commandMap.getMap());
		
		mv.addObject("reviewDetail", reviewDetail);
		mv.addObject("reviewCommentList", reviewCommentList);
		
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
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");

		reviewService.insertReview(commandMap.getMap());

		HttpSession session = request.getSession();
		String RV_ID = (String) session.getValue("MEM_ID");
		session.setAttribute("RV_ID", RV_ID);
		return mv;
	}
	
	/* 여행후기 수정 폼 */
	@RequestMapping(value="/reviewModifyForm.tr") 
	public ModelAndView reviewModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/review/reviewModifyForm");
		Map<String, Object> map = reviewService.reviewModifyForm(commandMap.getMap());

		mv.addObject("review", map);

		return mv;
	}
	
	/* 여행 후기 게시판 검색 */
	@RequestMapping(value="/searchReview.tr", method=RequestMethod.GET)
	public ModelAndView searchReview(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("review/searchReview");
		
		String keyword = request.getParameter("keyword");
		
		List<Map<String, Object>> review = reviewService.searchReview(commandMap.getMap(), request);
				
		mv.addObject("keyword", keyword);
		mv.addObject("review", review);
		
		return mv;
	}
	
	/* 마이페이지 여행 후기 리스트 */
	@RequestMapping(value="/myReviewList.tr")
	public ModelAndView myReviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myReviewList");
		
		HttpSession session = request.getSession();
		String RV_ID = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", RV_ID);
	
		
		List<Map<String, Object>> myReviewList = reviewService.myReviewList(commandMap.getMap());
		
		mv.addObject("myReviewList", myReviewList);
		
		return mv;
	}
	
	/* 여행후기 수정 */
	@RequestMapping(value="/reviewModify.tr", method = RequestMethod.POST)
	public ModelAndView reviewModify(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");
		
		reviewService.reviewModify(commandMap.getMap());

		return mv;
	}
	
	/* 여행후기 삭제 */
	@RequestMapping(value = "/reviewDel.tr")
	public ModelAndView reviewDel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/reviewList.tr");
		
		reviewService.reviewDel(commandMap.getMap());

		return mv;      
	}
	
}