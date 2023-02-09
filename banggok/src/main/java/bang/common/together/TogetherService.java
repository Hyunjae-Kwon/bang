package bang.common.together;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TogetherService {
	
	/* 메인 페이지 - 최신 동행 구하기 4개 */
	List<Map<String, Object>> selectTogetherDesc(Map<String, Object> map) throws Exception;
	
	/* 동행게시판 리스트 */
	Map<String,Object> togetherList(Map<String,Object> map) throws Exception;
	
	/* 동행게시판 디테일 */
	Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception;
	
	/* 동행게시판 글쓰기 */
	void togetherWrite(Map<String, Object> map) throws Exception;
	
	/* 동행게시판 글수정 */
	void togetherModify(Map<String, Object> map) throws Exception;
	
	/* 동행게시판 글삭제 */
	void togetherDelete(Map<String, Object> map) throws Exception;

	/* 동행 구하기 검색하기 */
	List<Map<String, Object>> searchTogether(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	/* 마이페이지 동행 리스트 */
	Map<String, Object> myTogetherList(Map<String, Object> map) throws Exception;
	
	/* 관리자 - 동행 구하기 게시판 관리 */
	Map<String, Object> adminTogetherList(Map<String, Object> map) throws Exception;
}
