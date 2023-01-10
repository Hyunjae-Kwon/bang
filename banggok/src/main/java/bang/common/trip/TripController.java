package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
		List<Map<String, Object>> trip = tripService.selectAllShareTrip(map);
				
		mv.addObject("trip", trip);
		
		return mv;
	}
	
	/* 여행 일정 공유 게시판 상세보기 */
	@RequestMapping(value="/tripDetail.tr")
	public ModelAndView tripDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("trip/tripDetail");
		
		/* TR_NUM 을 이용해서 글 상세 내용 불러오기 */
		Map<String, Object> trip = tripService.selectSharedTrip(commandMap.getMap());
				
		mv.addObject("trip", trip);
		
		return mv;
	}
}
