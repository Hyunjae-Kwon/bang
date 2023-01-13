<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">

<head>
</head>

<body>

<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
	<div class="container">
		<div class="row">
			<h2>아이디 찾기 결과</h2>
			<ul>
				<li><a href="/bang/main.tr"><i class="fas fa-home"></i> Home</a></li>
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
			<P><button type="button" class="btn btn-success btn-sm" onClick="location.href='/bang/loginForm.tr'">로그인하기</button></P>
		</div>  
	</div>
</div>

</body>
</html>