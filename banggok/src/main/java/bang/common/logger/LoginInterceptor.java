package bang.common.logger;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("------------------ Interceptor : LoginInterceptor ------------------ ");
		
		String loginId = (String) request.getSession().getAttribute("MEM_ID");
		String uri = request.getRequestURI();

		System.out.println("uri :" + uri);
		if(loginId == null &&
				(
					uri.equals("/bang/main.tr") || uri.equals("/bang/loginForm.tr") || uri.equals("/bang/login.tr") ||
					uri.equals("/bang/joinForm.tr") || uri.equals("/bang/joinSuccess.tr") || uri.equals("/bang/findId.tr") ||
					uri.equals("/bang/findIdResult.tr") || uri.equals("/bang/findPw.tr") || uri.equals("/bang/findPwResult.tr") ||
					uri.equals("/bang/confirmId.tr") || uri.equals("/bang/tripWriteForm.tr") || uri.equals("/bang/togetherList.tr") ||
					uri.equals("/bang/tripList.tr") || uri.equals("/bang/reviewList.tr") || uri.equals("/bang/recommendList.tr") ||
					uri.equals("/bang/tripListScroll.tr") || uri.equals("/bang/reviewListScroll.tr") || uri.equals("/bang/recommendListScroll.tr") ||
					uri.equals("/bang/GetTempFile.tr") || uri.equals("/bang/confirmEmail.tr") || uri.equals("/bang/confirmMail.tr") ||
					uri.equals("/bang/getMemberImage.tr") || uri.equals("/bang/getProfileFile.tr")
				)) {
			System.out.println("- 로그인하지 않음 -");
			return true;
		} else if(loginId != null) {
			/* 로그인했을 경우 */

				System.out.println("uri.substring(1, 6) : " + uri.substring(1, 6));
				
				/* 일반 사용자인 경우 관리자 페이지에 접근 불가 */
				if( (!loginId.equals("admin")) && (
						uri.substring(1, 6).equals("admin") || uri.equals("/bang/adminPage.tr") || uri.equals("/bang/adminTripList.tr") ||
						uri.equals("/bang/adminReviewList.tr") || uri.equals("/bang/adminTogetherList.tr") || uri.equals("/bang/adminRecommendList.tr") ||
						uri.equals("/bang/adminReportList.tr") || uri.equals("/bang/adminMemberList.tr") || uri.equals("/bang/adminMemberModifyForm.tr") ||
						uri.equals("/bang/adminReportDetail.tr") || uri.equals("/bang/recommendWriteForm.tr")
						)) {
					System.out.println("- 일반 사용자가 관리자 페이지에 접근 -");
					response.sendRedirect("main.tr");
					return false;					
				}
				/* 관리자일 경우와 일반 사용자가 관리자 페이지가 아닌 페이지에 접근할 경우*/
				else {
					System.out.println("- 로그인 함 올바른 사용 -");
					return true;				
				}				
		} else {
			/* 로그인하지 않았을 때 사용할 수 없는 페이지에 접근할 경우 */
			System.out.println("- 로그인하지않았는데 사용할 수 없는 페이지에 접근 -");
			
			/* 인증 메시지 출력 후 주소로 이동 */
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다. 회원가입을 해주세요'); location.href='/bang/loginForm.tr';</script>");
			out.flush();
					 
			return false;
		}
	}
}