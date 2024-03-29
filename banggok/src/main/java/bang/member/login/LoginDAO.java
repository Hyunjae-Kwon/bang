package bang.member.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	/* 로그인 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectMemberId", map);
	}

	/* 아이디 찾기=>회원여부 확인(이름&이메일) */
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkMemId(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.checkMemId", map);
	}
		
	/* 비밀번호 찾기=>회원여부 확인(아이디&이메일) */
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkMemPw(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.checkMemPw", map);
	}
	
	/* 비밀번호 재설정 */
	public void updatePw(Map<String, Object> map) throws Exception {
		update("member.updatePw", map);
	}

	/* 카카오 로그인 데이터 검사 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectKakaoMemberId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectKakaoMemberId", map);
	}
	
	/* 네이버 로그인 데이터 검사 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNaverMemberId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectNaverMemberId", map);
	}

}
