package bang.common.review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {
	
	/* 메인 페이지 - 최신 여행 후기 3개 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("review.selectReviewDesc", map);
	}

	/* 여행후기 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("review.reviewList", map);
	}

	/* 여행후기 상세 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewDetail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("review.reviewDetail", map);
	}
	
	/* 여행후기 댓글 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>reviewCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.reviewCommentList", map);
	}

	/* 여행후기 글쓰기 */
	public void insertReview(Map<String, Object> map) {
		insert("review.insertReview", map);
	}
	
	/* 여행 후기 검색 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("review.searchReview", map);
	}
	
}
