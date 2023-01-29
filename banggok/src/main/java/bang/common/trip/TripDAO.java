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
	/* 여행 일정 공유글 수(전체&검색) */
	@SuppressWarnings("unchecked")
	public Map<String, Object> tripCount(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("trip.tripCount", map);
	}
	
	/* 여행 일정 공유글 리스트(전체&검색) - 공유된 여행 일정 전체 가져오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> tripListPaging(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("trip.tripListPaging", map);
	}
	
	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> tripDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("trip.tripDetail", map);
	}
	
	/* 여행 일정 공유 게시글 상세보기 - TR_NUM 을 이용해서 해당 글에 추가된 장소 데이터 불러오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> tripplaceDetail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("trip.tripplaceDetail", map);
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
	
	/* 마이페이지 여행 일정 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myTripList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("trip.myTripList", map);
	}
	
	/* 일정 만들기 시작시 TP_TRNUM이 NULL인 값 삭제 */
	public void deletePlaceListNull(Map<String, Object> map) throws Exception {
		delete ("trip.deletePlaceListNull", map);
	}
	
	/* 여행 일정 만들기 */
	public void tripWrite(Map<String, Object> map) throws Exception {
		insert ("trip.tripWrite", map);
	}
	
<<<<<<< HEAD
	/* 일정별 추가 장소 리스트(작성시) */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> writePlaceList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("trip.writePlaceList", map);
	}
		
=======
	/* 여행 장소 테이블의 여행 일정 번호 업데이트 */
	public void tripplaceUpdate(Map<String, Object> map) throws Exception {
		update ("trip.tripplaceUpdate", map);
	}
	
	/* 여행 일정 번호 업데이트를 위한 최대 번호 구하기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> maxTRNUM() throws Exception {
		return (Map<String, Object>) selectOne("trip.maxTRNUM");
	}
	
>>>>>>> branch 'hyunjae' of https://github.com/Hyunjae-Kwon/bang.git
	/* 추가 장소 저장 */
	public void addPlaceList(Map<String, Object> map) throws Exception {
		insert ("trip.addPlaceList", map);
	}
	
	/* 추가 장소 삭제 */
	public void deletePlaceList(Map<String, Object> map) throws Exception {
		delete ("trip.deletePlaceList", map);
	}
	
	/* 추천하기 */
	public void tripLike(Map<String, Object> map) throws Exception {
		System.out.println(map.get("TR_NUM"));
		update("trip.tripLike", map);       
	}
	
	/* 여행 일정 공유하기 */
	public void tripShare(Map<String, Object> map) throws Exception {
		update("trip.tripShare", map);
	}
}
