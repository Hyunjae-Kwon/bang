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
	
	/* 여행후기 수정 폼 */
	@Override
	public Map<String, Object> reviewModifyForm(Map<String, Object> map)throws Exception{
		return reviewDAO.reviewModifyForm(map);
	}

	/* 여행후기 수정 */
	public void reviewModify(Map<String, Object> map)throws Exception{
		reviewDAO.reviewModify(map);
	}
	
	/* 여행후기 삭제 */
	@Override
	public void reviewDel(Map<String, Object> map) throws Exception {
		reviewDAO.reviewDel(map);
	}

	/* 마이페이지 여행후기 리스트 */
	@Override
	public List<Map<String, Object>> myReviewList(Map<String, Object> map) {
		return reviewDAO.myReviewList(map);
	}
}
