package bang.common.chat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "chatDAO")
	private ChatDAO chatDAO;

	/*메세지 리스트 데이터 여러 줄 가져오기 */
	@Override
	public List<Map<String, Object>> selectChatList(Map<String, Object> map) throws Exception {
		return chatDAO.selectChatList(map);
	}

	/* 현재 사용자가 메세지를 주고받는 상대의 닉네임을 가져온다. */	
	@Override
	public Map<String, Object> selectNickname(Map<String, Object> map) throws Exception {
		/* map.put("MEM_ID", map.get("CH_TOID")); */
		return chatDAO.selectNickname(map);
	}

	/* 현재 사용자가 해당 room에서 안읽은 메세지의 개수를 가져온다. */
	@Override
	public Map<String, Object> countUnread(Map<String, Object> map) throws Exception {
		return chatDAO.countUnread(map);
	}

	/* room 별 메세지 내역을 가져온다. */
	@Override
	public List<Map<String, Object>> selectContent(Map<String, Object> map) throws Exception {
		return chatDAO.selectContent(map);
	}

	/* 해당 방의 메세지들 중 받는 사람이 현재사용자인 메세지를 모두 읽음 처리한다 */
	@Override
	public void readCheck(Map<String, Object> map) throws Exception {
		chatDAO.readCheck(map);
	}

	/* 메세지 list에서 메세지를 보낸다. */
	@Override
	public void insertChat(Map<String, Object> map) throws Exception {
		chatDAO.insertChat(map);
		map.put("MEM_ID", map.get("CH_TOID"));

		Map<String, Object> unreadMessage = chatDAO.countUnread(map);
		int message = Integer.parseInt(unreadMessage.get("UNREAD").toString());

		System.out.println("안읽은 chat 개수 : " + message);
		
	}

	/* room 번호 최대값 구하기 */
	@Override
	public int maxRoom(Map<String, Object> map) throws Exception {
		return chatDAO.maxRoom(map);
	}

	/* 메세지 이력이 있는지 검색 */
	@Override
	public int existChat(Map<String, Object> map) throws Exception {
		return chatDAO.existChat(map);
	}

	/* 기존 메세지 내역의 room 번호를 가져옴  */
	@Override
	public int selectRoom(Map<String, Object> map) throws Exception {
		return chatDAO.selectRoom(map);
	}

}