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
	void insertRecommend(Map<String, Object> map) throws Exception;
	
	/* 글삭제 */
	void deleteRecommend(Map<String, Object> map) throws Exception;
	
	/* 글수정 */
	Map<String, Object> recommendModifyForm(Map<String, Object> map) throws Exception;
	 
	void recommendModify(Map<String, Object> map)throws Exception;
	
	/* 추천 */
	void recommendLike(Map<String, Object> map) throws Exception;
	
	/* 댓글리스트 */
	public List<Map<String, Object>> rcCommentList(Map<String, Object> map) throws Exception;
	
	/* 댓글쓰기 */
	public void rcCommentWrite(Map<String, Object> map)throws Exception;
	
	/* 댓글삭제 */
	public void rcCommentDelete(Map<String, Object> map) throws Exception;

	

}
