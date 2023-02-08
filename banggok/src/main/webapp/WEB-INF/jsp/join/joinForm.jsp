<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>

 <script type="text/javascript">
/* 아이디 중복 체크 */	
function checkId(){ 
	
	var inputed = $('#memId').val();
	console.log(inputed);
	
	if(inputed != ""){
		$.ajax({
			    data : {id:inputed} ,
			    url : "/bang/confirmId.tr",
			    type : "POST",
			    dataType : "text",
			    success : function(data){
			    	var result = data;
			    	if(result > 0) {
			    		
			    		$('#idCheck').text("이미 사용중인 아이디입니다.");
			    		$('#idCheck').css("color","red");		    				    		
			    		
			    	} else if (result == 0) {
			    		$('#idCheck').text("사용가능한 아이디입니다.");
			    		$('#idCheck').css("color", "green");		    	
			    	}
			    }
		});
	}else{
		$('#idCheck').text("");
	}
}; 
  
/* 이메일 중복 체크 */
function checkEmail() { 
	  
	  var inputEmail = $('#MEM_EMAIL').val();
	  console.log(inputEmail);
	
	if (inputEmail == ""){
		$('#mailSend').text("");
	}else if(validEmailCheck(inputEmail)==false) {
		$('#mailSend').text("이메일형식이 올바르지 않습니다.");
		$('#mailSend').css("color","red");	
		$('#MEM_EMAIL').focus();
		return false;
	}else {
		$.ajax({
		    data : {email:inputEmail} ,
		    url : "/bang/confirmEmail.tr",
		    type : "POST",
		    dataType : "text",
		    success : function(data){
		    	result = data;
		    	
		    	if(result > 0) {
		    		$('#mailSend').text("이미 사용중인 이메일입니다.");
		    		$('#mailSend').css("color","red");	
		    		return false;
		    	} else if (result == 0) {
		    		$('#mailSend').text("사용가능한 이메일입니다.");
		    		$('#mailSend').css("color", "green");		    	
		    	}
		    }
		});
	}
};
		 

/* 이메일 주소 형식 확인 */
function validEmailCheck() {
	var inputEmail = document.getElementById("MEM_EMAIL");
	var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return (inputEmail.value.match(pattern)!=null)
}

