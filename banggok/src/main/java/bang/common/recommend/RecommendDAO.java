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
	
	/* 글상세 ----------------------------*/
	@SuppressWarnings("unchecked")    //BOARD ㅎㅎㄱㅂㅈ
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
	

}