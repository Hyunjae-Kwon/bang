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
	
	/* 게시글 댓글 신고 하기 기능 */
	@Override
	public void reportComWrite(Map<String, Object> map) throws Exception {
		reportDAO.reportComWrite(map);
	}
	
	/* 신고 게시글 삭제 처리 */
	@Override
	public void reportDelBrdUpdate(Map<String, Object> map) throws Exception {
		
		if(!map.isEmpty()) {
			for(Object key : map.values()) {
				map.put("RP_RNUM", key);
			}
		}
		
		reportDAO.reportDelBrdUpdate(map);
	}

	/* 신고 댓글 삭제 처리 */
	@Override
	public void reportDelComUpdate(Map<String, Object> map) throws Exception {
		
		if(!map.isEmpty()) {
			for(Object key : map.values()) {
				map.put("RP_RNUM", key);
			}
		}
		
		reportDAO.reportDelComUpdate(map);
	}
}
