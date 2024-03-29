package bang.common.recommend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bang.common.common.FileUtils;

@Service("recommendService")
public class RecommendServiceImpl implements RecommendService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="recommendDAO")
	private RecommendDAO recommendDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	/* 메인 페이지 - 추천 여행지 3개 */
	@Override
	public List<Map<String, Object>> selectRecomDesc(Map<String, Object> map) throws Exception {
		return recommendDAO.selectRecomDesc(map);
	}
	
	/* 여행지 추천 게시글 수(전체&검색) */
	@Override
	public int recommendCount(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String,Object> mapCount = recommendDAO.recommendCount(map);
		return Integer.parseInt(String.valueOf(mapCount.get("COUNT")));
	}	
	
	/* 여행지 추천 게시글 리스트(전체&검색) */
	@Override
	public List<Map<String, Object>> recommendListPaging(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return recommendDAO.recommendListPaging(map);
	}
	
	/* 여행지 추천 검색(메인에서 검색) */
	@Override
	public List<Map<String, Object>> searchRecommend(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return recommendDAO.searchRecommend(map);
	}
	
	/* 여행지 추천 게시글 상세보기 */
	@Override		
	public Map<String, Object> recommendDetail(Map<String, Object> map) throws Exception {
		recommendDAO.updateCnt(map);
		Map<String, Object> resultMap = recommendDAO.recommendDetail(map);
		return resultMap;
	}
	
	/* 여행지 추천 게시글 작성하기 */
	@Override 
	public void insertRecommend(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception { 
		recommendDAO.insertRecommend(map);
		
		Map<String, Object> maxMap = new HashMap<String, Object>();
		maxMap = recommendDAO.maxRCNUM();
		
		int maxTR;
		if(maxMap == null) {
			maxTR = 0;
		} else {
			maxTR = Integer.parseInt(String.valueOf(maxMap.get("MAX")));
		}
		
		Map<String, Object> file = fileUtils.parseInsertFileInfo(map, request);
		
		file.put("RC_IMAGE", file.get("IMAGE"));
		file.put("RC_NUM", maxTR);
		
		recommendDAO.recommendImageUpdate(file);
	}
	
	/* 여행지 추천 게시글 삭제하기 */
	@Override
	public void deleteRecommend(Map<String, Object> map) throws Exception {
		recommendDAO.deleteRecommend(map);
	}
	
	/* 여행지 추천 게시글 수정 폼 */
//	@Override
//	public Map<String, Object> recommendModifyForm(Map<String, Object> map) throws Exception{
//		return recommendDAO.recommendModifyForm(map);
//	}

	/* 여행지 추천 게시글 수정하기 */
	public void recommendModify(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception{
		recommendDAO.recommendModify(map);
		
		String rcNum = (String) map.get("RC_NUM");
		
		Map<String, Object> file = fileUtils.parseInsertFileInfo(map, request);
		
		file.put("RC_IMAGE", file.get("IMAGE"));
		file.put("RC_NUM", rcNum);
		
		recommendDAO.recommendImageUpdate(file);
	}
	
	/* 추천하기 */
	@Override
	public void recommendLike(Map<String, Object> map) throws Exception {
		recommendDAO.recommendLike(map);
	}
	
	/* 추천 이력 남기기 */
	@Override
	public void insertLike(Map<String, Object> map) throws Exception {
		recommendDAO.insertLike(map);
	}
	
	/* 추천 이력 가져오기 */
	@Override
	public List<Map<String, Object>> selectLike(Map<String, Object> map) throws Exception {
		return recommendDAO.selectLike(map);
	}
	
	/* 관리자 - 여행지 추천 게시판 관리 */
	@Override
	public Map<String, Object> adminRecommendList(Map<String, Object> map) throws Exception {
		return recommendDAO.adminRecommendList(map);
	}
}
