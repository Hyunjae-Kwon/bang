<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

</head>
<body>

 <script type="text/javascript">
/* 아이디 중복 체크 */	
function checkId() { 
  
  var inputed = $('#MEM_ID').val();
  console.log(inputed);
  if(inputed.trim() ==""){
	  alert("아이디를 입력해주세요.");
	  $('#MEM_ID').focus();
	  return false;
  }
  
  $.ajax({
	    data : {id:inputed} ,
	    url : "/bang/confirmId.tr",
	    type : "POST",
	    dataType : "text",
	    success : function(data){
	    	var result = JSON.parse(data);
	    	
	    	if(result > 0) {
	    		alert("이미 사용중인 아이디입니다.");
	    		
	    	} else if (result == 0) {
	    		alert("사용가능한 아이디입니다.");
	    	}
	    }
	  });
  };
</script>  
<script  type="text/javascript">
/* 이메일 주소 형식 확인 */
function validEmailCheck(memEmail) {
	var memEmail = document.getElementById("MEM_EMAIL");
	var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return (memEmail.value.match(pattern)!=null)
}

function sendMail(memMail) {
	const email= $('#MEM_EMAIL').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	const checkInput = $('#MEM_EMAIL2') // 인증번호 입력하는곳 

	if(validEmailCheck(email)==false) {
		alert("이메일형식이 올바르지 않습니다.");
		$('#MEM_EMAIL').focus();
		return false;
	} else { 
		
	$.ajax({
		type : 'get',
		url : '/bang/confirmMail.tr?email='+ email, 
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code = data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
	}
}; // end send eamil

//인증번호 비교 
//버튼눌렀을때 발생
function checkMail(){
	const inputCode = $('#MEM_EMAIL2').val();
	const $resultMsg = $('#mail-check-warn');
	
 	  if(inputCode === ""){
 		$resultMsg.html('인증번호를 입력해 주세요.');
 	    $resultMsg.css('color','red');
 	} else if(inputCode === code) {	
    	$resultMsg.html('인증번호가 일치합니다.');   
		$resultMsg.css('color','green');
		$('#mail-Send-Btn').attr('disabled',true);
		$('#MEM_EMAIL').attr('readonly',true);
		return true;
	} else {
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		$resultMsg.css('color','red');
		return false;
	} 
};

</script>
<script>
	function checks() {
		var MEM_ID = document.getElementById("MEM_ID");
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
		document.joinForm.submit();
	}
</script>  
<<<<<<< HEAD

=======
</head>
<body>
>>>>>>> branch 'hyunjae' of https://github.com/Hyunjae-Kwon/bang.git
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

                <div style="padding:20px" class="col-sm-7">
                <form id="joinForm" name="joinForm" method="POST" action="/bang/joinSuccess.tr"> 
                    <h2 >회원가입</h2> <br>
                    <div class="row cont-row">
                        <div  class="col-sm-3"><label>아이디 </label></div>
                        <div class="col-sm-4"><input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디" class="form-control input-sm"></div>
                        <button type="button" id="check_id" class="btn btn-default filter-button" onclick="checkId()">중복확인</button>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>비밀번호 </label></div>
                        <div class="col-sm-6"><input type="password" id="MEM_PW" name="MEM_PW" placeholder="비밀번호" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>비밀번호 확인</label></div>
                        <div class="col-sm-6"><input type="password" id="MEM_PW2" name="MEM_PW2" placeholder="비밀번호 확인" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>이름</label></div>
                        <div class="col-sm-6"><input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="이름" class="form-control input-sm"  ></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>닉네임</label></div>
                        <div class="col-sm-6"><input type="text" id="MEM_NICKNAME" name="MEM_NICKNAME" placeholder="닉네임" class="form-control input-sm"  ></div>
                    </div>
                    <div class="form-group email-form">
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>이메일 인증</label></div>
                        <div class="col-sm-4"><input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="이메일" class="form-control input-sm"  ></div>
                        <button type="button" id="mail-Send-Btn" class="btn btn-default filter-button" onclick="sendMail()">번호전송</button>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>인증 번호</label></div>
                        <div class="col-sm-4">
                        <input id="MEM_EMAIL2" name="MEM_EMAIL2" placeholder="인증번호 입력" class="form-control input-sm" disabled="disabled" maxlength="6" ></div>
                        <button type="button" id="mail-Check-Btn" class="btn btn-default filter-button" onclick="checkMail()">번호등록</button>
                   
                     </div>
						<span id="mail-check-warn"></span>
				     </div>
				   	                      
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>휴대폰 번호</label></div>
                        <div class="col-sm-6"><input type="text" id="MEM_PHONE"name="MEM_PHONE" placeholder="연락처 " class="form-control input-sm"  ></div>
                    </div>
                    
                    
                    <div align="center">						
						<button type="button" id="btnCancel" class="btn btnbtn-default filter-button" onclick="location.href='/bang/loginForm.tr'">취소</button>
						&nbsp;&nbsp;
						<button type="reset" class="btn btn-default filter-button">다시 입력</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-default filter-button" value="회원가입" onClick="checks(this.form)">회원가입</button>
			         </div> 
			         </form>                   
                </div>
            </div>
         </div>
<<<<<<< HEAD
     </div>         
</body>
=======
</div>         
    </body>
>>>>>>> branch 'hyunjae' of https://github.com/Hyunjae-Kwon/bang.git
</html>