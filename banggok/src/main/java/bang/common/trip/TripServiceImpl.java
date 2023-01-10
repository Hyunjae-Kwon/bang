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

	/* 여행 일정 공유 게시판 리스트 - 공유된 여행 일정 전체 가져오기 */
	@Override
	public List<Map<String, Object>> selectAllShareTrip(Map<String, Object> map) throws Exception {
		return tripDAO.selectAllShareTrip(map);
	}

	/* 여행 일정 공유 게시판 상세보기 - TR_NUM 을 이용해서 글 상세 내용 불러오기 */
	@Override
	public Map<String, Object> selectSharedTrip(Map<String, Object> map) throws Exception {
		return tripDAO.selectSharedTrip(map);
	}
}
