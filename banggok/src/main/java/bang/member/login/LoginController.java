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
import org.springframework.web.servlet.ModelAndView;

import bang.member.login.LoginService;
import bang.common.common.CommandMap;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;
	
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
    public ModelAndView login(CommandMap commandMap,HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("login/login");
       HttpSession session = request.getSession();
     
       Map<String,Object> result = loginService.selectMemberId(commandMap.getMap());
       if(result == null || result.get("MEM_ID").equals("N")) { /* 아이디가 있는지 or 삭제된 아이디인지 확인*/
          mv.addObject("msg","회원을 찾을 수 없습니다.");
          mv.addObject("url", "/loginForm.tr");
          return mv;
       } else { 
          if(result.get("MEM_PW").equals(commandMap.get("MEM_PW"))) { /*비밀번호가 같다면*/
                if(result.get("MEM_BLOCK").equals("Y")) {
                  mv.addObject("msg","정지된 회원입니다.");
                  mv.addObject("url", "/loginForm.tr");
                  return mv;
                }
                session.setAttribute("MEM_ID", commandMap.get("MEM_ID"));
                session.setAttribute("MEM_NUM", result.get("MEM_NUM")); 
                
				/* 관리자 체크*/
				if (result.get("MEM_ID").equals("ADMIN")) {
					mv.addObject("msg", "관리자 로그인 성공!");
					mv.addObject("url", "/adminMain.tr");
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

}
