package bang.member;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	/* 아이디 찾기 */
	@RequestMapping(value = "/findId.tr")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findId");
		
		return mv;
	}
	
	/* 아이디 찾기=>회원여부 확인(이름&이메일) */
	@RequestMapping(value = "/checkMemId.tr")
	@ResponseBody
	public String checkMemId(CommandMap commandMap) throws Exception {
				
		String MEM_ID = null;//ajax String값 전달(value값만 전달)
		
		Map<String, Object> data = loginService.checkMemId(commandMap.getMap());
		try {
			MEM_ID = (String) data.get("MEM_ID");
		} catch(NullPointerException e) {}		
		
		System.out.println(MEM_ID);
		
		return MEM_ID;
	}
	
	/* 비밀번호 찾기 */
	@RequestMapping(value = "/findPw.tr")
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findPw");
		
		return mv;
	}
	
	/* 비밀번호 찾기=>회원여부 확인(아이디&이메일) */
	@RequestMapping(value = "/checkMemPw.tr")
	@ResponseBody
	public String checkMemPw(CommandMap commandMap) throws Exception {
				
		String MEM_ID = null;//ajax String값 전달(value값만 전달)
		
		Map<String, Object> data = loginService.checkMemPw(commandMap.getMap());
		try {
			MEM_ID = (String) data.get("MEM_ID");
		} catch(NullPointerException e) {}		
		
		System.out.println(MEM_ID);
		
		return MEM_ID;
	}
}