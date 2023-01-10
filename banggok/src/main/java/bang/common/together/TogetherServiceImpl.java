package bang.common.together;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("togetherService")
public class TogetherServiceImpl implements TogetherService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="togetherDAO")
	private TogetherDAO togetherDAO;

	/* 메인 페이지 - 최신 동행 구하기 4개 */
	@Override
	public List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception {
		return togetherDAO.selectTogetherDesc(map);
	}
	
}
