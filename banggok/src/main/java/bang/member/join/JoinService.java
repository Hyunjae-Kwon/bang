package bang.member.join;

import java.util.Map;

public interface JoinService {
	
	/* ID 중복 확인 */
	int selectMemberIdCk(String id) throws Exception;
	
	/* 회원가입 등록 */
	void insertMember(Map<String, Object> map) throws Exception;
	
	/* 카카오 로그인 시 회원 등록 */
	void insertKakaoMember(Map<String, Object> map) throws Exception;

}
