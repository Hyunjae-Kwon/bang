<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
</head>

<body>

<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
	<div class="container">
		<div class="row">
			<h2>아이디 찾기</h2>
			<ul>
				<li><a href="/bang/main.tr"><i class="fas fa-home"></i> Home</a></li>
				<li><i class="fas fa-angle-double-right"></i> 아이디 찾기</li>
			</ul>
		</div>
	</div>
</div>

<!--  ************************* 아이디 찾기 Starts Here ************************** -->
<div class="row contact-rooo no-margin">
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div style="padding: 20px" class="col-sm-7" >
				<br>
				<div class="row cont-row">
					<div class="col-sm-2">
						<label>이 름</label><span>:</span>
					</div>
					<div class="col-sm-6">
						<input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="Enter Name" class="form-control input-sm">
					</div>
				</div>
				<div class="row cont-row">
					<div class="col-sm-2">
						<label>Email</label><span>:</span>
					</div>
					<div class="col-sm-6">
						<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="ex)abc@gmail.com" class="form-control input-sm" oninput="checkEmail()">
					</div>
					<div class="col-sm-4">
						<input type="button" value="인증번호 전송" class="btn btn-success btn-sm" onClick="checkMem()">
					</div> 
				</div>
				<div style="margin-top: 0px;" class="row">
					<div style="padding-top: 50px;" class="col-sm-2">
						<label></label>
					</div>
					<div class="col-sm-6"><span id="email-check-warn"></span></div>
				</div>
				<div class="row cont-row">
					<div class="col-sm-2">
						<label>인증번호</label><span>:</span>
					</div>
					<div class="col-sm-6">
						<input class="form-control input-sm" id="checkNum" name="checkNum" placeholder="인증번호 6자리를 입력." 
						 	disabled="disabled" maxlength="6">
					</div>
					<div class="col-sm-4">
						<input type="button" value="확인" class="btn btn-success btn-sm" onClick="findId()">
					</div>
				</div>
				<div style="margin-top: 0px;" class="row">
					<div style="padding-top: 10px;" class="col-sm-2">
						<label></label>
					</div>
					<div>
						<div class="col-sm-6">
							<span id="mail-check-warn"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--  ************************* 아이디 찾기 script ************************** -->
<script>
/* 이메일 중복 체크 */
function checkEmail() { 
	const memEmail = $('#MEM_EMAIL').val();
	const $resultMsg = $('#email-check-warn');
	
	console.log(memEmail);
	
	if (memEmail == ""){
		$resultMsg.html('');
		return false;
	}else if(validEmailCheck(memEmail)==false) {
		$resultMsg.html('이메일형식이 올바르지 않습니다.');
		$resultMsg.css('color','red');
		$('#MEM_EMAIL').focus();
		return false;
	}else{
		$resultMsg.html('사용가능한 이메일입니다.');
		$resultMsg.css('color','green');
		$('#MEM_EMAIL').focus();
		return false;
	}
};

/* 이메일 주소 형식 확인 */
function validEmailCheck(memEmail) {
	var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return (memEmail.match(pattern)!=null)
}

/* 이메일 인증 */
function sendEmail(memEmail) {
	const eamil = $('#MEM_EMAIL').val(); // 이메일 주소
	console.log('완성된 이메일 : ' + eamil); // 이메일 확인
	const checkInput = $('#checkNum'); // 인증번호 입력창 
	
	$.ajax({
		type : 'GET',
		url : '/bang/mailCheck.tr?email='+eamil,
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
		}			
	}); // end ajax
}// end sendEamil(memEmail)

/* 인증번호 확인 */ 
function findId() {
	const inputCode = $('#checkNum').val();
	const $resultMsg = $('#mail-check-warn');
	var memName = document.getElementById("MEM_NAME").value;
	var memEmail = document.getElementById("MEM_EMAIL").value;
	
	if(inputCode === ""){
		$resultMsg.html('인증번호를 입력해 주세요.');
		$resultMsg.css('color','red');
	}else if(inputCode === code){
		$resultMsg.html('인증완료!');
		$resultMsg.css('color','green');
		location.href="/bang/findIdResult.tr?MEM_NAME=" + memName + "&MEM_EMAIL=" + memEmail;
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
		$resultMsg.css('color','red');
	}	
} // end findId()



/* 아이디 찾기 유효성 체크 */
function checkMem() {
	var memName = document.getElementById("MEM_NAME");
	var memEmail = document.getElementById("MEM_EMAIL");
		
	if(memName.value.trim()=="") {
		alert("회원이름을 입력해주세요.");
		memName.focus();
		return false;
	} else if(memEmail.value.trim()=="") {
		alert("이메일 주소를 입력해주세요.");
		memEmail.focus();
		return false;
	}
	
	/* 회원가입 여부 확인 */
	$.ajax({
		url : '/bang/checkMemId.tr',
		async: false,
		type : 'POST',
		data : {MEM_NAME:memName.value, MEM_EMAIL:memEmail.value},
		success : function(data) {
			if(data==""){
				alert("일치하는 회원 정보가 없습니다.");
			}else{
				alert("인증번호 이메일 발송완료\n인증번호를 입력해 주세요");
				sendEmail(memEmail);				
			}
		},
		error : function(e) {
			alert("일치하는 회원 정보가 없습니다.");
		}
	}); // end ajax
} // end checkMem()
</script>

</body>
</html>