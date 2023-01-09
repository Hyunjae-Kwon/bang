package bang.member;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	/* 회원여부 확인(이름&이메일) */
	@Override
	public Map<String, Object> checkMem(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = loginDAO.checkMem(map);
		return resultMap;
	}
}