package bang.common.recommend;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("recommendDAO")
public class RecommendDAO extends AbstractDAO {
	
	/* 메인 페이지 - 추천 여행지 3개 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecomDesc(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("recommend.selectRecomDesc", map);
	}
	
	/* 글상세 */
	@SuppressWarnings("unchecked")    
	public Map<String, Object> recommendDetail(Map<String, Object>map) throws Exception {
		return (Map<String,Object>) selectOne("recommend.recommendDetail",map);
	}
	
	/* 글목록 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> recommendList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("recommend.recommendList", map);
	}  
	
	/* 조회수 */
	public void updateCnt(Map<String, Object> map) throws Exception{
		update("recommend.updateCnt", map);
	}
	
	/* 글쓰기 */
	public void insertRecommend(Map<String, Object> map) throws Exception{
		insert("recommend.insertRecommend", map);
	}
	
	/* 글삭제 */
	public void deleteRecommend(Map<String, Object> map) throws Exception {
		delete("recommend.deleteRecommend", map);
	}
	
	/* 글수정 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> recommendModifyForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("recommend.recommendModifyForm", map); 
	}

	public void recommendModify(Map<String, Object> map)throws Exception{
		update("recommend.recommendModify", map);
	}
	
	/* 추천 */
	public void recommendLike(Map<String, Object> map) throws Exception{
		System.out.println(map.get("RC_NUM"));
		update("recommend.recommendLike", map);       
		}

	/* 댓글목록 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>rcCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("recommend.rcCommentList", map);
	}
	
	/* 댓글입력 */
	public void rcCommentWrite(Map<String, Object> map) throws Exception{
		insert("recommend.rcCommentWrite",map);
	}
	
	/* 댓글삭제 */
	public void rcCommentDelete(Map<String, Object> map) throws Exception {
		delete("recommend.rcCommentDelete", map);	
	}
	
}