function sendMail(memMail) {
	const email= $('#MEM_EMAIL').val(); /* 이메일 주소값 얻어오기! */
	console.log('완성된 이메일 : ' + email); /* 이메일 오는지 확인 */
	const checkInput = $('#MEM_EMAIL2') /* 인증번호 입력하는곳  */
	
	if(email.trim() == ""){
		$('#mailSend').text("이메일을 입력해주세요.");
		$('#mailSend').css("color","red");
		$('#MEM_EMAIL').focus();
		return false;
	}else if(result > 0){
		return false;
	}else{
	$.ajax({
		type : 'get',
		url : '/bang/confirmMail.tr?email='+ email, 
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code = data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); /* end ajax */
	}
}; /* end send eamil */

/* 인증번호 비교 */ 
/* 글입력했을때 */
function checkMail(){
	const inputCode = $('#MEM_EMAIL2').val();
	const $resultMsg = $('#mail-check-warn');
	
 	if(inputCode === code) {	
 		$('#mailCheck').text("인증번호가 일치합니다.");
		$('#mailCheck').css("color","green");	
		$('#mail-Send-Btn').attr('disabled',true);
		$('#MEM_EMAIL').attr('readonly',true);
		return true;
	} else{
		$('#mailCheck').text("인증번호가 불일치합니다.");
		$('#mailCheck').css("color","red");
		return false;
	} 
};
</script>
<script>
$(document).ready(function(){
	$('#MEM_PW2').blur(function () {
		const memPw = $('#MEM_PW').val();
		const memPw2 = $(this).val();
		const $resultMsg = $('#pw-check-warn');
		
		if(memPw2 != ""){
			if(memPw2 === memPw){
				$resultMsg.html('비밀번호 일치!');
				$resultMsg.css('color','green');
			}else{
				$resultMsg.html('비밀번호가 불일치!');
				$resultMsg.css('color','red');
			}
		}else{
			$resultMsg.html('');
		}
	});
});
</script>
<script>
	function checks() {
		var MEM_ID = document.getElementById("memId");
		var MEM_PW = document.getElementById("MEM_PW");
		var MEM_PW2 = document.getElementById("MEM_PW2");
		var MEM_NAME = document.getElementById("MEM_NAME");
		var MEM_NICKNAME = document.getElementById("MEM_NICKNAME");
		var MEM_EMAIL = document.getElementById("MEM_EMAIL");
		var MEM_EMAIL2 = document.getElementById("MEM_EMAIL2");
		var MEM_PHONE = document.getElementById("MEM_PHONE");

		if(MEM_ID.value.trim() == ""){
			alert("아이디를 입력해주세요.");
			MEM_ID.focus();
			return false;
		}
		if(MEM_PW.value.trim() == ""){
			alert("비밀번호를 입력해주세요.");
			MEM_PW.focus();
			return false;
		}
		if(MEM_PW.value != MEM_PW2.value){
			alert("비밀번호가 일치하지 않습니다.");
			MEM_PW2.focus();
			return false;
		}
		if(MEM_NAME.value.trim() == ""){
			alert("이름을 입력해주세요.");
			MEM_NAME.focus();
			return false;
		}
		if(MEM_NICKNAME.value.trim() == ""){
			alert("닉네임을 입력해주세요.");
			MEM_NICKNAME.focus();
			return false;
		}
		if(MEM_EMAIL.value.trim() == ""){
			alert("이메일을 입력해주세요.");
			MEM_EMAIL.focus();
			return false;
		}
		if(MEM_EMAIL2.value.trim() == ""){
			alert("인증번호를 입력해주세요.");
			MEM_EMAIL2.focus();
			return false;
		}
		if(checkMail(MEM_EMAIL2) == false ){
			alert("인증번호가 일치하지않습니다.");
			MEM_EMAIL2.focus();
			return false;
		}
		if(MEM_PHONE.value.trim() == ""){
			alert("핸드폰 번호를 입력해주세요.");
			MEM_PHONE.focus();
			return false;
		}
		
		$.ajax({
		    data : {id:MEM_ID.value} ,
		    url : "/bang/confirmId.tr",
		    type : "POST",
		    dataType : "text",
		    success : function(data){
		    	var result = JSON.parse(data);
		    	if(result > 0) {
		    		alert("이미 사용중인 아이디입니다.");
		    		$('#memId').val("");
		    	} else if (result == 0) {
		    		document.joinForm.submit();
		    	}
		    }
		});
	}
</script>  
</head>
<body>
<div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>회원가입</h2>
                <ul>
                    <li> <a href="/bang/main.tr"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> 회원가입 </li>
                </ul>
            </div>
        </div>
</div>
    
<div class="row contact-rooo no-margin" align="center">
        <div class="container">
            <div >
                <div style="padding:20px" class="col-sm-11">
                <form id="joinForm" name="joinForm" method="POST" enctype="multipart/form-data" action="/bang/joinSuccess.tr"> 
                    <div class="row cont-row">
                        <div  class="col-sm-3"><label>아이디 </label></div>
                        <div class="col-sm-4"><input type="text" id="memId" name="MEM_ID" placeholder="아이디" class="form-control input-sm" oninput="checkId()"></div>
                        <div class="col-sm-4" align="left"><span id="idCheck"></span></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>비밀번호 </label></div>
                        <div class="col-sm-4"><input type="password" id="MEM_PW" name="MEM_PW" placeholder="비밀번호" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>비밀번호 확인</label></div>
                        <div class="col-sm-4"><input type="password" id="MEM_PW2" name="MEM_PW2" placeholder="비밀번호 확인"class="form-control input-sm"></div>
                        <div align="left"  class="col-sm-4"><span id="pw-check-warn"></span></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>이름</label></div>
                        <div class="col-sm-4"><input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="이름" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>닉네임</label></div>
                        <div class="col-sm-4"><input type="text" id="MEM_NICKNAME" name="MEM_NICKNAME" placeholder="닉네임" class="form-control input-sm"  ></div>
                    </div>
                    <div class="form-group email-form">
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>이메일 인증</label></div>
                        <div class="col-sm-4"><input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="이메일" class="form-control input-sm" oninput="checkEmail()" ></div>                      
                        <button type="button" id="mail-Send-Btn" class="btn btn-default filter-button" onclick="sendMail()">전송</button>
                        <div align="left"  class="col-sm-4"><span id="mailSend"></span></div>                       
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>인증 번호</label></div>
                        <div class="col-sm-4">
                        <input id="MEM_EMAIL2" name="MEM_EMAIL2" placeholder="인증번호 입력" class="form-control input-sm" disabled="disabled" maxlength="6" oninput="checkMail()"></div>
                        <div align="left" class="col-sm-4"><span id="mailCheck"></span></div>
                        <span id="mail-check-warn"></span></div>
                     </div>
				   	                      
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>휴대폰 번호</label></div>
                        <div class="col-sm-4"><input type="text" id="MEM_PHONE"name="MEM_PHONE" placeholder="연락처 " class="form-control input-sm" maxlength="11" ></div>
                    </div>      
				   	                      
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>프로필</label></div>
                        <div class="col-sm-4"><input type="file" id="MEM_IMAGE"name="MEM_IMAGE" class="form-control input-sm" ></div>
                    </div>             
                    
					<div align="center" class="row cont-row">
					<div class="col-sm-3"></div>	
					   <div class="col-sm-4">					
						<button type="button" id="btnCancel" class="btn btnbtn-default filter-button" onclick="location.href='/bang/loginForm.tr'">취소</button>
						&nbsp;&nbsp;
						<button type="reset" class="btn btn-default filter-button">다시 입력</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-default filter-button" value="회원가입" onClick="checks(this.form)">회원가입</button>
					   </div> 
					</div>
			        </form>                   
                </div>
            </div>
         </div>
	</div>       
</body>
</html>