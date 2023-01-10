<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<!-- ################# Header Starts Here#######################--->
    <header class="continer-fluid ">
        <div  class="header-top">
            <div class="container">
                <div class="row col-det">
                    <div class="col-lg-6 d-none d-lg-block">
                        <ul class="ulleft">
                        	<li>Contact us<span>|</span></li>
                            <li>
                                <i class="far fa-envelope"></i>
                                everywhere@bbgg.tr
                                <span>|</span>
                            </li>
                            <li>
                                <i class="fas fa-phone-volume"></i>
                                +82 762 5433
                            </li>
                        </ul>
                    </div>
                    <!-- 로그인, 로그아웃, 회원가입, 마이페이지 등 -->
                    <div class="col-lg-6 col-md-12">
                        <ul class="ulright">
                        	<!-- 로그인을 하지 않았을 경우 -->
							<c:if test="${ empty MEM_ID }">
								<li>
									<a style="color: #bfbfbf;" href="/bang/loginForm.tr">로그인</a> 
								</li>
								<li>
									<a style="color: #bfbfbf;" href="/bang/joinForm.tr">회원가입</a>
								</li>
							</c:if>
					
							<!-- 로그인을 했을 경우 -->
							<c:if test="${! empty MEM_ID }">
								<li>
									<span><%= session.getAttribute("MEM_ID") %>님</span>
								</li>
								<li>
									<a style="color: #bfbfbf;" href="/myPage.omc">마이페이지</a> 
								</li>
								<li>
									<a style="color: #bfbfbf;" href="javascript:logoutCheck()">로그아웃</a> 
								</li>
							</c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="menu-jk" class="header-bottom">
            <div class="container">
                <div class="row nav-row">
                    <div class="col-lg-3 col-md-12 logo">
                        <a href="/bang/main.tr">
                            <img style="max-height:60px;" src="resources/images/banggok_logo_white.png" alt="">
                            	<a data-toggle="collapse" data-target="#menu" href="#menu">
                            		<i class="fas d-block d-lg-none  small-menu fa-bars"></i>
                            	</a>
                        </a>
                    </div>
                    <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
	                    <ul class="navbad">
	                        <li class="nav-item active">
	                            <a class="nav-link" href="/bang/tripWriteForm.tr">여행 일정 만들기
	                            </a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="/bang/togetherList.tr">동행</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="/bang/tripList.tr">여행 일정 공유</a>
	                        </li>
	                        
	                        <li class="nav-item">
	                            <a class="nav-link" href="/bang/reviewList.tr">여행 후기</a>
	                        </li>
	
	                        <li class="nav-item">
	                            <a class="nav-link" href="/bang/allRecommendList.tr">여행지 추천</a>
	                        </li>
	                        <!-- 메뉴 버튼 추가를 위해서 우선 주석처리함 -->
	                        <!-- <li class="nav-item">
	                            <a class="nav-link" href="contact_us.html">Contact US</a>
	                        </li> -->
	                    </ul>
                    </div>
                </div>
            </div>
        </div> 
    </header>
</body>