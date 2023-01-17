package bang.common.comment;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("commentDAO")
public class CommentDAO extends AbstractDAO {
	
	/* 여행 일정 공유 게시판 댓글 불러오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTripComment(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("comment.selectTripComment", map);
	}
	
	/* 여행 일정 공유 게시글 댓글 작성하기 */
	public void tripComWrite(Map<String, Object> map) throws Exception {
		insert ("comment.tripComWrite", map);
	}
	
	/* 댓글 삭제하기 */
	public void comDelete(Map<String, Object> map) throws Exception {
		delete ("comment.comDelete", map);
	}
}
