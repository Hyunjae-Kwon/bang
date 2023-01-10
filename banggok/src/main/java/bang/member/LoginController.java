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
	
	/* 회원아이디 찾기 */
	@RequestMapping(value = "/findId.tr")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findId");
		
		return mv;
	}
	
	/* 회원여부 확인(이름&이메일) */
	@RequestMapping(value = "/checkMem.tr")
	@ResponseBody
	public ModelAndView checkMem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findId");
		
//		System.out.println("MEM_NAME ="+commandMap.get("MEM_NAME"));
//		System.out.println("MEM_EMAIL="+commandMap.get("MEM_EMAIL"));
			
		Map<String, Object> data = loginService.checkMem(commandMap.getMap());
		mv.addObject("MEM_ID", data);
		System.out.println(data);
		System.out.println(mv);
		
		return mv;
	}
	
	
	
	
//	@RequestMapping(value = "/findIdResult.omc", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
//	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("login/findIdResult");
//		List<Map<String, Object>> list = loginService.findId(commandMap.getMap());
//		mv.addObject("list", list);
//		return mv;
//	}
//		 
//	//비밀번호찾기 
//	@RequestMapping(value = "/findPw.omc")
//	public ModelAndView findPw(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("login/findPw");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/findPwResult.omc", method = RequestMethod.POST) // 입력한 정보에 맞춰서 비밀번호를 찾아주는 거
//	public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("login/findPwResult");
//		List<Map<String, Object>> list = loginService.findPw(commandMap.getMap());
//		mv.addObject("list", list);
//		return mv;
//	}		
}