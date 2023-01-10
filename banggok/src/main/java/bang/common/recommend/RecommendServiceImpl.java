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
	@Override		//GOODS ㅎㅎㄱㅂㅈ
	public Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception {
		recommendDAO.updateCnt(map);
		Map<String, Object> resultMap = recommendDAO.recommendDetail(map);
		return resultMap;
	}
	
	/* 글쓰기 */
	@Override 
	public void recommendInsert(Map<String, Object> map) throws Exception { 
		recommendDAO.recommendInsert(map);
	}
	
}
