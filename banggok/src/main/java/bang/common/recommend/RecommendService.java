package bang.common.recommend;

import java.util.List;
import java.util.Map;

public interface RecommendService {
	
	/* 메인 페이지 - 추천 여행지 3개 */
	List<Map<String, Object>> selectRecomDesc(Map<String, Object> map) throws Exception;
	
	/* 추천글리스트 */
	List<Map<String,Object>> recommendList(Map<String, Object> map) throws Exception;
	
	/* 글 상세보기 */
	Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception;   //GOODS ㅎㅎㄱㅂㅈ
	/* 글쓰기 */
	void recommendInsert(Map<String, Object> map) throws Exception;

}
