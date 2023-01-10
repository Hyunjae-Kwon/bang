package bang.member.mypage;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

/* Controller 객체임을 선언 */
@Controller
public class MyPageController {

	/* 로그 출력 */
	Logger log = Logger.getLogger(this.getClass());
	
	/* MyPageService에 접근하기 위한 선언 */
	@Resource(name = "myPageService")
	private MyPageService myPageService;
	
	/* 마이페이지 */
	@RequestMapping(value = "/myPage.tr")	/* myPage.tr url을 요청 */
	public ModelAndView myPage(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myPage");	/* 화면에 보여줄 myPage.jsp파일을 의미함 */
		
		/* 로그인 시 마이페이지로 넘어갈 수 있는 코드 */
		HttpSession session = request.getSession();	/* session을 가져오고 session이 없다면 생성함 */
		String MEM_ID = (String)session.getValue("MEM_ID");	/* Value값에 들어갈 MEM_ID 생성 */
		session.setAttribute("MEM_ID", MEM_ID);	/* "MEM_ID"로 MEM_ID를 세션에 바인딩함 */
		if(request.getSession().getAttribute("MEM_ID") == null){	/* "MEM_ID"가 null값이면 */
			 response.sendRedirect("/loginForm.tr"); 	/* loginForm.tr로 보냄 */
		}
		
		return mv; /* member/myPage로 리턴함 */
	}
	
	/* 정보수정 폼 */
	@RequestMapping(value="/myInfoModifyForm.tr", method = RequestMethod.GET)
	public ModelAndView updateMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/myInfoModifyForm");
		
		/* 현재 아이디의 회원 정보를 수정하는 코드 */
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);	/* 회원 아이디를 id값으로 commandMap에 저장 */
		
		Map<String, Object> map = myPageService.selectMemberId(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	/* 정보수정 완료 */
	@RequestMapping(value = "/myInfoModify.tr", method = RequestMethod.POST)
	public ModelAndView myInfoModifyOk(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myPage.tr");
		
		myPageService.updateMember(commandMap.getMap(), request);
		
		return mv;
	}
	
	/* 회원탈퇴 */
	@RequestMapping(value="/myInfoDelete.tr", method = RequestMethod.POST)
	public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/logout.tr");
			
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		myPageService.deleteMember(commandMap.getMap());
		
		return mv;
	}
	
}
