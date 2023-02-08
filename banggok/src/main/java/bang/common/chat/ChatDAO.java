package bang.common.chat;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bang.common.common.AbstractDAO;

@Repository("chatDAO")
public class ChatDAO extends AbstractDAO {

	/*메세지 리스트 데이터 여러 줄 가져오기 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectChatList(Map<String, Object> map) throws Exception {
		System.out.println("selectChatList 쿼리에 전달된 파라미터 : " + map);

		return (List<Map<String, Object>>) selectList("chat.selectChatList", map);

	}

	/* 현재 사용자가 해당 room에서 안읽은 메세지의 개수를 가져온다. */
	@SuppressWarnings("unchecked")
	public Map<String, Object> countUnread(Map<String, Object> map) throws Exception {
		System.out.println("countUnread 쿼리에 전달된 파라미터 : " + map);

		return (Map<String, Object>) selectOne("chat.countUnread", map);
	}

	/* 현재 사용자가 메세지를 주고받는 상대의 닉네임을 가져온다. */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNickname(Map<String, Object> map) throws Exception {
		System.out.println("selectNickname 쿼리에 전달된 파라미터 : " + map);

		return (Map<String, Object>) selectOne("chat.selectNickname", map);
	}

	/* room 별 메세지 내역을 가져온다. */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectContent(Map<String, Object> map) throws Exception {

		System.out.println("selectContent 쿼리에 전달된 파라미터 : " + map);

		return (List<Map<String, Object>>) selectList("chat.selectContent", map);

	}

	/* 해당 방의 메세지들 중 받는 사람이 현재사용자인 메세지를 모두 읽음 처리한다 */
	public void readCheck(Map<String, Object> map) throws Exception {
		System.out.println("readCheck 쿼리에 전달된 파라미터 : " + map);

		update("chat.readCheck", map);
	}

	/* 메세지 list에서 메세지를 보낸다. */
	public void insertChat(Map<String, Object> map) throws Exception {
		System.out.println("insertChat 쿼리에 전달된 파라미터 : " + map);

		insert("chat.insertChat", map);
	}
	
    /* room 번호 최대값 구하기 */
	public int maxRoom(Map<String, Object> map) throws Exception {
		System.out.println("maxRoom 쿼리에 전달된 파라미터 : " + map);

		if (selectOne("chat.maxRoom", map) == null) {
			return 0;
		} else {
			return (int) selectOne("chat.maxRoom", map);
		}

	}
    
	/* 메세지 이력이 있는지 검색 */
	public int existChat(Map<String, Object> map) throws Exception {
		System.out.println("existChat 쿼리에 전달된 파라미터 : " + map);

		return (int) selectOne("chat.existChat", map);

	}

	/* 기존 메세지 내역의 room 번호를 가져옴  */
	public int selectRoom(Map<String, Object> map) throws Exception {
		System.out.println("selectRoom 쿼리에 전달된 파라미터 : " + map);

		return (int) selectOne("chat.selectRoom", map);
	}
}
