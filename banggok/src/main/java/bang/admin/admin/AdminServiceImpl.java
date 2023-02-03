package bang.admin.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;

	/* 관리자 - 회원 관리 목록 */
	@Override
	public Map<String, Object> adminMemberList(Map<String, Object> map) throws Exception {
		return adminDAO.adminMemberList(map);
	}
	
	/* 관리자 - 신고 관리 목록 */
	@Override
	public Map<String, Object> adminReportList(Map<String, Object> map) throws Exception {
		return adminDAO.adminReportList(map);
	}
	
	/* 관리자 - 신고 상세보기 */
	@Override
	public Map<String, Object> adminReportDetail(Map<String, Object> map) throws Exception {
		return adminDAO.adminReportDetail(map);
	}
}
