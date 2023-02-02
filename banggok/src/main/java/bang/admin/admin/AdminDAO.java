package bang.admin.admin;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {
	
	/* 관리자 - 회원 관리 목록 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminMemberList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList ("member.adminMemberList", map); 
	}
	
	/* 관리자 - 신고 관리 목록 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminReportList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList ("report.adminReportList", map); 
	}
	
	/* 관리자 - 신고 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminReportDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("report.adminReportDetail", map); 
	}
}
