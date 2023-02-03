<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				                    		<img src="${list.TR_IMAGE}" alt="썸네일 없음" style="width: 245px; height: 245px; object-fit: contain;">
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