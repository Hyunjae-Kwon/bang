package bang.member.login;

import java.util.Map;

public interface LoginService {

	/* 로그인 */
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception;
	
	/* 카카오 로그인 데이터 검사 */
	public Map<String, Object> selectKakaoMemberId(Map<String, Object> map) throws Exception;
}
