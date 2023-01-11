<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>findId</title>
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








<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
	<div class="container">
		<div class="row">
			<h2>비밀번호 찾기</h2>
			<ul>
				<li><a href="#"><i class="fas fa-home"></i> Home</a></li>
				<li><i class="fas fa-angle-double-right"></i> 비밀번호 찾기</li>
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
						<label>아이디</label><span>:</span>
					</div>
					<div class="col-sm-8">
						<input type="text" id="MEM_ID" name="MEM_ID" placeholder="Enter ID" class="form-control input-sm">
					</div>
				</div>
				<div class="row cont-row">
					<div class="col-sm-3">
						<label>Email</label><span>:</span>
					</div>
					<div class="col-sm-8">
						<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="ex)abc@gmail.com" class="form-control input-sm">
					</div>
				</div>
				<div style="margin-top: 0px;" class="row">
					<div style="padding-top: 50px;" class="col-sm-3">
						<label></label>
					</div>
					<div class="col-sm-8">
						<input type="button" value="인증번호 전송" class="btn btn-success btn-sm" onClick="checkMem()">
					</div>
				</div>
				<div class="row cont-row">
					<div class="col-sm-3">
						<label>인증번호</label><span>:</span>
					</div>
					<div class="col-sm-8">
						<input class="form-control input-sm" id="checkNum" name="checkNum" placeholder="인증번호 6자리를 입력." 
						 	disabled="disabled" maxlength="6">
					</div>
				</div>
				<div style="margin-top: 0px;" class="row">
					<div style="padding-top: 10px;" class="col-sm-3">
						<label></label>
					</div>
					<div>
						<span id="mail-check-warn"></span>
					</div>
				</div>
				<div style="margin-top: 0px;" class="row">
				<div style="padding-top: 10px;" class="col-sm-3">
					<label></label>
					</div>
					<div class="col-sm-8">
						<input type="button" value="비밀번호 찾기" class="btn btn-success btn-sm" onClick="findPw()">
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<!--  ************************* 비밀번호 찾기 script ************************** -->
<script>
/* 비밀번호 찾기 유효성 체크 */
function checkMem() {
	var memId = document.getElementById("MEM_ID");
	var memEmail = document.getElementById("MEM_EMAIL");
		
	if(memId.value.trim()=="") {
		alert("아이디를 입력해주세요.");
		memId.focus();
		return false;
	} else if(memEmail.value.trim()=="") {
		alert("이메일 주소를 입력해주세요.");
		memEmail.focus();
		return false;
	} else if(validEmailCheck(memEmail)==false) {
		alert("이메일형식이 올바르지 않습니다.");
		memEmail.focus();
		return false;
	}
	/* 회원가입 여부 확인 */
	$.ajax({
		url : '/bang/checkMemPw.tr',
		async: false,
		type : 'POST',
		data : {MEM_ID:memId.value, MEM_EMAIL:memEmail.value},
		success : function(data) {
			if(data==""){
				alert("일치하는 정보가 없습니다.");
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

/* 이메일 주소 형식 확인 */
function validEmailCheck(memEmail) {
	var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return (memEmail.value.match(pattern)!=null)
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
function findPw() {
	const inputCode = $('#checkNum').val();
	const $resultMsg = $('#mail-check-warn');
	var memId = document.getElementById("MEM_ID").value;
	var memEmail = document.getElementById("MEM_EMAIL").value;
	
	if(inputCode === ""){
		$resultMsg.html('인증번호를 입력해 주세요.');
		$resultMsg.css('color','red');
	}else if(inputCode === code){
		$resultMsg.html('인증완료!');
		$resultMsg.css('color','green');
		location.href="/bang/findPwResult.tr?MEM_ID=" + memId + "&MEM_EMAIL=" + memEmail;
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
		$resultMsg.css('color','red');
	}	
} // end findPw()
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