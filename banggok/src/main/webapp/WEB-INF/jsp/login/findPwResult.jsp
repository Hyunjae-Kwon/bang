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
			<h2>비밀번호 재설정</h2>
			<ul>
				<li><a href="#"><i class="fas fa-home"></i> Home</a></li>
				<li><i class="fas fa-angle-double-right"></i> 비밀번호 찾기</li>
				<li><i class="fas fa-angle-double-right"></i> 재설정</li>
			</ul>
		</div>
	</div>
</div>

<!--  ************************* 비밀번호 찾기 Starts Here ************************** -->
<div class="row contact-rooo no-margin">
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div style="margin:0px" class="serv"></div>
			</div>
			<div style="padding: 20px" class="col-sm-7">
				<br>
				<div class="row cont-row">
					<div class="col-sm-3">
						<label>변경할 비밀번호</label><span>:</span>
					</div>
					<div class="col-sm-8">
						<input type="text" id="MEM_PW" name="MEM_PW" placeholder="Enter Password" class="form-control input-sm">
						<input type="hidden" id="MEM_ID" name="MEM_ID" value="${mem.MEM_ID}">
					</div>
				</div>
				<div class="row cont-row">
					<div class="col-sm-3">
						<label>비밀번호 재확인</label><span>:</span>
					</div>
					<div class="col-sm-8">
						<input type="text" id="MEM_PW2" name="MEM_PW2" placeholder="Enter Password" class="form-control input-sm">
					</div>
				<div style="margin-top: 0px;" class="row">
					<div style="padding-top: 50px;" class="col-sm-3">
						<label></label>
					</div>
					<div class="col-sm-8">
						<input type="button" value="비밀번호 변경" class="btn btn-success btn-sm" onClick="updatePw()">
					</div>
				</div>	
				</div>
			</div>
		</div>
	</div>
</div>

<!--  ************************* 비밀번호 찾기 script ************************** -->
<script>
/* 비밀번호 찾기 유효성 체크 및 변경*/
function updatePw() {
	var memPw = document.getElementById("MEM_PW");	
	var memPw2 = document.getElementById("MEM_PW2");
	var memId = document.getElementById("MEM_ID");
	
	/* 비밀번호 유효서 체크 */
	if(memPw.value.trim() == ""){
		alert("변경할 비밀번호를 입력해주세요.");
		memPw.focus();
		return false;
	}
	if(memPw2.value.trim() == ""){
		alert("비밀번호 재확인 입력해주세요.");
		memPw.focus();
		return false;
	}	
	if(memPw2.value != memPw.value){
		alert("비밀번호가 일치하지 않습니다.");
		memPw2.focus();
		return false;
	}
	
	/* 비밀번호 변경 */
	$.ajax({
		url : '/bang/updatePw.tr',
		async: false,
		type : 'POST',
		data : {MEM_ID:memId.value, MEM_PW:memPw.value},
		success : function(data) {
			alert("비밀번호 변경 완료!\n로그인 해주세요");
			location.href='/bang/loginForm.tr';
		}
	});
}
</script>
   
</body>
</html>