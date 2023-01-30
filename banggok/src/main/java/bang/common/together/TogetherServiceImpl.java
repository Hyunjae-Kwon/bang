package bang.common.together;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("togetherService")
public class TogetherServiceImpl implements TogetherService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="togetherDAO")
	private TogetherDAO togetherDAO;

	/* 메인 페이지 - 최신 동행 구하기 4개 */
	@Override
	public List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception {
		return togetherDAO.selectTogetherDesc(map);
	}
	
	/* 동행게시판 리스트 */
	@Override
	public Map<String, Object> togetherList(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherList(map);
	}
	
	/* 동행게시판 디테일 */
	@Override
	public Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception {
		togetherDAO.updateHitCnt(map);
		Map<String, Object> resultMap = togetherDAO.togetherDetail(map);
		return resultMap;
	}

	/* 동행게시판 글작성 */
	@Override
	public void togetherWrite(Map<String, Object> map) throws Exception {
		togetherDAO.togetherWrite(map);
	}
	
	/* 동행게시판 글수정 */
	@Override
	public void togetherModify(Map<String, Object> map) throws Exception{
		togetherDAO.togetherModify(map);
	}
	
	/* 동행게시판 글삭제 */
	@Override
	public void togetherDelete(Map<String, Object> map) throws Exception {
		togetherDAO.togetherDelete(map);
	}

	/* 동행 구하기 검색하기 */
	@Override
	public List<Map<String, Object>> searchTogether(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return togetherDAO.searchTogether(map);
	}
    
	/* 마이페이지 동행 리스트 */
	@Override
	public Map<String, Object> myTogetherList(Map<String, Object> map) throws Exception {
		return togetherDAO.myTogetherList(map);
	}
	
	
}
