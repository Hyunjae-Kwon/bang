package bang.common.chat;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class ChatController {

	Logger log = Logger.getLogger(this.getClass());
	
	/* 채팅 기능 폼만 만들어둠. chatForm은 url검색해서 들어가야 볼 수 있음. */
	/* 실시간 채팅창 */
	@RequestMapping(value = "/chatForm.tr")
	public ModelAndView chatForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("chat/chatForm");
		return mv;
	}
	
	/* 메시지함 */
	@RequestMapping(value = "/chatBox.tr")
	public ModelAndView chatBox(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("chat/chatBox");
		return mv;
	}
}
