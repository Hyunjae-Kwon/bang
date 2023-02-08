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
	
	/* 게시글 삭제 시 댓글 삭제하기 */
	@Override
	public void comBoardDelete(Map<String, Object> map) throws Exception {
		commentDAO.comBoardDelete(map);
	}

	/* 댓글 리스트 불러오기 */
	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		
		if(map.get("TR_NUM") != null) {
			if(!map.isEmpty()) {
				for(Object key : map.values()) {
					map.put("OBJECT", key);
				}
			}
			map.put("BC_TYPE", "T");
			
		} else if (map.get("TG_NUM") != null) {
			System.out.println("!234");
			if(!map.isEmpty()) {
				for(Object key : map.values()) {
					map.put("OBJECT", key);
				}
			}
			map.put("BC_TYPE", "TG");
			
		} else if (map.get("RV_NUM") != null) {
			if(!map.isEmpty()) {
				for(Object key : map.values()) {
					map.put("OBJECT", key);
				}
			}
			map.put("BC_TYPE", "R");
			
		} else if (map.get("RC_NUM") != null) {
			if(!map.isEmpty()) {
				for(Object key : map.values()) {
					map.put("OBJECT", key);
				}
			}
			map.put("BC_TYPE", "RC");
		}
		
//		
//		if(!map.isEmpty()) {
//			for(Object key : map.values()) {
//				map.put("OBJECT", key);
//			}
//		}
		
		return commentDAO.selectCommentList(map);
	}

	/* 신고 상세보기 - 댓글 내용 불러오기 */
	@Override
	public Map<String, Object> commentDetail(Map<String, Object> map) throws Exception {
		return commentDAO.commentDetail(map);
	}
}
