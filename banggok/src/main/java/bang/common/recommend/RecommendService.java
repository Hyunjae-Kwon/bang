package bang.common.recommend;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RecommendService {
	
	/* 메인 페이지 - 추천 여행지 3개 */
	List<Map<String, Object>> selectRecomDesc(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 리스트 */
	List<Map<String,Object>> recommendList(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 상세보기 */
	Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception;   //GOODS ㅎㅎㄱㅂㅈ
	
	/* 여행지 추천 게시글 작성하기 */
	void insertRecommend(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 삭제하기 */
	void deleteRecommend(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 수정 폼 */
	Map<String, Object> recommendModifyForm(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 수정하기 */
	void recommendModify(Map<String, Object> map)throws Exception;
	
	/* 추천하기 */
	int recommendLike(Map<String, Object> map) throws Exception;
	
	/* 여행지 추천 게시글 검색하기 */
	List<Map<String, Object>> searchRecommend(Map<String, Object> map, HttpServletRequest request) throws Exception;
}
