package bang.common.recommend;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("recommendService")
public class RecommendServiceImpl implements RecommendService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="recommendDAO")
	private RecommendDAO recommendDAO;

	/* 메인 페이지 - 추천 여행지 3개 */
	@Override
	public List<Map<String, Object>> selectRecomDesc(Map<String, Object> map) throws Exception {
		return recommendDAO.selectRecomDesc(map);
	}
	
	/* 여행지 추천 게시글 수(전체&검색) */
	@Override
	public int recommendCount(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String,Object> mapCount = recommendDAO.recommendCount(map);
		return Integer.parseInt(String.valueOf(mapCount.get("COUNT")));
	}	
	
	/* 여행지 추천 게시글 리스트(전체&검색) */
	@Override
	public List<Map<String, Object>> recommendListPaging(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return recommendDAO.recommendListPaging(map);
	}
	
	/* 여행지 추천 검색(메인에서 검색) */
	@Override
	public List<Map<String, Object>> searchRecommend(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return recommendDAO.searchRecommend(map);
	}
	
	/* 여행지 추천 게시글 상세보기 */
	@Override		
	public Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception {
		recommendDAO.updateCnt(map);
		Map<String, Object> resultMap = recommendDAO.recommendDetail(map);
		return resultMap;
	}
	
	/* 여행지 추천 게시글 작성하기 */
	@Override 
	public void insertRecommend(Map<String, Object> map) throws Exception { 
		recommendDAO.insertRecommend(map);
	}
	
	/* 여행지 추천 게시글 삭제하기 */
	@Override
	public void deleteRecommend(Map<String, Object> map) throws Exception {
		recommendDAO.deleteRecommend(map);
	}
	
	/* 여행지 추천 게시글 수정 폼 */
	@Override
	public Map<String, Object> recommendModifyForm(Map<String, Object> map) throws Exception{
		return recommendDAO.recommendModifyForm(map);
	}

	/* 여행지 추천 게시글 수정하기 */
	public void recommendModify(Map<String, Object> map) throws Exception{
		recommendDAO.recommendModify(map);
	}
	
	/* 추천하기 */
	@Override
	public void recommendLike(Map<String, Object> map) throws Exception {
		recommendDAO.recommendLike(map);
	}

	/* 댓글목록 */
	@Override
	public List<Map<String, Object>> rcCommentList(Map<String, Object> map) throws Exception {
		
		map.put("BC_BCID", map.get("BC_BCID"));
		
		return recommendDAO.rcCommentList(map);
	}
	
	/* 댓글입력 */
	@Override
	public void rcCommentWrite(Map<String, Object> map) throws Exception {
		
		map.put("BC_NUM", map.get("BC_NUM"));
		map.put("BC_ID", map.get("BC_ID"));
		map.put("BC_COMMENT", map.get("BC_COMMENT"));
		
		recommendDAO.rcCommentWrite(map);
	}
	
	/* 댓글삭제 */
	@Override
	public void rcCommentDelete(Map<String, Object> map) throws Exception {
		recommendDAO.rcCommentDelete(map);
	}

	/* 관리자 - 여행지 추천 게시판 관리 */
	@Override
	public Map<String, Object> adminRecommendList(Map<String, Object> map) throws Exception {
		return recommendDAO.adminRecommendList(map);
	}

}
