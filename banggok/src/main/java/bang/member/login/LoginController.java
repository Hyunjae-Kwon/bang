package bang.member.login;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;
import bang.member.join.MailService;
import bang.member.join.JoinService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "mailService")
	private MailService mailService;

	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "joinService")
	private JoinService joinService;

	/*로그인폼*/
	@RequestMapping(value = "/loginForm.tr")
	public String loginForm(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String getId = (String) session.getValue("MEM_ID");
		if (getId == null) {
			return "login/loginForm";
		}
		return "main";
	}

	/*로그인 처리*/
	@RequestMapping(value = "/login.tr", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/login");
		HttpSession session = request.getSession();
		Map<String,Object> result = loginService.selectMemberId(commandMap.getMap());		/* 회원 정보 조회 */
		
		/* 카카오로 로그인 한 경우 */
		if(request.getParameter("kakaoEmail") != null) {	/* kakaoEmail이 전달됐다면 */
			Map<String, Object> kakao = loginService.selectKakaoMemberId(commandMap.getMap());	/* 카카오 최초 로그인인지 확인 */
			/* 최초 로그인인 경우 */
			if(kakao == null) {
				joinService.insertKakaoMember(commandMap.getMap());	/* 카카오로 로그인하면서 전달받은 정보로 회원 가입 */
			}
			
			session.setAttribute("MEM_ID", request.getParameter("kakaoEmail"));	/* 카카오 이메일을 회원 아이디로 세션에 저장 */
			
			mv.addObject("msg", "카카오 로그인 및 간편 회원 가입 성공!");
			mv.addObject("url", "/main.tr");
			
			return mv;
			
		}
		
		/* 네이버로 로그인 한 경우 */
		if(request.getParameter("naverEmail") != null) {	/* 네이버 id가 전달됐다면 */
			Map<String, Object> naver = loginService.selectNaverMemberId(commandMap.getMap());	/* 네이버 최초 로그인인지 확인 */
			/* 최초 로그인인 경우 */
			if(naver == null) {
				joinService.insertNaverMember(commandMap.getMap());	/* 네이버로 로그인하면서 전달받은 정보로 회원 가입 */
			}
			
			session.setAttribute("MEM_ID", request.getParameter("naverEmail"));	/* 네이버아이디를 회원 아이디로 세션에 저장 */
			
			mv.addObject("msg", "네이버 로그인 성공!");
			mv.addObject("url", "/main.tr");
			
			return mv;
			
		}
		
		if(result == null || result.get("MEM_ID").equals("N")) {
			mv.addObject("msg","회원을 찾을 수 없습니다.");
			mv.addObject("url", "/loginForm.tr");
			
			return mv;
		} else {  /* 회원 정보가 있거나 카카오로 로그인 */
			
			if(result.get("MEM_PW").equals(commandMap.get("MEM_PW"))) { /* 비밀번호가 같다면 */
				if(result.get("MEM_BLOCK").equals("Y")) {
					mv.addObject("msg","정지된 회원입니다.");
					mv.addObject("url", "/loginForm.tr");
					
					return mv;
				}
				session.setAttribute("MEM_ID", commandMap.get("MEM_ID"));
				session.setAttribute("MEM_NUM", result.get("MEM_NUM")); 

				/* 관리자 체크*/
				if (result.get("MEM_ID").equals("admin")) {
					mv.addObject("msg", "관리자 로그인 성공!");
					mv.addObject("url", "/adminPage.tr");
					
					return mv;
				} else {
					mv.addObject("url", "/bang/main.tr");
				}
			} else {  /*비밀번호가 일치하지 않을 때*/
				mv.addObject("msg", "비밀번호가 틀립니다.");
				mv.addObject("url", "/loginForm.tr");
				
				return mv;
			}
		}
		mv.addObject("msg", "로그인성공!");
		mv.addObject("url","/main.tr");
		
		return mv;
	}

	/*로그아웃*/
	@RequestMapping(value="/logout.tr")
	public void logout(HttpServletRequest request,HttpServletResponse response,CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('로그아웃됐습니다.'); location.href='"+request.getContextPath()+"/main.tr';</script>");

		out.flush();
	}
	
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
	
	/* 아이디 찾기 결과 */
	@RequestMapping(value = "/findIdResult.tr")
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findIdResult");
		
		Map<String, Object> member = loginService.checkMemId(commandMap.getMap()); 
		mv.addObject("mem", member);
		
		return mv;
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
	
	/* 비밀번호 찾기 결과 */
	@RequestMapping(value = "/findPwResult.tr")
	public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findPwResult");
		
		mv.addObject("mem", commandMap.getMap());
		
		return mv;
	}
	
	/* 비밀번호 재설정 */
	@RequestMapping(value = "/updatePw.tr")
	public ModelAndView updatePw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findPwResult");
		
		loginService.updatePw(commandMap.getMap());
		
		return mv;
	}
		
	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck.tr")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
}