package bang.common.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

	/* 여행 일정 검색하기 */
	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return reviewDAO.searchReview(map);
	}
	
    /* 마이페이지 여행후기 리스트 */
	@Override
	public List<Map<String, Object>> myReviewList(Map<String, Object> map) throws Exception {
		
		return reviewDAO.myReviewList(map);
	}
	
	
}
