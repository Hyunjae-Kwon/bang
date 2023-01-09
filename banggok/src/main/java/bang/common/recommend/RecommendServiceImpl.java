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
	
}
