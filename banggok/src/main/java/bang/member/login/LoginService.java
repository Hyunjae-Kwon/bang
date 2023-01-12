package bang.member.login;

import java.util.Map;

public interface LoginService {
<<<<<<< HEAD
	
=======

>>>>>>> branch 'hyunjae' of https://github.com/Hyunjae-Kwon/bang.git
	/* 로그인 */
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception;
	
<<<<<<< HEAD
	/* 아이디 찾기=>회원여부 확인(이름&이메일) */
	Map<String, Object> checkMemId(Map<String, Object> map) throws Exception;
	
	/* 비밀번호 찾기=>회원여부 확인(아이디&이메일) */
	Map<String, Object> checkMemPw(Map<String, Object> map) throws Exception;
	
	/* 비밀번호 재설정 */
	void updatePw(Map<String, Object> map) throws Exception;
}
=======
	/* 카카오 로그인 데이터 검사 */
	public Map<String, Object> selectKakaoMemberId(Map<String, Object> map) throws Exception;
}
>>>>>>> branch 'hyunjae' of https://github.com/Hyunjae-Kwon/bang.git
