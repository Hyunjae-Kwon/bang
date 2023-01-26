package bang.common.chat;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	Logger log = Logger.getLogger(this.getClass());

	/* 채팅방 만들기 */
	@RequestMapping("/chat.tr")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView("chat/chat");
		return mv;
	}
	
	/* 채팅창 */
	@RequestMapping("/chatWindow.tr")
	public ModelAndView chatWindow() {
		ModelAndView mv = new ModelAndView("chat/chatWindow");
		return mv;
	}
	
}
