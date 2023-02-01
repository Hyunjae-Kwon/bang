package bang.admin.admin;

import java.util.Map;

public interface AdminService {

	/* 관리자 - 회원 관리 목록 */
	Map<String,Object> adminMemberList(Map<String,Object> map) throws Exception;
	
	/* 관리자 - 신고 관리 목록 */
	Map<String,Object> adminReportList(Map<String,Object> map) throws Exception;
	
	/* 관리자 - 신고 상세보기 */
	Map<String,Object> adminReportDetail(Map<String,Object> map) throws Exception;
}
