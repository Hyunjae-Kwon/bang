<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
    <body>
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
				                            <span class="pric">
				                                ${list.TR_ID}
				                            </span>
				                        </div>
				                        <div class="detail row no-margin">
				                            <h4>${list.TR_TITLE}</h4>
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
    </body>
</html>