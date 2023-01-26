<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<style>
.search-btn{
  text-decoration: none;
  float: right;
  width: 25px;
  height: 25px;
  background-color: #BFBFBF;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #334960;
}
.search-box:hover > .search-btn{
  background-color: #fff;
}
.search-txt{
  display: flex;
  padding: 0;
  width: 0px;
  border:none;
  background: none;
  outline: none;
  float: left;
  font-size: 1rem;
  line-height: 1.5;
  transition: .4s;
}
.search-box:hover > .search-txt{
  width: 140px;
  padding: 0 6px;
  background-color: #fff;
  border-radius: 30px;
  border: 1px solid #BFBFBF
}

</style>
<body>
	<!-- ################# Header Starts Here#######################--->
    <header class="continer-fluid ">
        <div class="header-top">
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
                        <ul id="login" class="ulright">
                        	<!-- 로그인을 하지 않았을 경우 -->
							<c:if test="${ empty MEM_ID }">
								<li>
									<a style="color: #bfbfbf;" href="/bang/loginForm.tr">로그인</a> 
								</li>
								<li>
									<a style="color: #bfbfbf;" href="/bang/joinForm.tr">회원가입</a>
								</li>
								<li style="line-height: 1.5; padding: 0px;">
									<form action="/bang/searchAll.tr" method="GET">
										<li class="search-box">
											<input type="text" class="search-txt" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요.">&nbsp;&nbsp;
											<button class="search-btn" onClick="form.submit()"><i class="fas fa-search" style="margin: 0px;"></i></button>
										</li>
									</form>
								</li>
							</c:if>
					
							<!-- 로그인을 했을 경우 -->
							<c:if test="${! empty MEM_ID }">
								<li>
									<span><%= session.getAttribute("MEM_ID") %>님</span>
								</li>
								<li>
									<a style="color: #bfbfbf;" href="/bang/myPage.tr">마이페이지</a> 
								</li>
								<li>
									<a style="color: #bfbfbf;" href="/bang/chatBox.tr">메시지함</a> 
								</li>
								<li>
									<a style="color: #bfbfbf;" href="/bang/logout.tr">로그아웃</a> 
								</li>
								<li style="line-height: 1.5; padding: 0px;">
									<form action="/bang/searchAll.tr" method="GET">
										<li class="search-box">
											<input type="text" class="search-txt" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요.">&nbsp;&nbsp;
											<button class="search-btn" onClick="form.submit()"><i class="fas fa-search" style="margin: 0px;"></i></button>
										</li>
									</form>
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
	                            <a class="nav-link" style="cursor:pointer;" onclick="loginCheck()">여행 일정 만들기</a>
	                            <input type="hidden" id="MEM_ID" name="MEM_ID" value="${MEM_ID}">
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
	                            <a class="nav-link" href="/bang/recommendList.tr">여행지 추천</a>
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
        
        <script>
        function loginCheck(){
        	if (!$("#MEM_ID").val()){
		    	alert("로그인을 해주세요.");
		    		   
		    	return false;
		    }
	    	location.href="/bang/tripWriteForm.tr";
        }
	    </script>
    </header>
</body>