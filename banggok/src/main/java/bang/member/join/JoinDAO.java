package bang.member.join;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {
	
	/* ID 중복 확인 */
	public int selectMemberIdCk(String id) throws Exception {
		return (Integer) selectOne("member.selectMemberIdCk", id);
	}
	
	/* 회원가입 등록 */
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember", map);
	}
	
	/* 카카오 로그인 시 회원 등록 */
	public void insertKakaoMember(Map<String, Object> map) throws Exception {
		insert("member.insertKakaoMember", map);
	}

}
