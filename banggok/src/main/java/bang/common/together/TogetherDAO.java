package bang.common.together;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("togetherDAO")
public class TogetherDAO extends AbstractDAO {
	
	/* 메인 페이지 - 최신 동행 구하기 4개 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("together.selectTogetherDesc", map);
	}

	/* 동행게시판 리스트 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> togetherList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectPagingList("together.togetherList", map);
	}
	
	/* 동행게시판 디테일 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("together.togetherDetail", map);
	}
	
	/* 조회수 증가 */
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("together.updateHitCnt", map);
	}

	/* 동행게시판 글쓰기 */ 
	public void togetherWrite(Map<String, Object> map) throws Exception {
		insert("together.togetherWrite", map);
	}

	/* 동행게시판 글수정 */
	public void togetherModify(Map<String, Object> map) throws Exception {
		update("together.togetherModify", map);
	}

	/* 동행게시판 삭제 */
	public void togetherDelete(Map<String, Object> map) throws Exception {
		delete("together.togetherDelete", map);
	}
	
	/* 여행 일정 검색 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTogether(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("together.searchTogether", map);
	}
	
	/* 마이페이지 동행 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myTogetherList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("together.myTogetherList", map);
	}
}
