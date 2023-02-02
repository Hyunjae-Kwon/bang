package bang.common.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bang.common.common.FileUtils;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	/* 메인 페이지 - 최신 여행 후기 3개 */
	@Override
	public List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception {
		return reviewDAO.selectReviewDesc(map);
	}
		
	/* 여행 후기 수(전체&검색) */
	@Override
	public int reviewCount(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String,Object> mapCount = reviewDAO.reviewCount(map);
		return Integer.parseInt(String.valueOf(mapCount.get("COUNT")));
	}	
	
	/* 여행 후기 리스트(전체&검색) */
	@Override
	public List<Map<String, Object>> reviewListPaging(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return reviewDAO.reviewListPaging(map);
	}
	
	/* 추천하기 */
	@Override
	public void reviewLike(Map<String, Object> map) throws Exception {
		reviewDAO.reviewLike(map);
	}

	/* 여행후기 상세 */
	@Override
	public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
		reviewDAO.reviewUpdateCnt(map);
		Map<String, Object> resultMap = reviewDAO.reviewDetail(map);
		
		return resultMap;
	}

	/* 여행후기 글쓰기 */
	@Override
	public void insertReview(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		reviewDAO.insertReview(map);
		
		Map<String, Object> maxMap = new HashMap<String, Object>();
		maxMap = reviewDAO.maxRVNUM();
		
		int maxTR;
		if(maxMap == null) {
			maxTR = 0;
		} else {
			maxTR = Integer.parseInt(String.valueOf(maxMap.get("MAX")));
		}
		
		Map<String, Object> file = fileUtils.parseInsertFileInfo(map, request);
		
		file.put("RV_IMAGE", file.get("IMAGE"));
		file.put("RV_NUM", maxTR);
		
		reviewDAO.reviewImageUpdate(file);
		
	}

	/* 여행후기 수정 */
	public void reviewModify(Map<String, Object> map)throws Exception{
		reviewDAO.reviewModify(map);
	}
	
	/* 여행후기 삭제 */
	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		reviewDAO.reviewDelete(map);
	}
	
	/* 마이페이지 여행후기 리스트 */
	@Override
	public Map<String, Object> myReviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.myReviewList(map);
	}
	
	/* 여행 후기 검색 */
	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return reviewDAO.searchReview(map);
	}
	
	/* 관리자 - 여행 후기 게시판 관리 */
	@Override
	public Map<String, Object> adminReviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.adminReviewList(map);
	}
}