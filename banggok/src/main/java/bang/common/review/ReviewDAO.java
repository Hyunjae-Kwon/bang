package bang.common.review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {
	
	/* 메인 페이지 - 최신 여행 후기 3개 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewDesc(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("review.selectReviewDesc", map);
	}

	/* 여행 후기 수(전체&검색) */
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewCount(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("review.reviewCount", map);
	}
	
	/* 조회수 증가 */
	public void reviewUpdateCnt(Map<String, Object> map) throws Exception{
		update("review.reviewUpdateCnt", map);
	}
	
	/* 추천하기 */
	public void reviewLike(Map<String, Object> map) throws Exception {
		System.out.println(map.get("RV_NUM"));
		update("review.reviewLike", map);       
	}
	
	/* 추천 이력 남기기 */
	public void insertLike(Map<String, Object> map) throws Exception {
		insert("review.insertLike", map);       
	}
	
	/* 추천 이력 가져오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLike(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("review.selectLike", map);
	}
	
	/* 여행 후기 리스트(전체&검색) */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewListPaging(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("review.reviewListPaging", map);
	}

	/* 여행후기 상세 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("review.reviewDetail", map);
	}

	/* 여행후기 글쓰기 */
	public void insertReview(Map<String, Object> map) {
		insert("review.insertReview", map);
	}
	
	/* 여행후기 글쓰기 - 썸네일 이미지 등록 */
	public void reviewImageUpdate(Map<String, Object> map) {
		update("review.reviewImageUpdate", map);
	}
	
	/* RV_IMAGE 업데이트를 위한 최대 번호 구하기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> maxRVNUM() throws Exception {
		return (Map<String, Object>) selectOne("review.maxRVNUM");
	}

	/* 여행후기 수정 */
	public void reviewModify(Map<String, Object> map)throws Exception{
		update("review.reviewModify", map);
	}
	
	/* 여행후기 삭제 */
	public void reviewDelete(Map<String, Object> map) throws Exception {
		delete("review.reviewDelete", map);
	}
	
	/* 마이페이지 여행후기 리스트 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> myReviewList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectPagingList("review.myReviewList", map);
	}
	
	/* 여행 후기 검색 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("review.searchReview", map);
	}
	
	/* 관리자 - 여행 후기 게시판 관리 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminReviewList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectPagingList("review.adminReviewList", map);
	}
}
