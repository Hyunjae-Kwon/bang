<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
	    <!--*************** 여행 후기 Starts Here ***************-->
	    <div>
			<form action="/bang/searchReview.tr" method="GET">
				<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
				<input type="text" id="searchKeyword" name="searchKeyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
			</form>
		</div>
	    <div class="container-fluid blog">
	        <div class="container">
                <div class="blog-row row">
					<c:forEach var="review" items="${reviewList}" varStatus="status">
	                    <div class="col-lg-4 col-md-6 col-sm-6">
	                       <div class="blog-col">
	                       		<a href="/bang/reviewDetail.tr?RV_NUM=${review.RV_NUM}">
	                            <img src="resources/images/review/${review.RV_IMAGE}.jpg" alt="" ></a>
	                            <span>${review.RV_REGDATE }</span>
	                            <h4><a href="/bang/reviewDetail.tr?RV_NUM=${review.RV_NUM}">${review.RV_TITLE}</h4>
	                            <p>${review.RV_CONTENT}</p>
	                       </div>
	                    </div>
					</c:forEach>
            	</div>
	        </div>
	    </div>  
    </body>
</html>
