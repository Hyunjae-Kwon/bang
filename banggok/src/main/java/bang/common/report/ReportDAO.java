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
}
