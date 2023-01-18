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

	/* 전체 여행후기 개수 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> allReviewCount() throws Exception {
		return (Map<String, Object>) selectOne("review.allReviewCount");
	}
	
	/* 여행후기 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewListPaging(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("review.reviewListPaging", map);
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
	
	/* 여행후기 수정 폼 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewModifyForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("review.reviewModifyForm", map); 
	}

	/* 여행후기 수정 */
	public void reviewModify(Map<String, Object> map)throws Exception{
		update("review.reviewModify", map);
	}
	
	/* 여행후기 삭제 */
	public void reviewDel(Map<String, Object> map) throws Exception {
		delete("review.reviewDel", map);
	}

	/* 마이페이지 여행후기 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myReviewList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("review.myReviewList", map);
	}

	/* 여행 후기 검색 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("review.searchReview", map);
	}
}
