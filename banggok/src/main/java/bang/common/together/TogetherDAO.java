package bang.common.together;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("togetherDAO")
public class TogetherDAO extends AbstractDAO {
	
	/* 메인 페이지 - 최신 동행 구하기 4개 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("together.selectTogetherDesc", map);
	}

}
