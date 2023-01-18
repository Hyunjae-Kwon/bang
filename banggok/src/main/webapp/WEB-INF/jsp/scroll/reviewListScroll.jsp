<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
    <body class="content">
		<div class="container-fluid blog">
	    	<div class="container">
            	<div class="blog-row row">
					<c:forEach var="review" items="${reviewList}" varStatus="status">
	                    <div class="col-lg-4 col-md-6 col-sm-6">
	                       <div class="blog-col">
	                       		<a href="/bang/reviewDetail.tr?RV_NUM=${review.RV_NUM}">
	                            <img src="resources/images/review/${review.RV_IMAGE}.jpg" alt="" ></a>
	                            <span>${review.RV_REGDATE }</span>
	                            <h4><a href="/bang/reviewDetail.tr?RV_NUM=${review.RV_NUM}">${review.RV_TITLE}</a></h4>
	                            <p>${review.RV_CONTENT}</p>
	                       </div>
	                    </div>
					</c:forEach>
            	</div>
            </div>			
	    </div>
    </body>
</html>
