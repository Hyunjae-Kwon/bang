package bang.common.comment;

import java.util.List;
import java.util.Map;

public interface CommentService {
	
	/* 댓글 작성하기 */
	void comWrite(Map<String, Object> map) throws Exception;
	
	/* 댓글 삭제하기 */
	void comDelete(Map<String, Object> map) throws Exception;
	
	/* 댓글 리스트 불러오기 */
	List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception;
	
}
