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
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>여행 후기 검색 결과</h2>
                <p>여행 후기 게시판에서 <b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 여행 후기 검색 결과 Starts Here #######################--->   
    <div>
		<form action="/bang/searchReview.tr" method="GET">
			<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
			<input type="text" id="keyword" name="keyword" value="${keyword}" style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
		</form>
	</div>
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
						<tr>
							<td colspan="5">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </div> 
    </body>
</html>