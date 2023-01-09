package bang.common.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;

	/* 메인 페이지 - 최신 여행 후기 3개 */
	@Override
	public List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception {
		return reviewDAO.selectReviewDesc(map);
	}
	
}
