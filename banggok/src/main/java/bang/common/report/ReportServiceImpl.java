package bang.common.report;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportDAO")
	private ReportDAO reportDAO;

	/* 게시글 신고 하기 기능 */
	@Override
	public void reportBoardWrite(Map<String, Object> map) throws Exception {
		reportDAO.reportBoardWrite(map);
	}
}
