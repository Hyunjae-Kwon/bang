package bang.common.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.recommend.RecommendService;
import bang.common.review.ReviewService;
import bang.common.together.TogetherService;
import bang.common.trip.TripService;

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
	
	/* 메인 페이지 */
	@RequestMapping(value="/main.tr", method=RequestMethod.GET)
	public ModelAndView main(Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("main_layout");
		
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
	
}
