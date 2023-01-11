package bang.member.mypage;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import bang.member.mypage.MyPageDAO;
import bang.member.mypage.MyPageService;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {

	@Resource(name="myPageDAO")
	private MyPageDAO myPageDAO;
	
	/* 회원 정보 가져오기 */
	@Override
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = myPageDAO.selectMemberId(map);
		return resultMap;
	}
	
	/* 회원 정보 수정 */
	@Override
	public void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myPageDAO.updateMember(map);
	}

	/* 회원 탈퇴 */
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		myPageDAO.deleteMember(map);
	}
	
}
