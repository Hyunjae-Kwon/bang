package bang.common.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bang.common.common.CommandMap;

@Controller
public class ChatController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "chatService")
	private ChatService chatService;

	/* 메세지 목록 */
	@RequestMapping(value = "/chatList.tr")
	public ModelAndView chatList(HttpServletRequest request, CommandMap commandMap) throws Exception {       
		ModelAndView mv = new ModelAndView("chat/chatList");
		
		HttpSession session = request.getSession();
		String member = (String) session.getValue("MEM_ID");
				
		System.out.println("현재 사용자 회원번호 : " + member);
		System.out.println("url : chatAjaxList / commandMap 파라미터 : " + commandMap.getMap());

		commandMap.put("MEM_ID", member);
		
		String fromId = "";
		String toId = "";		
		
		/* 메세지 리스트 가져오기 */
		List<Map<String, Object>> list = chatService.selectChatList(commandMap.getMap());
		List<Map<String, Object>> unreadList = new ArrayList<>();
		List<Map<String, Object>> nicknameList = new ArrayList<>();

		for (int i = 0; i < list.size(); i++) {
			int chatRoom = Integer.parseInt(list.get(i).get("CH_ROOM").toString());
			System.out.println("chatRoom : " + chatRoom);
			commandMap.put("CH_ROOM", chatRoom);			

			/* 안 읽은 메세지 개수 가져오기 (room번호, 받는사람 번호(내 번호) 필요) */
			Map<String, Object> unreadMap = (Map<String, Object>) chatService.countUnread(commandMap.getMap());

			unreadList.add(unreadMap);

			System.out.println("unread 출력 : " + unreadList);

			/* db에서 가져온 list에서 받는사람, 보낸사람 회원번호 꺼내기 */
			fromId = list.get(i).get("CH_FROMID").toString();
			System.out.println("fromid 출력 : " + fromId);
		    toId =  list.get(i).get("CH_TOID").toString();
		    System.out.println("toId 출력 : " + toId);
		    System.out.println("member 출력 : " + member);
		    
		    String memId = "";
		    
			 if(toId.equals(member)) {
				memId = fromId;
				commandMap.put("MEM_ID", memId);
				System.out.println("memId 출력 : " + memId);
			} else {
				memId = toId;
				commandMap.put("MEM_ID", memId);
				System.out.println("memId 출력 : " + memId);
			}
			 
			/* 반복문에서 상대방 닉네임을 위해 저장했던 mem_num이 계속 유지되며 반복하기 때문에 
			   현재사용자의 회원번호 새로 넣어주기를 반복함 */
			System.out.println("commandMap 출력 : " + memId);		
			    
			commandMap.put("MEM_ID", memId); 

			/* 상대방 닉네임, DEL_GB여부, 정지여부 가져오기 */
			Map<String, Object> nickname = (Map<String, Object>) chatService.selectNickname(commandMap.getMap());

			System.out.println("닉네임 출력 : " + nickname);
			nicknameList.add(nickname);

		}

		/* 안 읽은 개수를 리스트에 추가 */
		mv.addObject("unreadList", unreadList);
		/* 닉네임을 리스트에 추가 */
		mv.addObject("nicknameList", nicknameList);
		/* 리스트를 request 영역에 저장 */
		mv.addObject("list", list);

		mv.addObject("MEM_ID", member);

		System.out.println("########################### MEM_INFO : " + member);
		
		System.out.println("########################### list : " + list);

		return mv;

	}

	/* 메세지 목록 */
	@RequestMapping(value = "/chatAjaxList.tr")
	public ModelAndView chatAjaxList(HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		System.out.println("########################### chatAjaxList ################");

		ModelAndView mv = new ModelAndView("chatAjaxList");

		/* 세션영역에서 회원정보 가져오기 */
		HttpSession session = request.getSession();
		String member = (String) session.getValue("MEM_ID");
				
		System.out.println("현재 사용자 회원번호 : " + member);
		System.out.println("url : chatAjaxList / commandMap 파라미터 : " + commandMap.getMap());


		/* 쿼리로 전달할 맵에 회원번호 넣어주기 */
		commandMap.put("MEM_ID", member);

		String keyword = "";
		if (request.getParameter("keyword") != null || request.getParameter("keyword") != "") {
			keyword = (String) request.getParameter("keyword");
		}

		System.out.println("keyword: " + keyword);

		commandMap.put("keyword", keyword);

		String fromId = "";
		String toId = "";
		
		/* 메세지 리스트 가져오기 */
		List<Map<String, Object>> list = chatService.selectChatList(commandMap.getMap());
		List<Map<String, Object>> unreadList = new ArrayList<>();
		List<Map<String, Object>> nicknameList = new ArrayList<>();


		for (int i = 0; i < list.size(); i++) {
			int chatRoom = Integer.parseInt(list.get(i).get("CH_ROOM").toString());
			System.out.println("chatRoom : " + chatRoom);
			commandMap.put("CH_ROOM", chatRoom);


			/* 안 읽은 메세지 개수 가져오기 (room번호, 받는사람 번호(내 번호) 필요) */
			Map<String, Object> unreadMap = (Map<String, Object>) chatService.countUnread(commandMap.getMap());

			unreadList.add(unreadMap);

			System.out.println("unread 출력 : " + unreadList);
			
			/* db에서 가져온 list에서 받는사람, 보낸사람 회원번호 꺼내기 */
			fromId = list.get(i).get("CH_FROMID").toString();
			System.out.println("fromid 출력 : " + fromId);
		    toId =  list.get(i).get("CH_TOID").toString();
		    System.out.println("toId 출력 : " + toId);
		    System.out.println("member 출력 : " + member);
		    
		    String memId = "";
		    
			 if(toId.equals(member)) {
				memId = fromId;
				commandMap.put("MEM_ID", memId);
				System.out.println("memId 출력 : " + memId);
			} else {
				memId = toId;
				commandMap.put("MEM_ID", memId);
				System.out.println("memId 출력 : " + memId);
			}
			/* 반복문에서 상대방 닉네임을 위해 저장했던 memId가 계속 유지되며 반복하기 때문에 
			   현재사용자의 회원번호 새로 넣어주기를 반복함 */
			 
		    System.out.println("commandMap 출력 : " + memId);

			/* 상대방 닉네임, 탈퇴여부 가져오기 */
			Map<String, Object> nickname = (Map<String, Object>) chatService.selectNickname(commandMap.getMap());

			nicknameList.add(nickname);

		}

		mv.addObject("unreadList", unreadList);

		mv.addObject("nicknameList", nicknameList);

		System.out.println("########################### list : " + list);

		mv.addObject("list", list);

		return mv;

	}

	/* 메세지 내용 */
	@RequestMapping(value = "/chatContentList.tr")
	public ModelAndView chatContentList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		System.out.println("########################### messageContentList ################");
		ModelAndView mv = new ModelAndView("chatContentList");

		int chat_room = Integer.parseInt(commandMap.get("room").toString());

		commandMap.put("CH_ROOM", chat_room);
		System.out.println("chatContentList chatroom : " + chat_room);

		/* 세션영역에서 회원정보 가져오기 */
		HttpSession session = request.getSession();
		String member = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", member);

		/* 쿼리 실행 : 메세지 내용을 가져온다. */
		List<Map<String, Object>> list = chatService.selectContent(commandMap.getMap());
		System.out.println("가져온 메세지 내용 : " + list);

		/* 회원번호, 회원 정지여부, 탈퇴여부를 map에 넣기 (list에 넣기 위해 -> jsp에서 사용해야 함) */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("MEM_ID", commandMap.get("MEM_ID"));
		map.put("MEM_BLOCK", commandMap.get("MEM_BLOCK"));
		/* ajax 함수로부터 전송됨
		   정지/탈퇴여부에 따라 사진 클릭 여부 결정하기 위해 */

		System.out.println("맵에 담긴 MEM_ID : " + map);

		/* jsp에서 사용할 회원번호 */
		System.out.println("chatContentList에 있는 맵:" + commandMap.getMap());

		/* 메세지 읽음처리 */
		chatService.readCheck(commandMap.getMap());

		mv.addObject("list", list);
		mv.addObject("map", map);

		return mv;
	}

	/* 채팅 내용 DB에 insert */
	@RequestMapping(value = "/insertChat.tr")
	public ModelAndView insertChat(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println("########################### insertChat ################");
		ModelAndView mv = new ModelAndView("chat/chatList");
 
		/* 세션영역에서 회원정보 가져오기 */
		HttpSession session = request.getSession();
		String member  = (String) session.getValue("MEM_ID");
		
		commandMap.put("MEM_ID", member );

		System.out.println("map에 담긴 전부:" + commandMap.getMap());
		
		String fromId = commandMap.get("CH_FROMID").toString();
		System.out.println("fromId:" + fromId);
	    String toId =  commandMap.get("CH_TOID").toString();		
	    System.out.println("toId:" + toId);

		if (fromId.equals(member)) {  /* 현재 사용자가 보낸사람이라면 */
			commandMap.put("CH_TOID", toId); /* 받은사람의 회원번호를 commandMap에 저장 */
		} else { /* 현재 사용자가 받은사람이라면 */
			commandMap.put("CH_TOID", fromId); /* 보낸사람의 회원번호를 commandMap에 저장 */
		}
		System.out.println("CH_TOID:" + commandMap.get("CH_TOID"));

		/* 방 번호를 구해서 SQL에 CHAT_ROOM 전달 */
		int exist_chat = chatService.existChat(commandMap.getMap());
		/* 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함 */
		int maxRoom = 0;
		int chatRoom = 0;
		/* 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 commandMap에 넣음 */
		if (exist_chat == 0) {
			maxRoom = chatService.maxRoom(commandMap.getMap());
			if (maxRoom < 1) {
				chatRoom = 1;
			} else {
				chatRoom = maxRoom + 1;
			}
		} else { /* 메세지 내역이 있다면 */
			chatRoom = chatService.selectRoom(commandMap.getMap());
			/* 해당 room 번호를 가져온다. */
		}
		commandMap.put("CH_ROOM", chatRoom);
		chatService.insertChat(commandMap.getMap());

		return mv;
	}
}
