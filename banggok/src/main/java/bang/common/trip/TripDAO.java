package bang.common.trip;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("tripDAO")
public class TripDAO extends AbstractDAO {
	
	/* 메인 페이지 - 인기 여행 일정 3개 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHotTrip(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("trip.selectHotTrip", map);
	}
	
	/* 여행 일정 공유 게시판 리스트 - 공유된 여행 일정 전체 가져오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> tripList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("trip.tripList", map);
	}
	
	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> tripDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("trip.tripDetail", map);
	}
	
	/* 조회수 증가 */
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("trip.updateHitCnt", map);
	}
	
	/* 여행 일정 공유 게시글 수정하기 - 폼을 통해 입력받은 데이터로 수정하기 */
	public void tripModify(Map<String, Object> map) throws Exception {
		update ("trip.tripModify", map);
	}
	
	/* 여행 일정 공유 게시글 삭제하기 - TR_NUM으로 해당 게시글 삭제하기 */
	public void tripDelete(Map<String, Object> map) throws Exception {
		update ("trip.tripDelete", map);
	}
	
	/* 여행 일정 검색 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTrip(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("trip.searchTrip", map);
	}
}
