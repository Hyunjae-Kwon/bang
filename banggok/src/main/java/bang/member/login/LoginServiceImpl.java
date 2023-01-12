package bang.member.login;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import bang.member.login.LoginDAO;
import bang.member.login.LoginService;

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
	
	/* 카카오 로그인 데이터 검사 */
	@Override
	public Map<String, Object> selectKakaoMemberId(Map<String, Object> map) throws Exception {
		return loginDAO.selectKakaoMemberId(map);
	}

}
