package bang.common.report;

import java.util.Map;

public interface ReportService {

	/* 게시글 신고 하기 기능 */
	void reportBoardWrite(Map<String,Object> map) throws Exception;
}
