<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h2>회원 아이디 찾기</h2>
				<ul>
					<li><a href="#"><i class="fas fa-home"></i> Home</a></li>
					<li><i class="fas fa-angle-double-right"></i> 아이디 찾기</li>
				</ul>
			</div>
		</div>
	</div>

	<!--  ************************* 아이디 찾기 Starts Here ************************** -->
	<div class="row contact-rooo no-margin">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div style="margin:0px" class="serv"></div>
				</div>
				<div style="padding: 20px" class="col-sm-7">
					<br>
					<form id="findId" action="/bang/findIdResult.omc" method="post">
					<div class="row cont-row">
						<div class="col-sm-3">
							<label>이 름</label><span>:</span>
						</div>
						<div class="col-sm-8">
							<input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="Enter Name"	class="form-control input-sm">
						</div>
					</div>
					<div class="row cont-row">
						<div class="col-sm-3">
							<label>Email</label><span>:</span>
						</div>
						<div class="col-sm-8">
							<input type="text" id="MEM_EMAIL1" name="MEM_EMAIL1" placeholder="Enter Email Address" class="form-control input-sm">
							<select class="form-control" id="MEM_EMAIL2" name="MEM_EMAIL2">
								<option value="직접입력">직접입력</option>
								<option value="@naver.com">@naver.com</option>
								<option value="@daum.net">@daum.net</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="@hanmail.com">@hanmail.com</option>
								<option value="@yahoo.co.kr">@yahoo.co.kr</option>
							</select>
						</div>
					</div>
					<div style="margin-top: 0px;" class="row">
						<div style="padding-top: 50px;" class="col-sm-3">
							<label></label>
						</div>
						<div class="col-sm-8">
							<input type="button" value="회원확인" class="btn btn-success btn-sm" onClick="return formCheck()">
							<input type="button" value="인증번호 전송" class="btn btn-success btn-sm">
						</div>
					</div>
					</form>
					<div class="row cont-row">
						<div class="col-sm-3">
							<label>인증번호</label><span>:</span>
						</div>
						<div class="col-sm-8">
							<input type="text" name="" placeholder="인증번호" class="form-control input-sm">
						</div>
					</div>
					<div style="margin-top: 0px;" class="row">
						<div style="padding-top: 10px;" class="col-sm-3">
							<label></label>
						</div>
						<div class="col-sm-8">
							<button type="button" class="btn btn-success btn-sm">인증번호 확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	/* 아이디 찾기 유효성 체크 */
	function formCheck() {
		var form = document.getElementById("findId");
		var MEM_NAME = document.getElementById("MEM_NAME");
		var MEM_EMAIL1 = document.getElementById("MEM_EMAIL1");
		var MEM_EMAIL2 = document.getElementById("MEM_EMAIL2");
		var MEM_EMAIL;
		
		if(MEM_NAME.value.trim()=="") {
			alert("회원이름을 입력해주세요.");
			MEM_NAME.focus();
			return false;
		} else if(MEM_EMAIL1.value.trim()=="") {
			alert("이메일 주소를 입력해주세요.");
			MEM_EMAIL1.focus();
			return false;
		} else if(MEM_EMAIL2.value.trim()=="직접입력") {
			MEM_EMAIL = MEM_EMAIL1;
			MEM_EMAIL2.focus();
			if(validEmailCheck(MEM_EMAIL)==false){
				alert('올바른 이메일 주소를 입력해주세요.')
				MEM_EMAIL.value='';
				MEM_EMAIL.focus();
				return false;
			} else {
				alert('MEM_EMAIL');
			}
			return false;
		} else if(MEM_EMAIL2.value.trim()!="직접입력") {
			MEM_EMAIL = MEM_EMAIL1 + MEM_EMAIL2;
			MEM_EMAIL2.focus();
			if(validEmailCheck(MEM_EMAIL)==false){
			    alert('올바른 이메일 주소를 입력해주세요.')
			    MEM_EMAIL.value='';
			    MEM_EMAIL.focus();
			    return false;
			} else {
		    	alert(MEM_EMAIL);
			}
			return false;
		}
	}
	function validEmailCheck(MEM_EMAIL){
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		return (MEM_EMAIL.value.match(pattern)!=null)
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