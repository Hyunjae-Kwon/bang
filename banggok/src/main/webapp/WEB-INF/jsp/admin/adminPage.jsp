<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>방방곡곡</title>
</head>
    <body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container" >
            <div class="row">
                <h2>관리자 페이지</h2>
                <ul>
                    <li><a href="/bang/main.tr"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="/bang/adminTripList.tr"><i class="fas fa-map-marked"></i> 여행 일정 공유 게시판 관리</a></li>
                    <li><a href="/bang/adminReviewList.tr"><i class="fas fa-pen-nib"></i> 여행 후기 게시판 관리</a></li>
                    <li><a href="/bang/adminTogetherList.tr"><i class="fas fa-comment"></i> 동행 게시판 관리</a></li>
                    <li><a href="/bang/adminRecommendList.tr"><i class="fas fa-plane"></i>여행지 추천 게시판 관리</a></li>
                    <li><a href="/bang/adminReportList.tr"><i class="fas fa-crosshairs"></i>신고 관리</a></li>
                    <li><a href="/bang/adminMemberList.tr"><i class="fas fa-user-alt"></i>회원 목록</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="board-list" style="background-color: #eaeaea">
    	<div>
    	<br><br><br><br><br><br><br>
    	</div>
    </div>
    </body>
</html>