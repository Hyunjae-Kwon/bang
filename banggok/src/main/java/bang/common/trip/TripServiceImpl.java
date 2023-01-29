package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("tripService")
public class TripServiceImpl implements TripService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="tripDAO")
	private TripDAO tripDAO;

	/* 메인 페이지 - 인기 여행 일정 3개 */
	@Override
	public List<Map<String, Object>> selectHotTrip(Map<String, Object> map) throws Exception {
		return tripDAO.selectHotTrip(map);
	}
	
	/* 여행 일정 공유글 수(전체&검색) */
	@Override
	public int tripCount(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String,Object> mapCount = tripDAO.tripCount(map);
		return Integer.parseInt(String.valueOf(mapCount.get("COUNT")));
	}	
	
	/* 여행 일정 공유글 리스트(전체&검색) - 공유된 여행 일정 전체 가져오기 */
	@Override
	public List<Map<String, Object>> tripListPaging(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return tripDAO.tripListPaging(map);
	}
	

	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기 */
	@Override
	public Map<String, Object> tripDetail(Map<String, Object> map) throws Exception {
		tripDAO.updateHitCnt(map);
		return tripDAO.tripDetail(map);
	}

	/* 여행 일정 공유 게시글 수정하기 - 폼을 통해 입력받은 데이터로 수정하기 */
	@Override
	public void tripModify(Map<String, Object> map) throws Exception {
		tripDAO.tripModify(map);
	}
	
	/* 여행 일정 공유 게시글 삭제하기 - TR_NUM으로 해당 게시글 삭제하기 */
	@Override
	public void tripDelete(Map<String, Object> map) throws Exception {
		tripDAO.tripDelete(map);
	}
	
	/* 여행 일정 검색 */
	@Override
	public List<Map<String, Object>> searchTrip(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return tripDAO.searchTrip(map);
	}
	
	/* 마이페이지 여행 일정 리스트 */
	@Override
	public List<Map<String, Object>> myTripList(Map<String, Object> map) throws Exception {		
		return tripDAO.myTripList(map);
	}
	
	/* 일정 만들기 시작시 TP_TRNUM이 NULL인 값 삭제 */
	@Override
	public void deletePlaceListNull(Map<String, Object> map) throws Exception {
		tripDAO.deletePlaceListNull(map);
	}

	/* 여행 일정 만들기 */
	@Override
	public void tripWrite(Map<String, Object> map) throws Exception {
		tripDAO.tripWrite(map);
	}
	
	/* 일정별 추가 장소 리스트(작성시) */
	@Override
	public List<Map<String, Object>> writePlaceList(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return tripDAO.writePlaceList(map);
	}	

	/* 추가 장소 저장 */
	@Override
	public void addPlaceList(Map<String, Object> map) throws Exception {
		tripDAO.addPlaceList(map);
	}

	/* 추가 장소 삭제 */
	@Override
	public void deletePlaceList(Map<String, Object> map) throws Exception {
		tripDAO.deletePlaceList(map);
	}
}
