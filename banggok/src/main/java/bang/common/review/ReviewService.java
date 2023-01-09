package bang.common.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	
	/* 메인 페이지 - 최신 여행 후기 3개 */
	List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception;

}
