package bang.common.comment;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("commentDAO")
public class CommentDAO extends AbstractDAO {
	
	/* 댓글 작성하기 */
	public void comWrite(Map<String, Object> map) throws Exception {
		insert ("comment.comWrite", map);
	}
	
	/* 댓글 삭제하기 */
	public void comDelete(Map<String, Object> map) throws Exception {
		delete ("comment.comDelete", map);
	}
	
	/* 게시글 삭제 시 댓글 삭제하기 */
	public void comBoardDelete(Map<String, Object> map) throws Exception {
		delete ("comment.comBoardDelete", map);
	}
	
	/* 댓글 리스트 불러오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("comment.selectCommentList", map);
	}
	
	/* 신고 상세보기 - 댓글 내용 불러오기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> commentDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("comment.commentDetail", map);
	}
	
}
