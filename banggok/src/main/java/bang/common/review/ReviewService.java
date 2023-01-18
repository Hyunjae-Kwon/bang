package bang.common.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewService {
	
	/* 메인 페이지 - 최신 여행 후기 3개 */
	List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception;

	/* 전체 여행후기 개수 */
    int allReviewCount() throws Exception;
	
	/* 여행후기 리스트 */
	List<Map<String, Object>> reviewListPaging(Map<String, Object> map) throws Exception;

	/* 여행후기 상세 */
	List<Map<String, Object>> reviewDetail(Map<String, Object> map) throws Exception;

	/* 여행후기 댓글 리스트 */
	public List<Map<String, Object>> reviewCommentList(Map<String, Object> map) throws Exception;

	/* 여행후기 글쓰기 */
	void insertReview(Map<String, Object> map) throws Exception;
	
	/* 여행 후기 검색하기 */
	List<Map<String, Object>> searchReview(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 마이페이지 여행후기 리스트 */
	List<Map<String, Object>> myReviewList(Map<String, Object> map) throws Exception;
	
}