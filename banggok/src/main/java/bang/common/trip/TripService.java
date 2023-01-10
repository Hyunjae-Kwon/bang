package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TripService {
	
	/* 메인 페이지 - 인기 여행 일정 3개 */
	List<Map<String, Object>> selectHotTrip(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유 게시판 리스트 - 공유된 여행 일정 전체 가져오기 */
	List<Map<String, Object>> selectAllShareTrip(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유 게시판 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기*/
	Map<String, Object> selectSharedTrip(Map<String, Object> map) throws Exception;

}
