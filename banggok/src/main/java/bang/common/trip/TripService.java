package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TripService {
	
	/* 메인 페이지 - 인기 여행 일정 3개 */
	List<Map<String, Object>> selectHotTrip(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유글 수(전체&검색) */
	int tripCount(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 여행 일정 공유글 리스트(전체&검색) - 공유된 여행 일정 전체 가져오기 */
	List<Map<String, Object>> tripListPaging(Map<String, Object> map,  HttpServletRequest request) throws Exception;
	
	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기 */
	Map<String, Object> tripDetail(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 해당 글에 추가된 장소 데이터 불러오기 */
	List<Map<String, Object>> tripplaceDetail(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유 게시글 수정하기 - 폼을 통해 입력받은 데이터로 수정하기 */
	void tripModify(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유 게시글 삭제하기 - TR_NUM으로 해당 게시글 삭제하기 */
	void tripDelete(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 검색하기 */
	List<Map<String, Object>> searchTrip(Map<String, Object> map, HttpServletRequest request) throws Exception;

	/* 마이페이지 여행 일정 리스트 */
	List<Map<String, Object>> myTripList(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 만들기 */
	void tripWrite(Map<String, Object> map) throws Exception;
	
	/* 여행 장소 테이블의 여행 일정 번호 업데이트 */
	void tripplaceUpdate(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 번호 업데이트를 위한 최대 번호 구하기 */
	int maxTRNUM() throws Exception;
	
	/* 추가 장소 저장 */
	void addPlaceList(Map<String, Object> map) throws Exception;
	
	/* 추가 장소 삭제 */
	void deletePlaceList(Map<String, Object> map) throws Exception;
	
	/* 추천하기 */
	void tripLike(Map<String, Object> map) throws Exception;

}
