package bang.common.together;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class TogetherController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "togetherService")
	private TogetherService togetherService;

	
	/*동행게시판 리스트*/
	@RequestMapping(value = "/togetherList.tr")
	public ModelAndView togetherList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/together/togetherList");

		List<Map<String, Object>> list = togetherService.togetherList(commandMap);
		mv.addObject("list", list);
		

		return mv;
	}
	
	/*동행게시판 디테일*/
	@RequestMapping(value="/togetherDetail.tr")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/together/togetherDetail");
		
		Map<String,Object> map = togetherService.togetherDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}

}
