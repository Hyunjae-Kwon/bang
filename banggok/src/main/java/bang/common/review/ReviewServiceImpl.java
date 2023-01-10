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
	
	/* 여행후기 리스트 */
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.reviewList(map);
	}

	/* 여행후기 상세 */
	@Override
	public List<Map<String, Object>> reviewDetail(Map<String, Object> map) throws Exception {
		return reviewDAO.reviewDetail(map);
	}
	
	/* 여행후기 댓글 리스트 */
	@Override
	public List<Map<String, Object>> reviewCommentList(Map<String, Object> map) throws Exception {
		
		map.put("BC_BCID", map.get("BC_BCID"));
		
		return reviewDAO.reviewCommentList(map);
	}

	/* 여행후기 글쓰기 */
	@Override
	public void insertReview(Map<String, Object> map) throws Exception {
		reviewDAO.insertReview(map);
		
	}
}
