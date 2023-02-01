package bang.common.comment;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;
	
	/* 댓글 작성하기 */
	@Override
	public void comWrite(Map<String, Object> map) throws Exception {
		commentDAO.comWrite(map);
	}
	
	/* 댓글 삭제하기 */
	@Override
	public void comDelete(Map<String, Object> map) throws Exception {
		commentDAO.comDelete(map);
	}
	
	/* 댓글 리스트 불러오기 */
	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		
		if(!map.isEmpty()) {
			for(Object key : map.values()) {
				map.put("OBJECT", key);
			}
		}
		
		return commentDAO.selectCommentList(map);
	}
}
