<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>나만의 여행 일정 만들기! 방방곡곡</title>
</head>
<body>
	<!-- header -->
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	 	
	<!-- container --> 
	<div id="container" style="min-height:500px;">
		<tiles:insertAttribute name="body"/>
	</div>
	
	<!-- footer --> 
	<tiles:insertAttribute name="footer"/>
</body>
</html>