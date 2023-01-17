package bang.common.comment;

import java.util.List;
import java.util.Map;

public interface CommentService {
	
	/* 여행 일정 공유 게시판 댓글 불러오기 */
	List<Map<String, Object>> selectTripComment(Map<String, Object> map) throws Exception;
	
	/* 여행 일정 공유 게시글 댓글 작성하기 */
	void tripComWrite(Map<String, Object> map) throws Exception;
	
	/* 댓글 삭제하기 */
	void comDelete(Map<String, Object> map) throws Exception;
}
