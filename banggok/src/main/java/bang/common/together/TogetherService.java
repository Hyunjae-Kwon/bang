package bang.common.together;

import java.util.List;
import java.util.Map;

public interface TogetherService {
	
	/* 메인 페이지 - 최신 동행 구하기 4개 */
	List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception;

}
