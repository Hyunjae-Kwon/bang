package bang.common.recommend;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	
	/* 글목록 */
	@Override
	public List<Map<String, Object>> recommendList(Map<String,Object> map) throws Exception{
		return recommendDAO.recommendList(map);
	}  
	
	/* 글상세 */
	@Override		
	public Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception {
		recommendDAO.updateCnt(map);
		Map<String, Object> resultMap = recommendDAO.recommendDetail(map);
		return resultMap;
	}
	
	/* 글쓰기 */
	@Override 
	public void insertRecommend(Map<String, Object> map) throws Exception { 
		recommendDAO.insertRecommend(map);
	}
	
	/* 글삭제 */
	@Override
	public void deleteRecommend(Map<String, Object> map) throws Exception {
		recommendDAO.deleteRecommend(map);
	}
	
	/* 글수정 */
	@Override
	public Map<String, Object> recommendModifyForm(Map<String, Object> map) throws Exception{
		return recommendDAO.recommendModifyForm(map);
	}

	public void recommendModify(Map<String, Object> map) throws Exception{
		recommendDAO.recommendModify(map);
	}
	
	/* 추천 */
	@Override
	public void recommendLike(Map<String, Object> map) throws Exception{
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
	
	
}
