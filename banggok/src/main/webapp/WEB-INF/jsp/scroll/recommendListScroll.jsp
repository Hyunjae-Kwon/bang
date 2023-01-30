<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
    <body>
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
    </body>
</html>