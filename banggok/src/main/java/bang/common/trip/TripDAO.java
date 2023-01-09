package bang.common.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public List<Map<String, Object>> selectAllShareTrip(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("trip.selectAllShareTrip", map);
	}
	
	/* 여행 일정 공유 게시판 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSharedTrip(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("trip.selectSharedTrip", map);
	}
}
