package bang.member;

import java.util.Map;

public interface LoginService {
	
	/* 아이디 찾기=>회원여부 확인(이름&이메일) */
	Map<String, Object> checkMemId(Map<String, Object> map) throws Exception;
	
	/* 비밀번호 찾기=>회원여부 확인(아이디&이메일) */
	Map<String, Object> checkMemPw(Map<String, Object> map) throws Exception;
}