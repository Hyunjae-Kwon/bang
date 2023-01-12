package bang.common.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	/* 메인 페이지 - 최신 여행 후기 3개 */
	List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception;
	
	/* 여행후기 리스트 */
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	/* 여행후기 상세 */
	List<Map<String, Object>> reviewDetail(Map<String, Object> map) throws Exception;

	/* 여행후기 댓글 리스트 */
	public List<Map<String, Object>> reviewCommentList(Map<String, Object> map) throws Exception;

	/* 여행후기 글쓰기 */
	void insertReview(Map<String, Object> map) throws Exception;
	
	/* 여행후기 수정 폼 */
	Map<String, Object> reviewModifyForm(Map<String, Object> map) throws Exception;
	 
	/* 여행후기 수정 */
	void reviewModify(Map<String, Object> map) throws Exception;
	
	/* 여행후기 삭제 */
	void reviewDel(Map<String, Object> map) throws Exception;

	/* 마이페이지 여행후기 리스트 */
	List<Map<String, Object>> myReviewList(Map<String, Object> map);
}
