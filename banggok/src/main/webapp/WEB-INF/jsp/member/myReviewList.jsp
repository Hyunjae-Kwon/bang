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
    
<!-- ################# Header Starts Here#######################--->


 

    
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>나의 여행 후기</h2>
                <ul>
                    <li> <a href="reviewWriteForm.tr"><i class="fas fa-blog"></i>글쓰기</a></li>
                    <li><i class="fas fa-angle-double-right"></i> MyReview</li>
                </ul>
            </div>
        </div>
    </div>
    
    
     <!--*************** Blog Starts Here ***************-->
                     
    <div class="container-fluid blog">
        <div class="container">
        
                <div class="blog-row row">
					    <c:choose> 
					    	<c:when test="${reviewCount!=0}"> 
					<c:forEach var="myReview" items="${myReviewList}" varStatus="status">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                       <div class="blog-col">
                       		<a href="/bang/reviewDetail.tr?RV_NUM=${myReview.RV_NUM }">
                            <img src="resources/images/review/${myReview.RV_IMAGE}.jpg" alt="" >
                            <span>${myReview.RV_REGDATE }</span>
                            <span style="float: right;">${myReview.RV_ID }</span>
                            <h4>${myReview.RV_TITLE }</h4>
                            <p>${myReview.RV_CONTENT }</p>
		                    <span style="float: right;">| 조회수 ${myReview.RV_CNT}</span> 
		                    <span style="float: right;">추천수 ${myReview.RV_LIKE}&nbsp;&nbsp;</span><br>
                       		</a>
                       </div>
                    </div>
					</c:forEach>
					</c:when>
					</c:choose>
            	</div>
        </div>
    </div>  

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>
