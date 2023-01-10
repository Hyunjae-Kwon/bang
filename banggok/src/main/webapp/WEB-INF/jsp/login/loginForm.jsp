<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Travelet Free Website Tempalte | Smarteyeapps.com</title>
    <link rel="shortcut icon" href="resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="resources/images/fav.jpg">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/all.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>

    <body>
    
<!-- ################# Header Starts Here#######################--->

    <header class="continer-fluid ">
        <div  class="header-top">
            <div class="container">
                <div class="row col-det">
                    <div class="col-lg-6 d-none d-lg-block">
                        <ul class="ulleft">
                            <li>
                                <i class="far fa-envelope"></i>
                                sales@smarteyeapps.com
                                <span>|</span></li>
                            <li>
                                <i class="fas fa-phone-volume"></i>
                                +876 987 666 5433</li>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <ul class="ulright">
                            <li>
                                <i class="fab fa-facebook-square"></i>
                            </li>
                            <li>
                                <i class="fab fa-twitter-square"></i>
                            </li>
                            <li>
                                <i class="fab fa-instagram"></i>
                            </li>
                            <li>
                                <i class="fab fa-linkedin"></i>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="menu-jk" class="header-bottom">
            <div class="container">
                <div class="row nav-row">
                    <div class="col-lg-3 col-md-12 logo">
                        <a href="index.html">
                            <img src="resources/images/logo.png" alt="">
                            <a data-toggle="collapse" data-target="#menu" href="#menu"><i class="fas d-block d-lg-none  small-menu fa-bars"></i></a>
                        </a>

                    </div>
                    <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
                       
                                <ul class="navbad">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="index.html">Home
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about_us.html">About Us</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="packages.html">Packages</a>
                                    </li>
                                    
                                    <li class="nav-item">
                                        <a class="nav-link" href="gallery.html">Gallery</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="blog.html">Blog</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact_us.html">Contact US</a>
                                    </li>




                                </ul>
                                
                           
                    </div>
                </div>
            </div>
        </div> 
    </header>
 
  <style>
#MEM_ID {
  display: block;
  min-width : 15%;
  max-width : 100%;
  height: calc(2.25rem + 2px);
  margin : 0 auto;
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
  min-width : 15%;
  max-width : 100%;
  height: calc(2.25rem + 2px);
  margin : 0 auto;
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
	if(window.event.keyCode ==13) {
		return fsubmit();	
	}	
}

/* 첫 화면 로딩 시 포커스 */
window.onload = function() {
	document.getElementById("mem_id").focus();
}
</script>
<!-- <script>
$(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^ㄱ-힣a-zA-Z0-9@]/gi,"") );})
$(document).on("keyup", "input[noBlank]", function() {$(this).val( $(this).val().replace(/\s/gi,"") );})
</script> -->



<div style="text-align:center">
	<br><br><br><br><br><br>
	<span style="font-size:xx-large; "><b>로 그 인</b></span>
</div>
<hr>
<div style="text-align:center">
	<form id="loginForm" action="/bang/login.tr" method="post">
	
		<label for="ID">ID</label>
		<br/>
		<input type="text" id="mem_id" name="MEM_ID" maxlength="10">
		<br/>
		<label for="PW">비밀번호</label>
		<br/>
		<input type="password" id="mem_pw" name="MEM_PW" onkeypress="keyPress()" >
		<br/><br/>
		<!-- 아이디 저장 &nbsp; <input type="checkbox" id="ID_SAVE" name="ID_SAVE"><br> -->
		<p></p>
	

		<div class="gallery-filter d-none d-sm-block">
		<input type="button" value="로 그 인" class="btn btn-default filter-button" onClick="fsubmit();">
		<input type="button" value="회원가입" onClick="location.href='/bang/joinForm.tr'" class="btn btn-default filter-button"><br>
		
		
			<ul>
	<li>
      <!-- 네이버로그인. -->
      <a id="naverIdLogin_loginButton" href="javascript:void(0)" >
      	 <img src="resources/images/naverlogin.png" alt=" " width="200" height="50" >
          
      </a>
	</li>
	<!-- <li onclick="naverLogout(); return false;">
      <a href="javascript:void(0)">
          <span>네이버 로그아웃</span>
      </a>
	</li> -->
</ul>

	<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
      	 <img src="resources/images/kakao_login.png" alt=" " width="200" height="50" >
      </a>
	</li>
 	<!-- <li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>  -->
</ul>
		</div>
		<p></p>
	
		<a href="/bang/findId.tr" class="nav-link" style="font-size:large; ">아이디 찾기</a>
		<a href="/bang/findPw.tr" class="nav-link" style="font-size:large; ">비밀번호 찾기</a>
	
	</form>
</div>


<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "szPhTBM3ONRDghB7fr8x", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/bang/main.tr", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


/* 네이버 로그아웃
 var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
} */
</script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        window.Kakao.init('78f98f37ee2ed40c3a38f0d489f2dd36');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    window.location.href='/bang/main.tr' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
 <script>   
/*카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  */
</script>
<!--  ************************* Footer Start Here ************************** -->
       
<footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <h2>About Us</h2>
                    <p>
                        Smart Eye is a leading provider of information technology, consulting, and business process services. Our dedicated employees offer strategic insights, technological expertise and industry experience.
                    </p>
                    <p>We focus on technologies that promise to reduce costs, streamline processes and speed time-to-market, Backed by our strong quality processes and rich experience managing global... </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <h2>Useful Links</h2>
                    <ul class="list-unstyled link-list">
                        <li><a ui-sref="about" href="#/about">About us</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="portfolio" href="#/portfolio">Portfolio</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="products" href="#/products">Latest jobs</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="gallery" href="#/gallery">Pricing</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="contact" href="#/contact">Contact us</a><i class="fa fa-angle-right"></i></li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-12 map-img">
                    <h2>Contact Us</h2>
                    <address class="md-margin-bottom-40">
                        BlueDart Hosting <br>
                       765th Boulevard, <br>
                        Rochester, CA <br>
                        Phone: +1 831 143 556 <br>
                        Email: <a href="mailto:info@bluedart.com" class="">info@bluedart.in</a><br>
                        Web: <a href="https://smarteyeapps.com/" class="">www.bluedart.in</a>
                    </address>

                </div>
            </div>
        </div>
        

    </footer>
    <div class="copy">
            <div class="container">
                <a href="https://www.smarteyeapps.com/">2019 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps</a>
                
                <span>
                <a><i class="fab fa-github"></i></a>
                <a><i class="fab fa-google-plus-g"></i></a>
                <a><i class="fab fa-pinterest-p"></i></a>
                <a><i class="fab fa-twitter"></i></a>
                <a><i class="fab fa-facebook-f"></i></a>
        </span>
            </div>

        </div> 
    
   
    </body>

    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="resources/js/script.js"></script>

</html>
