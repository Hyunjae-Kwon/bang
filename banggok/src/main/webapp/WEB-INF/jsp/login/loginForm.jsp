<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<head>
</head>
<body>
<style>
#MEM_ID {
	display: block;
	min-width: 15%;
	max-width: 100%;
	height: calc(2.25rem + 2px);
	margin: 0 auto;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}

#MEM_PW {
	display: block;
	min-width: 15%;
	max-width: 100%;
	height: calc(2.25rem + 2px);
	margin: 0 auto;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}
</style>

	<script type="text/javascript">
		/* 로그인 유효성 체크 */
		function fsubmit() {
			var mem_id = $("#mem_id").val()
			var mem_pw = $("#mem_pw").val()

			if (mem_id == null || mem_id == '') {
				alert("아이디를 입력하세요.");
				return 0;
			} else if (mem_pw == null || mem_pw == '') {
				alert("비밀번호를 입력하세요");
				return 0;
			}

			$("#MEM_ID").val(mem_id);
			$("#MEM_PW").val(mem_pw);

			loginForm.submit();
		}

		/* 로그인 화면에서 엔터키 입력시 로그인 시도 */
		function keyPress() {
			if (window.event.keyCode == 13) {
				return fsubmit();
			}
		}

		/* 첫 화면 로딩 시 포커스 */
		window.onload = function() {
			document.getElementById("mem_id").focus();
		}
	</script>
	<script>
		$(document).on("keyup", "input[noSpecial]", function() {
			$(this).val($(this).val().replace(/[^ㄱ-힣a-zA-Z0-9@]/gi, ""));
		})
		$(document).on("keyup", "input[noBlank]", function() {
			$(this).val($(this).val().replace(/\s/gi, ""));
		})
	</script>

	<div style="text-align: center">
		<br><br><br><br><br><br>
		<span style="font-size: xx-large;"><b>로 그 인</b></span>
	</div>
	<hr>
	<div style="text-align: center">
		<form id="loginForm" name="loginForm" action="/bang/login.tr" method="post">
			<label for="ID">ID</label><br/> 
				<input type="text" id="mem_id" name="MEM_ID" maxlength="10"><br/><br/>
			<label for="PW">비밀번호</label><br/>
				<input type="password" id="mem_pw" name="MEM_PW" onkeypress="keyPress()"><br/><br/>
				아이디 저장 &nbsp; <input type="checkbox" id="ID_SAVE" name="ID_SAVE"><br><br/>
			<p></p>

			<div class="gallery-filter d-none d-sm-block">
				<input type="button" value="로 그 인" class="btn btn-default filter-button" onClick="fsubmit();">
				<input type="button" value="회원가입" onClick="location.href='/bang/joinForm.tr'" class="btn btn-default filter-button"><br>
				
				<div id="naver_id_login" style="margin-bottom: 5px;"></div>
				<ul>
					<li>
						<a href="javascript:kakaoLogin()">
							<img src="resources/images/kakaologin.png" alt=" " width="185" height="40">
						</a>
					</li>
				</ul>
			</div><br>
			<div class="gallery-filter d-none d-sm-block">
				<input type="button" value="아이디 찾기" class="btn btn-default filter-button" onClick="location.href='/bang/findId.tr'">
				<input type="button" value="비밀번호 찾기" class="btn btn-default filter-button" onClick="location.href='/bang/findPw.tr'">
			</div>
		</form>
		
		<!-- 카카오 로그인 데이터 전송을 위해 숨겨져 있는 폼 -->
		<form id="kakaoLogin" name="kakaoLogin" action="/bang/login.tr" method="post">
			<input type="hidden" id="MEM_ID" name="MEM_ID">
			<input type="hidden" id="kakaoEmail" name="kakaoEmail">
			<input type="hidden" id="kakaoNickname" name="kakaoNickname">
			<input type="hidden" id="kakaoImage" name="kakaoImage">
		</form>
		
		<!-- 네이버 로그인 데이터 전송을 위해 숨겨져 있는 폼 -->
		<form id="naverLogin" name="naverLogin" action="/bang/login.tr" method="post">
			<input type="hidden" id="MEM_ID" name="MEM_ID">
			<input type="hidden" id="naverEmail" name="naverEmail">
			<input type="hidden" id="naverNickname" name="naverNickname">
			<input type="hidden" id="naverImage" name="naverImage">
			<input type="hidden" id="naverName" name="naverName">
		</form>
	</div>
	<!-- 네이버 로그인 API -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<!-- //네이버 로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("szPhTBM3ONRDghB7fr8x", "http://localhost:8080/bang/loginForm.tr");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,40);
	  	naver_id_login.setDomain("http://localhost:8080/bang");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	  	
	 	// 네이버 사용자 프로필 조회
	    naver_id_login.get_naver_userprofile("naverSignInCallback()");
	 	
	    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	    function naverSignInCallback() {
	    	
	    	var naveremail = naver_id_login.getProfileData('email');
	    	var navernickname = naver_id_login.getProfileData('nickname');
	    	var navername = naver_id_login.getProfileData('name');
	    	var naverimage = naver_id_login.getProfileData('profile_image');
	    	
	    	$('#naverEmail').val(naveremail);
	    	$('#naverNickname').val(navernickname);
	    	$('#naverImage').val(naverimage);
	    	$('#naverName').val(navername);
	    	document.naverLogin.submit();
	    } 
	  	
	</script>
	
	<!-- 카카오 로그인 API -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	
	/* 내 키 */ 
	Kakao.init('f1fa3a582f3278c83fd4f3031cc4f96d'); 
	/* 예림씨 키 */
	/* window.Kakao.init('78f98f37ee2ed40c3a38f0d489f2dd36'); */
	
	/* 카카오 로그인 */
	function kakaoLogin() {
		
	    window.Kakao.Auth.login({
	        scope: 'profile_nickname,profile_image,account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
	        success: function(response) {
	            console.log(response) // 로그인 성공하면 받아오는 데이터
	            window.Kakao.API.request({ // 사용자 정보 가져오기 
	                url: '/v2/user/me',
	                success: (res) => {
	                	const email = res.kakao_account.email;
	                	const image = res.kakao_account.profile.profile_image_url;
	                	const nickname = res.kakao_account.profile.nickname;
	                	
	                	$('#kakaoEmail').val(email);
	                	$('#kakaoNickname').val(nickname);
	                	$('#kakaoImage').val(image);
	                	document.kakaoLogin.submit();
	                }
	            });
	        },
	        fail: function(error) {
	            console.log(error);
	        }
	    });
	}
	</script>
</html>
