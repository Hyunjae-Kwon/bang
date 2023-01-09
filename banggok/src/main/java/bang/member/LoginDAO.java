package bang.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	/* 회원여부 확인(이름&이메일) */
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkMem(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.checkMem", map);
	}
}