package bang.common.report;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO {
	
	/* 게시글 신고 하기 기능 */
	public void reportBoardWrite(Map<String, Object> map) throws Exception {
		insert ("report.reportBoardWrite", map); 
	}
	
	/* 게시글 댓글 신고 하기 기능 */
	public void reportComWrite(Map<String, Object> map) throws Exception {
		insert ("report.reportComWrite", map); 
	}
	
	/* 신고 게시글 삭제 처리 */
	public void reportDelBrdUpdate(Map<String, Object> map) throws Exception {
		update ("report.reportDelBrdUpdate", map); 
	}
	
	/* 신고 댓글 삭제 처리 */
	public void reportDelComUpdate(Map<String, Object> map) throws Exception {
		update ("report.reportDelComUpdate", map); 
	}
}
