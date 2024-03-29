<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>"/>
<body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>여행지 추천 게시판 관리</h2>
                <ul>
                    <li><a href="adminPage.tr"><i class="fas fa-user-alt"></i>관리자 페이지</a></li>
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-map-marked"></i> 여행지 추천 게시판</li>
                    <li><a href="recommendWriteForm.tr"><i class="fas fa-angle-double-right"></i><i class="fa-solid fa-pen-to-square"></i> 글쓰기</a></li>
                </ul>
            </div>
        </div>
    </div>
     <!--*************** Blog Starts Here ***************-->
      <br><br>
	<div class="board-list">
		<div class="container">		 
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
					<col width="15%" />
					<col width="*" />
					<col width="20%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr align="center">
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">추천수</th>
						<th scope="col">작성일</th>
						<th scope="col">수정 / 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${recommend[0].RC_NUM != null}">
							<c:forEach items="${recommend}" var="list" varStatus="status">
								<tr class="items">
									<td align="center">${list.RC_NUM}
									<input type="hidden" id="RC_NUM" name="RC_NUM" value="${list.RC_NUM}"></td>
									<td><a href="recommendDetail.tr?TR_NUM=${list.RC_NUM}">${list.RC_TITLE}</a>
									</td>
									<td align="center">${list.RC_ID}
									<td align="center">${list.RC_CNT}</td>
									<td align="center">${list.RC_LIKE}</td>
									<td align="center" ${list.RC_REGDATE}><fmt:formatDate value="${list.RC_REGDATE}" pattern="yyyy-MM-dd" /></td>
									<td align="center">
									  <button type="button"class="btn btn-outline-success" style="padding:5px;" onClick="location.href='/bang/recommendModifyForm.tr?RC_NUM=${list.RC_NUM}'">수정</button> 
									  <button type="button"class="btn btn-outline-success" style="padding:5px;" onClick="deleteRecommend()">삭제</button>								  
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div>
				<br>
				<form action="/bang/searchRecommend.tr" method="GET">
					<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
					<input type="text" id="keyword" name="keyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
				</form>
		    </div>
			<!-- 페이지 -->
		  	<div align="center">	    
				<c:if test="${not empty paginationInfo}">
				  <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
				</c:if>
				  <input type="hidden" id="currentPageNo" name="currentPageNo"/>	
				<%@ include file="/WEB-INF/include/include-body.jspf" %>
			</div>
			<br><br>
		</div>				 
	</div>
	<script>
	$(document).on("click","[name=delBtn]", function(){
		
		var index = $("[name=delBtn]").index(this);
		var RC_NUM = $(".items").eq(index).find("#RC_NUM").val();
		
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "recommendDelete.tr?RC_NUM=" + RC_NUM;		
		}
		
	});  
	</script>
	<script type="text/javascript">
	function fn_search(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminRecommendList.tr' />");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
    }
	</script>
    </body>
</html>
