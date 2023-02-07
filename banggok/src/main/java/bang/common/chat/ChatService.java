package bang.common.chat;

import java.util.List;
import java.util.Map;

public interface ChatService {
    
	/*메세지 리스트 데이터 여러 줄 가져오기 */
	List<Map<String, Object>> selectChatList(Map<String, Object> map) throws Exception;
    
	/* 현재 사용자가 메세지를 주고받는 상대의 닉네임을 가져온다. */	
	Map<String, Object> selectNickname(Map<String, Object> map) throws Exception;

	/* 현재 사용자가 해당 room에서 안읽은 메세지의 개수를 가져온다. */
	Map<String, Object> countUnread(Map<String, Object> map) throws Exception;
    
	/* room 별 메세지 내역을 가져온다. */
	List<Map<String, Object>> selectContent(Map<String, Object> map) throws Exception;

	/* 해당 방의 메세지들 중 받는 사람이 현재사용자인 메세지를 모두 읽음 처리한다 */
	void readCheck(Map<String, Object> map) throws Exception;

	/* 메세지 list에서 메세지를 보낸다. */
	void insertChat(Map<String, Object> map) throws Exception;

	/* room 번호 최대값 구하기 */
	int maxRoom(Map<String, Object> map) throws Exception;

	/* 메세지 이력이 있는지 검색 */
	int existChat(Map<String, Object> map) throws Exception;

	/* 기존 메세지 내역의 room 번호를 가져옴  */
	int selectRoom(Map<String, Object> map) throws Exception;

}