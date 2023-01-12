package bang.member.join;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
    /* ID 중복 검사 */
	@Override
	public int selectMemberIdCk(String id) throws Exception {
		return joinDAO.selectMemberIdCk(id);
	}
	
	/* Email 중복 검사 */
	@Override
	public int selectMemberEmailCk(String email) throws Exception {
		return joinDAO.selectMemberEmailCk(email);
	}
	
	/* 회원가입 등록 */
	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		joinDAO.insertMember(map);
		
	}

	/* 카카오 로그인 시 회원 등록 */
	@Override
	public void insertKakaoMember(Map<String, Object> map) throws Exception {
		joinDAO.insertKakaoMember(map);
	}
}
