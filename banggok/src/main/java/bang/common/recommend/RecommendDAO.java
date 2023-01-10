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

}
