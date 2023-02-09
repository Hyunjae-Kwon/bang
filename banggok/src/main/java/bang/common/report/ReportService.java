package bang.common.report;

import java.util.Map;

public interface ReportService {

	/* 게시글 신고 하기 기능 */
	void reportBoardWrite(Map<String,Object> map) throws Exception;
	
	/* 게시글 댓글 신고 하기 기능 */
	void reportComWrite(Map<String,Object> map) throws Exception;
	
	/* 신고 게시글 삭제 처리 */
	void reportDelBrdUpdate(Map<String, Object> map) throws Exception;
	
	/* 신고 댓글 삭제 처리 */
	void reportDelComUpdate(Map<String, Object> map) throws Exception;
}
