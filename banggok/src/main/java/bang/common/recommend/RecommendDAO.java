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
	
	/* 여행지 추천 게시글 수(전체&검색) */
	@SuppressWarnings("unchecked")
	public Map<String, Object> recommendCount(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("recommend.recommendCount", map);
	}
	
	/* 여행지 추천 게시글 리스트(전체&검색) */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> recommendListPaging(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("recommend.recommendListPaging", map);
	}
	
	/* 여행지 추천 검색(메인에서 검색) */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchRecommend(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("recommend.searchRecommend", map);
	}
	
	/* 여행지 추천 게시글 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> recommendDetail(Map<String, Object>map) throws Exception {
		return (Map<String,Object>) selectOne("recommend.recommendDetail",map);
	}

	/* 조회수 증가 */
	public void updateCnt(Map<String, Object> map) throws Exception{
		update("recommend.updateCnt", map);
	}

	/* 여행지 추천 게시글 작성하기 */
	public void insertRecommend(Map<String, Object> map) throws Exception{
		insert("recommend.insertRecommend", map);
	}
	
	/* 여행지 추천 게시글 삭제하기 */
	public void deleteRecommend(Map<String, Object> map) throws Exception {
		delete("recommend.deleteRecommend", map);
	}
	
	/* 여행지 추천 게시글 수정 폼 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> recommendModifyForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("recommend.recommendModifyForm", map); 
	}

	/* 여행지 추천 게시글 수정하기 */
	public void recommendModify(Map<String, Object> map)throws Exception{
		update("recommend.recommendModify", map);
	}
	
	/* 추천하기 */
	public void recommendLike(Map<String, Object> map) throws Exception {
		System.out.println(map.get("RC_NUM"));
		update("recommend.recommendLike", map);       
	}
	
	/* 관리자 - 여행지 추천 게시판 관리 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminRecommendList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList ("recommend.adminRecommendList", map); 
	}
	
}
