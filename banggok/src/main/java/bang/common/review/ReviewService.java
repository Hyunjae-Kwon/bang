package bang.common.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ReviewService {
	
	/* 메인 페이지 - 최신 여행 후기 3개 */
	List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception;

	/* 여행 후기 수(전체,검색) */
    int reviewCount(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 여행 후기 리스트(전체&검색) */
	List<Map<String, Object>> reviewListPaging(Map<String, Object> map,  HttpServletRequest request) throws Exception;
    
	/* 추천하기 */
	void reviewLike(Map<String, Object> map) throws Exception;
	
	/* 여행후기 상세 */
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;

	/* 여행후기 글쓰기 */
	void insertReview(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
	
	/* 여행 후기 검색 */
	List<Map<String, Object>> searchReview(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
	/* 마이페이지 여행후기 리스트 리스트 */
	Map<String,Object> myReviewList(Map<String,Object> map) throws Exception;
	
	/* 여행후기 수정 */
	void reviewModify(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
	
	/* 여행후기 삭제 */
	void reviewDelete(Map<String, Object> map) throws Exception;
	
	/* 관리자 - 여행 후기 게시판 관리 */
	Map<String,Object> adminReviewList(Map<String,Object> map) throws Exception;

}