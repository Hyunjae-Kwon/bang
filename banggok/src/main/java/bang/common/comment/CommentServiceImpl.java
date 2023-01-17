package bang.common.comment;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;

	/* 여행 일정 공유 게시판 댓글 불러오기 */
	@Override
	public List<Map<String, Object>> selectTripComment(Map<String, Object> map) throws Exception {
		return commentDAO.selectTripComment(map);
	}

	/* 여행 일정 공유 게시글 댓글 작성하기 */
	@Override
	public void tripComWrite(Map<String, Object> map) throws Exception {
		commentDAO.tripComWrite(map);
	}

	/* 댓글 삭제하기 */
	@Override
	public void comDelete(Map<String, Object> map) throws Exception {
		commentDAO.comDelete(map);
	}
	
	
}
