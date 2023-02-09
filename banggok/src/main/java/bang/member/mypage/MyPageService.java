package bang.member.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MyPageService {

	/* 로그인 정보 불러오기 */
	Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception;

	/* 회원 정보 수정 */
	void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 회원 탈퇴 */
	void deleteMember(Map<String, Object> map) throws Exception;
	
	/* 회원 이미지 가져오기 */
	Map<String, Object> getMemberImage(Map<String, Object> map) throws Exception;
	
}
