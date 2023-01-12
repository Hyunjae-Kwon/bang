package bang.member.join;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class JoinController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService")
	private JoinService joinService;

	@Resource(name = "mailService")
	private MailService mailService;

	/* 회원가입 폼 */
	@RequestMapping(value = "/joinForm.tr", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("join/joinForm");
		return mv;
	}

	/* id 중복 체크 */
	@RequestMapping(value = "/confirmId.tr", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String id) throws Exception {

		log.info("id =" + id);

		int result = joinService.selectMemberIdCk(id);
		log.info(result);

		return String.valueOf(result);
	}
    
	/* 이메일 인증 */
	@RequestMapping(value = "/confirmMail.tr", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	/* 회원가입완료 */
	@RequestMapping(value = "/joinSuccess.tr", method = RequestMethod.POST)
	public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/join/joinSuccess");

		/* 회원가입 성공 */
		mv.addObject("msg", "회원가입 성공!");
		mv.addObject("url", "/bang/loginForm.tr");

		joinService.insertMember(commandMap.getMap());

		return mv;
	}

}
