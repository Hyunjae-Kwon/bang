<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                <h2>여행 후기</h2>
	                <ul>
	                    <li> <a href="reviewWriteForm.tr"><i class="fas fa-blog"></i>글쓰기</a></li>
	                    <li><i class="fas fa-angle-double-right"></i> Review</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <!--*************** 여행 후기 리스트 Starts Here ***************-->
	    <div class="container-fluid blog">
	        <div class="container">
	            <div class="blog-row row">
					<c:forEach var="review" items="${reviewList}" varStatus="status">
		                <div class="col-lg-4 col-md-6 col-sm-6">
		                   <div class="blog-col">
		                   		<a href="/bang/reviewDetail.tr?RV_NUM=${review.RV_NUM }">
		                        <img src="resources/images/review/${review.RV_IMAGE}.jpg" alt="" >
		                        <span>${review.RV_REGDATE }</span>
		                        <h4>${review.RV_TITLE }</h4>
		                        <p>${review.RV_CONTENT }</p></a>
		                   </div>
		                </div>
					</c:forEach>
	        	</div>
	        </div>
	    </div>  
    </body>
</html>
