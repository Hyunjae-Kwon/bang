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
        <div class="container">
            <div class="row">
                <h2>MyPage</h2>
                <ul>
                    <li><a href="/bang/main.tr"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="/bang/myTripList.tr"><i class="fas fa-blog"></i> 여행 일정</a></li>
                    <li><a href="/bang/myReviewList.tr"><i class="fas fa-blog"></i> 여행 후기</a></li>
                    <li><a href="/bang/myTogetherList.tr"><i class="fas fa-blog"></i> 동행</a></li>
                    <li><a href="/bang/myInfoModifyForm.tr"><i class="fas fa-blog"></i> 회원 정보</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    </body>
</html>