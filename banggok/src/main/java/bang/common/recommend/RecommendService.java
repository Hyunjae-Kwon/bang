package bang.common.recommend;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface RecommendService {
	
	/* 메인 페이지 - 추천 여행지 3개 */
	List<Map<String, Object>> selectRecomDesc(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 수(전체&검색) */
    int recommendCount(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 여행지 추천 게시글 리스트(전체&검색) */
	List<Map<String, Object>> recommendListPaging(Map<String, Object> map,  HttpServletRequest request) throws Exception;
	
	/* 여행지 추천 검색(메인에서 검색) */
	List<Map<String, Object>> searchRecommend(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 여행지 추천 게시글 상세보기 */
	Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception;   
	
	/* 여행지 추천 게시글 작성하기 */
	void insertRecommend(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
	
	/* 여행지 추천 게시글 삭제하기 */
	void deleteRecommend(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 수정 폼 */
	Map<String, Object> recommendModifyForm(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 수정하기 */
	void recommendModify(Map<String, Object> map)throws Exception;
	
	/* 추천하기 */
	void recommendLike(Map<String, Object> map) throws Exception;
	
	/* 관리자 - 여행지 추천 게시판 관리 */
	Map<String,Object> adminRecommendList(Map<String,Object> map) throws Exception;
}
