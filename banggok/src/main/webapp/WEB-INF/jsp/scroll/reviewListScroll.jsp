<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
    <body>
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
