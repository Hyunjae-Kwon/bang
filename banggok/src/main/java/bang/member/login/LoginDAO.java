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

	/* 카카오 로그인 데이터 검사 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectKakaoMemberId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectKakaoMemberId", map);
	}

}
