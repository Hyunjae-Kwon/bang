<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
    <body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>여행 후기</h2>
                <ul>
                    <li> <a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Review</li>
                </ul>
            </div>
        </div>
    </div>
    <!--*************** Blog Starts Here ***************-->
    <div class="about-us container-fluid">
	    <div class="container">
			<c:forEach var="review" items="${reviewDetail}" varStatus="status">
		        <div class="row natur-row no-margin w-100">
		            <div class="text-part col-md-6">
		                <h2>${review.RV_TITLE }</h2>
		                <p>${review.RV_CONTENT }</p>
		            </div>
		            <div class="image-part col-md-6">
		                <img src="resources/images/review/${review.RV_IMAGE}.jpg" alt="">
		            </div>
		        </div>
		    </c:forEach>
	    </div>
    </div>

	<!-- 댓글 -->
	<div class="review container-fluid">
         <div class="container">
              <div class="session-title">
                <h2>댓글</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sollicitudin nisi id consequat bibendum. Phasellus at convallis elit. In purus enim, scelerisque id arcu vitae</p>
            </div>
            <div class="row review-row">
				<c:forEach var="comment" items="${reviewCommentList}" varStatus="status">
	                <div class="col-md-6">
	                    <div class="review-col">
	                        <div class="profil">
	                          <img src="resources/images/testimonial/member-01.jpg" alt="">  
	                        </div>
	                        <div class="review-detail">
	                            <!-- <h4>댓글 제목</h4> -->
	                            <p>${comment.BC_COMMENT }</p>
	                            <h6>${comment.BC_ID }</h6>
	                            <ul class="rat">
	<!--                                 <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li> -->
	                            </ul>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
         </div>
     </div>
    </body>
</html>
