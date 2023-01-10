package bang.common.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	/* 여행후기 리스트 */
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	/* 여행후기 상세 */
	List<Map<String, Object>> reviewDetail(Map<String, Object> map) throws Exception;

	/* 여행후기 댓글 리스트 */
	public List<Map<String, Object>> reviewCommentList(Map<String, Object> map) throws Exception;

	/* 여행후기 글쓰기 */
	void insertReview(Map<String, Object> map) throws Exception;
	
}
