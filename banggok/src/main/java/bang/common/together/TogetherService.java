package bang.common.together;

import java.util.List;
import java.util.Map;

public interface TogetherService {
	
	/* 메인 페이지 - 최신 동행 구하기 4개 */
	List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception;
	
	/*동행게시판 리스트*/
	List<Map<String,Object>> togetherList(Map<String,Object> Map) throws Exception;
	
	/*동행게시판 디테일*/
	Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception;


}
