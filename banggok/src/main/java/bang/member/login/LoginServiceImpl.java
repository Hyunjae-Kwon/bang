package bang.member.login;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	/* 로그인 */
	@Override
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		return loginDAO.selectMemberId(map);
	}

	/* 아이디 찾기=>회원여부 확인(이름&이메일) */
	@Override
	public Map<String, Object> checkMemId(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = loginDAO.checkMemId(map);
		return resultMap;
	}
	
	/* 비밀번호 찾기=>회원여부 확인(아이디&이메일) */
	@Override
	public Map<String, Object> checkMemPw(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = loginDAO.checkMemPw(map);
		return resultMap;
	}
	
	/* 비밀번호 재설정 */
	@Override
	public void updatePw(Map<String, Object> map) throws Exception {
		loginDAO.updatePw(map);
	}

	/* 카카오 로그인 데이터 검사 */
	@Override
	public Map<String, Object> selectKakaoMemberId(Map<String, Object> map) throws Exception {
		return loginDAO.selectKakaoMemberId(map);
	}
	
	/* 네이버 로그인 데이터 검사 */
	@Override
	public Map<String, Object> selectNaverMemberId(Map<String, Object> map) throws Exception {
		return loginDAO.selectNaverMemberId(map);
	}
}
