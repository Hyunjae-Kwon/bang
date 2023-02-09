package bang.common.main;

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
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;
import bang.common.recommend.RecommendService;
import bang.common.review.ReviewService;
import bang.common.together.TogetherService;
import bang.common.trip.TripService;
import bang.member.mypage.MyPageService;

@Controller
public class MainController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	/* 여행 일정 */
	@Resource(name="tripService")
	private TripService tripService;
	
	/* 여행 후기 */
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/* 여행지 추천 */
	@Resource(name="recommendService")
	private RecommendService recommendService;
	
	/* 동행 구하기 */
	@Resource(name="togetherService")
	private TogetherService togetherService;
	
//	/* 마이페이지 */
//	@Resource(name="myPageService")
//	private MyPageService myPageService;
	
	/* 메인 페이지 */
	@RequestMapping(value="/main.tr", method=RequestMethod.GET)
	public ModelAndView main(Map<String, Object> map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("main_layout");
		
//		HttpSession session = request.getSession();
//		Map<String, Object> memId = new HashMap<String, Object>();
//		
//		if(session.getAttribute("MEM_ID") != null) {
//			memId.put("MEM_ID", session.getAttribute("MEM_ID"));
//			
//			/* 프로필 이미지 가져오기 */
//			Map<String, Object> memImg = myPageService.getMemberImage(memId);
//					
//			mv.addObject("memImg", memImg);
//		}
		
		/* 인기 여행 일정 3개 */
		List<Map<String, Object>> trip = tripService.selectHotTrip(map);
				
		/* 추천 여행지 3개 */
		List<Map<String, Object>> recom = recommendService.selectRecomDesc(map);
				
		/* 최신 동행 구하기 4개 */
		List<Map<String, Object>> together = togetherService.selectTogetherDesc(map);
				
		/* 최신 여행 후기 3개 */
		List<Map<String, Object>> review = reviewService.selectReviewDesc(map);
		
		mv.addObject("trip", trip);
		mv.addObject("recom", recom);
		mv.addObject("together", together);
		mv.addObject("review", review);
		
		return mv;
	}
	
	/* 통합 검색 */
	@RequestMapping(value="/searchAll.tr", method=RequestMethod.GET)
	public ModelAndView searchAll(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("searchAll");
		
		String keyword = request.getParameter("searchKeyword");
		
		/* 여행 일정 검색 */
		List<Map<String, Object>> trip = tripService.searchTrip(commandMap.getMap(), request);
				
		/* 추천 여행지 검색 */
		List<Map<String, Object>> recom = recommendService.searchRecommend(commandMap.getMap(), request);
				
		/* 동행 구하기 검색 */
		List<Map<String, Object>> together = togetherService.searchTogether(commandMap.getMap(), request);
				
		/* 여행 후기 검색 */
		List<Map<String, Object>> review = reviewService.searchReview(commandMap.getMap(), request);
				
		mv.addObject("keyword", keyword);
		mv.addObject("trip", trip);
		mv.addObject("recom", recom);
		mv.addObject("together", together);
		mv.addObject("review", review);
		
		return mv;
	}
	
}
