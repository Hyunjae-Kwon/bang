<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<script>
	function checks() {
		if (confirm("수정하시겠습니까?") == true) {
			var MEM_ID = document.getElementById("memId");
			var MEM_PW = document.getElementById("MEM_PW");
			var MEM_PW2 = document.getElementById("MEM_PW2");
			var MEM_NAME = document.getElementById("MEM_NAME");
			var MEM_NICKNAME = document.getElementById("MEM_NICKNAME");
			var MEM_EMAIL = document.getElementById("MEM_EMAIL");
			var MEM_PHONE = document.getElementById("MEM_PHONE");

			if(MEM_ID.value.trim() == ""){
				alert("아이디를 입력해주세요.");
				MEM_ID.focus();
				return false;
			}
			
			if (MEM_PW.value.trim() == "") {
				alert("비밀번호를 입력해주세요.");
				MEM_PW.focus();
				return false;
			}

			if (MEM_PW2.value != MEM_PW.value) {
				alert("비밀번호가 일치하지 않습니다.");
				MEM_PW2.focus();
				return false;
			}

			if (MEM_NAME.value.trim() == "") {
				alert("이름을 입력해주세요.");
				MEM_NAME.focus();
				return false;
			}

			if (MEM_NICKNAME.value.trim() == "") {
				alert("닉네임을 입력해주세요.");
				MEM_NICKNAME.focus();
				return false;
			}

			if (MEM_EMAIL.value.trim() == "") {
				alert("이메일을 입력해주세요.");
				MEM_EMAIL.focus();
				return false;
			}

			if (MEM_PHONE.value.trim() == "") {
				alert("핸드폰 번호를 입력해주세요.");
				MEM_PHONE.focus();
				return false;
			}
			document.modifyForm.submit();
		}
	}
</script>
<script type="text/javascript">
	function changeForm(val) {
		if (val == "-1") {
			location.href = "/bang/adminMemberList.tr";
		} else if (val == "0") {
			location.href = "/bang/main.jsp?contentPage=/adminMemberModify.tr";
		} else if (val == "1") {
			location.href = "/bang/main.jsp?contentPage=/adminMemberDelete.tr";
		}
	}
</script>
<script>
	function submit2(del) {
		if (confirm("탈퇴하시겠습니까?") == true) {
			del.action = "/bang/adminMemberDelete.tr";
			del.submit();
			return true;
		}
	}
</script>
<script>
	$(document).ready(function() {
		var MEM_ID = $('#MEM_ID').val();
	});
</script>
<script>
	/* 첫 화면 로딩 시 포커스 */
	window.onload = function() {
		document.getElementById("MEM_ID").focus();
	}
</script>
<!-- 자바스크립트 끝 -->
    <body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>회원 관리</h2>
                <ul>
                    <li> <a href="adminPage.tr"><i class="fas fa-user-alt"></i>관리자 페이지</a></li>
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-map-marked"></i> 회원 정보 수정</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- ************************* 회원 정보 수정 ************************** -->
        <div class="row contact-rooo no-margin">
        <div class="container">
			<form id="modifyForm" name="modifyForm" method="POST" action="/bang/adminMemberModify.tr">
                <div style="padding:20px" class="col-sm-7">
                    <h2 >회원 정보 수정</h2> <br>
                    <div class="row cont-row">
                        <div class="col-sm-3"><label>아이디 </label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" placeholder="아이디를 입력하세요." name="MEM_ID" id="memId" class="form-control input-sm"
                        value="${member.MEM_ID}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>비밀번호 </label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="MEM_PW" id="MEM_PW" placeholder="비밀번호를 입력하세요." class="form-control input-sm"
                        value="${member.MEM_PW}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>비밀번호 확인 </label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="MEM_PW2" id="MEM_PW2" placeholder="비밀번호를 입력하세요." class="form-control input-sm"
                        value="${member.MEM_PW}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>이름</label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름을 입력하세요." class="form-control input-sm"
                        value="${member.MEM_NAME}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>닉네임</label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="MEM_NICKNAME" id="MEM_NICKNAME" placeholder="닉네임을 입력하세요." class="form-control input-sm"
                        value="${member.MEM_NICKNAME}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>이메일 </label><span>:</span></div>
                        <div class="col-sm-8"><input type="email" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="이메일을 입력하세요." class="form-control input-sm"
                        value="${member.MEM_EMAIL}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>휴대폰 번호</label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" name="MEM_PHONE" id="MEM_PHONE" placeholder="휴대폰 번호를 입력하세요." class="form-control input-sm"
                        value="${member.MEM_PHONE}"></div>
                    </div>
                    <div  class="row cont-row">
                        <div class="col-sm-3"><label>활동 정지 유무</label><span>:</span></div>
                        <div class="col-sm-8"><input type="radio" name="MEM_BLOCK" id="MEM_BLOCK" value="N" checked> 활동중 <input type="radio" name="MEM_BLOCK" id="MEM_BLOCK" value="Y"> 활동정지</div>
                    </div>
                    
                    <div style="margin-top:10px;" class="row">
                        <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                        <div class="col-sm-8">
                            <button type="button" class="btn btn-success btn-sm" onClick="checks(this.form)">수정</button>
                            <button type="button" class="btn btn-success btn-sm" onClick="return submit2(this.form);">탈퇴</button>
                            <button type="button" class="btn btn-success btn-sm" onclick="changeForm(-1)">뒤로</button>
                        </div>
                    </div>
                <div class="col-sm-5">
               </div>
               </div>
         </form>
         </div>
         </div>
    </body>
</html>