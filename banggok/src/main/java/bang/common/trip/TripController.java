package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class TripController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	/* 여행 일정 */
	@Resource(name="tripService")
	private TripService tripService;

	/* 여행 일정 공유 게시판 리스트 */
	@RequestMapping(value="/tripList.tr", method=RequestMethod.GET)
	public ModelAndView tripList(Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripList");
		
		/* 공유된 여행 일정 전체 가져오기 */
		List<Map<String, Object>> trip = tripService.tripList(map);
				
		mv.addObject("trip", trip);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시글 상세보기 */
	@RequestMapping(value="/tripDetail.tr")
	public ModelAndView tripDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripDetail");
		
		/* TR_NUM 을 이용해서 글 상세 내용 불러오기 */
		Map<String, Object> trip = tripService.tripDetail(commandMap.getMap());
				
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
	
	/* 여행 일정 공유 게시판 검색 */
	@RequestMapping(value="/searchTrip.tr", method=RequestMethod.GET)
	public ModelAndView searchTrip(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("trip/searchTrip");
		
		String keyword = request.getParameter("keyword");
		
		List<Map<String, Object>> trip = tripService.searchTrip(commandMap.getMap(), request);
				
		mv.addObject("keyword", keyword);
		mv.addObject("trip", trip);
		
		return mv;
	}
}
