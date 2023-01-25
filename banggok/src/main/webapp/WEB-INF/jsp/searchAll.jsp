<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
    <body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row" style="background-color: #FFF">
        <div class="container">
            <div class="row">
                <h2>통합 검색 결과</h2>
                <p><b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 여행 일정 검색 결과 Starts Here #######################---> 
    <div class="page-nav no-margin row" style="padding: 30px; padding-top: 30px;">
        <div class="container">
            <div class="row">
                <h2>여행 일정 검색 결과</h2>
                <p>여행 일정 공유 게시판에서 <b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>  
    <div class="popular-pack  container-fluid">
        <div class="container">
            <div class="row pack-row">
            	<c:choose>
					<c:when test="${fn:length(trip) > 0}">
						<c:forEach var="list" items="${trip}">
			                <div class="col-lg-4 col-md-6 col-sm-6" style="padding-bottom: 15px;">
			                    <div class="pack-col">
			                    	<a href="/bang/tripDetail.tr?TR_NUM=${list.TR_NUM}">
			                    		<img src="resources/images/packages/p1.jpg" alt="">
			                    		<!-- 여행 일정 작성 시 이미지 번호를 사용하여 이미지 호출, 지금은 일정 생성이 안되니 우선 주석 -->
			                    		<%-- <img src="resources/images/trip/trip_main_${list.TR_NUM}.png" alt=""> --%>
			                    	</a>
			                        
			                        <div class="revire row no-margin">
			                            <span>조회수 | ${list.TR_CNT}&nbsp;</span>
			                            <span>추천수 | ${list.TR_LIKE}</span>
			                            <span class="pric">
			                                <fmt:formatDate value="${list.TR_REGDATE}" pattern="yyyy-MM-dd"/> 
			                            </span>
			                            <span class="pric">|</span>
			                            <span class="pric">
			                                ${list.TR_ID}
			                            </span>
			                        </div>
			                        <div class="detail row no-margin">
			                            <h4>${list.TR_TITLE}</h4>
			                            <p>${list.TR_CONTENT}</p>
			                        </div>
			                    </div>
			                </div>
		                </c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-4 col-md-6 col-sm-6"></div>
						<div class="col-lg-4 col-md-6 col-sm-6">
				        	<p align="center"><b>조회된 결과가 없습니다.</b></p>
				        </div>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </div>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row" style="padding: 30px; padding-top: 30px;">
        <div class="container">
            <div class="row">
                <h2>여행지 추천 검색 결과</h2>
                <p>여행지 추천 게시판 <b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 여행지 검색 결과 Starts Here #######################--->   
    <div class="destinations container-fluid">
       <div class="container">
            <div class="dest-row row">
            	<c:choose>
					<c:when test="${fn:length(recom) > 0}">
						<c:forEach var="list" items="${recom}">
			                <div class="col-lg-4 col-md-6">
			                    <div class="dest-col">
			                        <div class="dest-img">
			                        	<a href="/bang/recommendDetail.tr?RC_NUM=${list.RC_NUM}">
				                    		<img src="resources/images/destination/d2.jpg" alt="">
				                    		<!-- 여행지 추천 작성 시 이미지 번호를 사용하여 이미지 호출, 지금은 생성이 안되니 우선 주석 -->
				                    		<%-- <img src="resources/images/recommend/recommend_main_${list.RC_NUM}.png" alt=""> --%>
				                    	</a>
			                        </div>
			                        <h3>${list.RC_TITLE}</h3>
			                        <p>${list.RC_CONTENT}</p>
			                        <button class="btn btn-outline-success" onClick="location.href='/bang/recommendDetail.tr?RC_NUM=${list.RC_NUM}'">상세 보기</button>
			                    </div>
			                </div>
		                </c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-4 col-md-6 col-sm-6"></div>
						<div class="col-lg-4 col-md-6 col-sm-6">
				        	<p align="center"><b>조회된 결과가 없습니다.</b></p>
				        </div>
					</c:otherwise>
				</c:choose>
            </div>
       </div>
    </div> 
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row" style="padding: 30px; padding-top: 30px;">
        <div class="container">
            <div class="row">
                <h2>동행 구하기 검색 결과</h2>
                <p>동행 구하기 게시판에서 <b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 동행 구하기 검색 결과 Starts Here #######################--->   
    <div class="review container-fluid">
         <div class="container">
            <div class="row review-row">
            	<c:choose>
					<c:when test="${fn:length(together) > 0}">
						<c:forEach var="list" items="${together}">
			                <div class="col-md-6" style="max-width: 25%">
			                    <div class="review-col">
			                        <div class="profil">
			                        	<!-- 동행 구하기는 이미지 없음 -->
			                        </div>
			                        <div class="review-detail" style="max-width: 250px;">
			                            <a href="/bang/togetherDetail.tr?TG_NUM=${list.TG_NUM}">
			                            	<h4>${list.TG_TITLE}</h4>
			                            </a>
			                            <span style="float: right;">조회수 | ${list.TG_CNT}</span>
			                            <span style="float: right;">추천수 | ${list.TG_LIKE}&nbsp;&nbsp;</span>
			                            <p>${list.TG_CONTENT}</p>
			                            <h6>${list.TG_ID}</h6>
			                        </div>
			                    </div>
			                </div>
		                </c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-4 col-md-6 col-sm-6"></div>
						<div class="col-lg-4 col-md-6 col-sm-6">
				        	<p align="center"><b>조회된 결과가 없습니다.</b></p>
				        </div>
					</c:otherwise>
				</c:choose>
            </div>
         </div>
     </div>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row" style="padding: 30px; padding-top: 30px;">
        <div class="container">
            <div class="row">
                <h2>여행 후기 검색 결과</h2>
                <p>여행 후기 게시판에서 <b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 여행 후기 검색 결과 Starts Here #######################--->   
    <div class="container-fluid blog">
        <div class="container">
	        <div class="blog-row row">
	        	<c:choose>
					<c:when test="${fn:length(review) > 0}">
						<c:forEach var="list" items="${review}">
				            <div class="col-lg-4 col-md-6 col-sm-6">
				               <div class="blog-col">
				               		<a href="/bang/reviewDetail.tr?RV_NUM=${list.RV_NUM}">
			                    		<img src="resources/images/destination/d1.jpg" alt="">
			                    		<!-- 여행 후기 작성 시 이미지 번호를 사용하여 이미지 호출, 지금은 여행 후기가 생성이 안되니 우선 주석 -->
			                    		<%-- <img src="resources/images/review/${list.RV_IMAGE}" alt=""> --%>
			                    	</a>
				                    <span>${list.RV_REGDATE}</span>
				                    <span style="float: right;">${list.RV_ID}</span>
				                    <h4>${list.RV_TITLE}</h4>
				                    <p>${list.RV_CONTENT}</p><br>
				                    <span style="float: right;">조회수 | ${list.RV_CNT}</span>
				                    <span style="float: right;">추천수 | ${list.RV_LIKE}&nbsp;&nbsp;</span><br>
				               </div>
				            </div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-4 col-md-6 col-sm-6"></div>
						<div class="col-lg-4 col-md-6 col-sm-6">
				        	<p align="center"><b>조회된 결과가 없습니다.</b></p>
				        </div>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </div> 
    </body>
</html>