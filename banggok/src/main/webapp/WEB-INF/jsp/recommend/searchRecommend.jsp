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
                <h2>여행지 추천 검색 결과</h2>
                <p>여행지 추천 게시판 <b>'${searchKeyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 여행지 검색 결과 Starts Here #######################--->   
    <div>
		<form action="/bang/searchRecommend.tr" method="GET">
			<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
			<input type="text" id="searchKeyword" name="searchKeyword" value="${searchKeyword}" style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
		</form>
	</div> 
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