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
		alert(memId.value);
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
			location.href='/bang/login.tr';
		}
	});
}
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