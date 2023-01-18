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
                <h2>동행 구하기 검색 결과</h2>
                <p>동행 구하기 게시판에서 <b>'${searchKeyword}'</b> 로 검색한 결과입니다.</p>
            </div>
        </div>
    </div>
    <!-- ################# 동행 구하기 검색 결과 Starts Here #######################---> 
    <div>
		<form action="/bang/searchTogether.tr" method="GET">
			<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
			<input type="text" id="searchKeyword" name="searchKeyword" value="${searchKeyword}" style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
		</form>
	</div>  
    <div class="review container-fluid">
         <div class="container">
            <div class="row review-row">
            	<c:choose>
					<c:when test="${fn:length(together) > 0}">
						<c:forEach var="list" items="${together}">
			                <div class="col-md-6" style="max-width: 25%">
			                    <div class="review-col">
			                        <div class="profil">
			                        	<!-- 동행 구하기는 이미지 없음 -->
			                        </div>
			                        <div class="review-detail" style="max-width: 250px;">
			                            <a href="/bang/togetherDetail.tr?TG_NUM=${list.TG_NUM}">
			                            	<h4>${list.TG_TITLE}</h4>
			                            </a>
			                            <span style="float: right;">조회수 | ${list.TG_CNT}</span>
			                            <span style="float: right;">추천수 | ${list.TG_LIKE}&nbsp;&nbsp;</span>
			                            <p>${list.TG_CONTENT}</p>
			                            <h6>${list.TG_ID}</h6>
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