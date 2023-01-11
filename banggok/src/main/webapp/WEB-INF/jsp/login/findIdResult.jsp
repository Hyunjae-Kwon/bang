<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
			<h2>아이디 찾기 결과</h2>
			<ul>
				<li><a href="#"><i class="fas fa-home"></i> Home</a></li>
				<li><i class="fas fa-angle-double-right"></i> 아이디 찾기</li>
				<li><i class="fas fa-angle-double-right"></i> 결과</li>
			</ul>
		</div>
	</div>
</div>



<!--  ************************* 아이디 찾기 결과 Starts Here ************************** -->
<div class="our-team">
	<div class="container">
		<div class="row session-title">
			<p><b>${mem.MEM_NAME}</b> 회원님의 아이디는</p>
			<h2>${mem.MEM_ID}</h2>
			<p>입니다. 감사합니다.</p>
			<P><button type="button" class="btn btn-success btn-sm" onClick="location.href='/bang/login.tr'">로그인하기</button></P>
		</div>  
	</div>
</div>






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