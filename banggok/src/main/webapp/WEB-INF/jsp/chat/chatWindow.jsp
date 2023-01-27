<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- 대화창 스타일 지정 -->
<style>
#chatWindow{border:1px solid black; width:270px; height:310px; overflow:scroll; padding:5px;}
#chatMessage{width:236px; height:30px;}
#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
#closeBtn{margin-bottom:3px; position:relative; top:2px; left:-2px;}
#chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
.myMsg{text-align:right;}

/* 카톡처럼 보이는 css */
.chat_wrap { border:1px solid #999; width:300px; padding:5px; font-size:13px; color:#333}
.chat_wrap .inner{background-color:#acc2d2; border-radius:5px; padding:10px; overflow-y:scroll;height: 500px;}
.chat_wrap .item .box{display:inline-block; max-width:180px; position:relative}
.chat_wrap .item .box::before{content:""; position:absolute; left:-8px; top:9px; border-top:0px solid transparent; border-bottom:8px solid transparent;border-right:8px solid #fff;}
.chat_wrap .item .box .myMsg {background:#fff; border-radius:10px; padding:8px; text-align:left; word-break: break-word;}
.chat_wrap .item .box .time {font-size:11px; color:#999; position:absolute; right: -75px; bottom:5px; width:70px}
.chat_wrap .item.mymsg{text-align:right}
.chat_wrap .item.mymsg .box::before{left:auto; right:-8px; border-left:8px solid #fee600; border-right:0;}
.chat_wrap .item.mymsg .box .msg{background:#fee600; border-radius:10px; padding:8px; text-align:right; word-break: break-word;}
.chat_wrap .item.mymsg .box{transition:all .3s ease-out; margin:0 20px 0 0;}
.chat_wrap .item.mymsg .box .time{right:auto; left:-75px}
input[type="text"]{border:0; width:100%;background:#ddd; border-radius:5px; height:30px; padding-left:5px; box-sizing:border-box; margin-top:5px}
input[type="text"]::placeholder{color:#999}
</style>
</head>

    <body>
    
<!-- ################# Header Starts Here#######################--->


 

    
    <!--  ************************* 중간 상단바 ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>채팅방</h2>
            </div>
        </div>
    </div>
    
    <!--  ************************* Body ************************** -->
        <div id="portfolio" class="gallery">    
           <div class="container">
              
              <div class="row">
                

        
        <br/>
 <div class="chat_wrap">
        <div class="inner">

	대화명:<input type="text" id="chatId" value="${param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
	</div>
	</div>



	<script>
	var webSocket = new WebSocket(
			"<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
	var chatWindow, chatMessage, chatId;
	
	/* 날짜 구하는 함수 */
    var currentTime = function(){
        var date = new Date();
        var hh = date.getHours();
        var mm = date.getMinutes();
        var apm = hh >12 ? "오후":"오전";
        var ct = apm + " "+hh+":"+mm+"";
        return ct;
    }
	
	/* 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장 */
	window.onload = function(){
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById('chatId').value;
	}
	
	/* 메시지 전송 */
	function sendMessage(){
		/* 대화창에 표시 */
		chatWindow.innerHTML += "<div class='item'>" + "<div class='box'>" + "<div class='myMsg'>" + chatMessage.value + "<span class='time'>" + currentTime() + "</span>" + "</div>" + "</div>" + "</div>"
		webSocket.send(chatId + '|' + chatMessage.value);	/* 서버로 전송 */
		chatMessage.value = "";	/* 메시지 입력창 내용 지우기 */
		chatWindow.scrollTop = chatWindow.scrollHeight;	/* 대화창 스크롤 */
	}
	
	/* 서버와의 연결 종료 */
	function disconnect(){
		webSocket.close();
	}
	
	/* 엔터 키 입력 처리 */
	function enterKey(){
		if (window.event.keyCode == 13){	/* 13은 'Enter' 키의 코드값 */
			sendMessage();
		}
	}
	
	/* 웹소켓 서버에 연결됐을 때 실행 */
	webSocket.onopen = function(event) {
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
	};
	
	/* 웹소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행 */
	webSocket.onclose = function(event){
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
	};
	
	/* 에러 발생 시 실행 */
	webSocket.onerror = function(event){
		alert(event.data);
		chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
	};
	
	/* 메시지를 받았을 때 실행 */
	webSocket.onmessage = function(event){
		var message = event.data.split("|");	/* 대화명과 메시지 분리 */
		var sender = message[0];	/* 보낸 사람의 대화명 */
		var content = message[1];	/* 메시지 내용 */
		if (content != "") {
			if (content.match("/")){	/* 귓속말 */
				if (content.match(("/" + chatId))){	/* 나에게 보낸 메시지만 출력 */
					var temp = content.replace(("/" + chatId), "[귓속말] : ");
					chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
				}
			}
			else {	/* 일반 대화 */
				chatWindow.innerHTML += "<div class='item mymsg'>" + "<div class='box'>" + "<div class='msg'>" + sender + "" + temp + "<span class='time'>" + currentTime() + "</span>" + "</div>" + "</div>" + "</div>";	
			}
		}
		chatWindow.scrollTop = chatWindow.scrollHeight;
	};
	</script>       

            
        </div>
    </div>
       
       
       </div>
        <!-- ######## Gallery End ####### -->    
        
        

  <!--  ************************* Footer Start Here ************************** -->
       


</html>