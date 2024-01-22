package jobja.chatting.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import jobja.chatting.service.ChattingService;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class HandlerChat extends TextWebSocketHandler {
	
	@Autowired
	ChattingService chattingService;

	// (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) 형태 
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);
        
		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		switch (mapReceive.get("cmd")) {
		
		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bang_id", mapReceive.get("bang_id"));
			map.put("session", session);
			map.put("memId", mapReceive.get("memId"));
			map.put("memNm", mapReceive.get("memNm"));
			map.put("memAfId", mapReceive.get("memAfId"));
			sessionList.add(map);
			
			// 같은 채팅방에 입장 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				if(bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_ENTER");
//					mapToSend.put("msg", session.getId() +  "님이 입장 했습니다.");
					mapToSend.put("msg", mapReceive.get("memNm") +  "님이 입장 했습니다.");
					mapToSend.put("memAfId", mapReceive.get("memAfId"));
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
			
		// CLIENT 메세지
		case "CMD_MSG_SEND":
			
			// 현재 날짜와 시간 얻기
	        LocalDateTime currentDateTime = LocalDateTime.now();

	        // 출력 형식 지정 (선택사항)
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	        // 형식에 따라 날짜와 시간 출력
	        String formattedDateTime = currentDateTime.format(formatter);
			
			// 같은 채팅방에 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("memId", mapReceive.get("memId"));
//					mapToSend.put("msg", session.getId() + " : " + mapReceive.get("msg"));
					mapToSend.put("msg", mapReceive.get("memNm") + " : " + mapReceive.get("msg") + "\t" + formattedDateTime);
					mapToSend.put("memAfId", mapReceive.get("memAfId"));

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
					
					String memId = (String) mapSessionList.get("memId");
					if(memId.equals(mapReceive.get("memId"))) {
						Map<String, Object> messageMap = new HashMap<String, Object>();
						
						messageMap.put("chatRoomId", bang_id);
						messageMap.put("chatCntnt", mapReceive.get("msg"));
						messageMap.put("memId", mapReceive.get("memId"));
						messageMap.put("chatDate", formattedDateTime);
						
						int result = this.chattingService.sendMessage(messageMap);
						log.info("메세지 들어가냐? : " +result);
					}
				}
			}
			break;
		}
	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
        
		ObjectMapper objectMapper = new ObjectMapper();
		String now_bang_id = "";
		String now_memNm = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String bang_id = (String) map.get("bang_id");
			String memNm = (String) map.get("memNm");
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				now_bang_id = bang_id;
				now_memNm = memNm;
				sessionList.remove(map);
				break;
			}	
		}
		
		
		// 같은 채팅방에 퇴장 메세지 전송 
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String bang_id = (String) mapSessionList.get("bang_id");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			if (bang_id.equals(now_bang_id)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("bang_id", bang_id);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", now_memNm + "님이 퇴장 했습니다.");

				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
	}
}