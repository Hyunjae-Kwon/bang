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
				                    			<img src="${list.RC_IMAGE}" alt="썸네일 없음" style="width: 245px; height: 245px; object-fit: contain;">
					                    	</a>
				                        </div>
				                        <h3>${list.RC_TITLE}
				                        	<c:if test="${list.COMCOUNT == null}">[0]</c:if>
											<c:if test="${list.COMCOUNT != null}">[${list.COMCOUNT}]</c:if>
				                        </h3>
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