<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

    <body>
    
<!-- ################# Header Starts Here#######################--->


 

    
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>채팅방</h2>
            </div>
        </div>
    </div>
    
    <!--  ************************* Gallery Starts Here ************************** -->
        <div id="portfolio" class="gallery">    
           <div class="container">
              
              <div class="row">
                

        
        <br/>

<script>
function chatWinOpen(){
	var id = document.getElementById("chatId");
	if (id.value == "") {
		alert("대화명을 입력 후 채팅창을 열어주세요.");
		id.focus();
		return;
	}
	window.open("chatWindow.tr?chatId=" + id.value, "",
				"width=320, height=400");
	id.value = "";
}
</script>
 <h2>웹소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
 대화명 : <input type="text" id="chatId" />
 <button onclick="chatWinOpen();">채팅 참여</button>

            
        </div>
    </div>
       
       
       </div>
        <!-- ######## Gallery End ####### -->    

        
        

  <!--  ************************* Footer Start Here ************************** -->
       


</html>