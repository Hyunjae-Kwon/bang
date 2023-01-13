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
                <h2>여행 일정 검색 결과</h2>
                <p>여행 일정 공유 게시판에서 <b>'${keyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>  
    <!-- ################# 여행 일정 검색 결과 Starts Here #######################---> 
    <div>
		<form action="/bang/searchTrip.tr" method="GET">
			<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
			<input type="text" id="keyword" name="keyword" value="${keyword}" style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
		</form>
	</div>  
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
			                            <span class="pric">|</span>
			                            <span class="pric">
			                                ${list.TR_ID}
			                            </span>
			                        </div>
			                        <div class="detail row no-margin">
			                            <h4>${list.TR_TITLE}</h4>
			                            <p>${list.TR_CONTENT}</p>
			                        </div>
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