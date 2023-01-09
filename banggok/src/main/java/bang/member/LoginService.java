package bang.member;

import java.util.Map;

public interface LoginService {
	
	/* 회원여부 확인(이름&이메일) */
	Map<String, Object> checkMem(Map<String, Object> map) throws Exception;
}