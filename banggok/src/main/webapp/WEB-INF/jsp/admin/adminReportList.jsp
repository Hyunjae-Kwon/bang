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
                <h2>회원 신고 관리</h2>
                <ul>
                    <li> <a href="adminPage.tr"><i class="fas fa-user-alt"></i>관리자 페이지</a></li>
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-map-marked"></i> 회원 신고 목록</li>
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
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">신고 ID</th>
						<th scope="col">카테고리</th>
						<th scope="col">신고 내용</th>
						<th scope="col">신고 날짜</th>
						<th scope="col">신고자 ID</th>
						<th scope="col">신고글 분류</th>
						<th scope="col">게시글 삭제 유무</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(report) > 0}">
							<c:forEach items="${report}" var="list" varStatus="status">
								<tr class="items">
									<td align="center">${list.RP_NUM}</td>
									<td align="center"><input type="hidden" name="RP_RID" id="RP_RID" value="${list.RP_RID}">${list.RP_RID}</td>
									<td align="center">								
										<input type="hidden" name="RP_BTYPE" id="RP_BTYPE" value="${list.RP_BTYPE}">
										<input type="hidden" name="RP_RNUM" id="RP_RNUM" value="${list.RP_RNUM}">	  
										<c:if test="${list.RP_BTYPE eq 'T' }">여행 일정 공유</c:if>
										<c:if test="${list.RP_BTYPE eq 'W' }">동행</c:if>
										<c:if test="${list.RP_BTYPE eq 'R' }">여행 후기</c:if>
										<c:if test="${list.RP_BTYPE eq 'RC' }">여행지 추천</c:if>
									</td>
									<td><a href="adminReportDetail.tr?RP_NUM=${list.RP_NUM}">${list.RP_CONTENT}</a></td>
									<td align="center" ${list.RP_REGDATE}><fmt:formatDate value="${list.RP_REGDATE}" pattern="yyyy-MM-dd" /></td>
									<td align="center">${list.RP_ID}</td>
									<td align="center">									  
										<c:if test="${list.RP_TYPE eq 'B' }">게시글</c:if>
										<c:if test="${list.RP_TYPE eq 'C' }">댓글</c:if>
										<input type="hidden" name="RP_TYPE" id="RP_TYPE" value="${list.RP_TYPE}">
									</td>
									<td align="center">									  
										<c:if test="${list.RP_DELETE eq 'Y' }">삭제 처리 완료</c:if>
										<c:if test="${list.RP_DELETE eq 'N' }">
											<button type="button"class="btn btn-outline-success" style="padding:5px;" name="delBtn">해당 글 삭제</button> 
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div>
				<br>
				<form action="/bang/adminMemberList.tr" method="GET">
					<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
					<input type="text" id="searchKeyword" name="searchKeyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
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
		var RP_RNUM = $(".items").eq(index).find("#RP_RNUM").val();
		var RP_BTYPE = $(".items").eq(index).find("#RP_BTYPE").val();
		
		if (RP_BTYPE == 'T') {
			if(RP_TYPE == 'B'){
				if (confirm("해당 게시글을 삭제하시겠습니까?") == true) {
					location.href = "tripDelete.tr?TR_NUM=" + RP_RNUM;		
				}
			} else {
				if (confirm("해당 댓글을 삭제하시겠습니까?") == true) {
					location.href = "comDelete.tr?BC_BCID=" + RP_RNUM;		
				}
			}
		}
		
		if (RP_BTYPE == 'W') {
			if(RP_TYPE == 'B'){
				if (confirm("해당 게시글을 삭제하시겠습니까?") == true) {
					location.href = "togetherDelete.tr?TR_NUM=" + RP_RNUM;		
				}
			} else {
				if (confirm("해당 댓글을 삭제하시겠습니까?") == true) {
					location.href = "comDelete.tr?BC_BCID=" + RP_RNUM;		
				}
			}
		}
		
		if (RP_BTYPE == 'R') {
			if(RP_TYPE == 'B'){
				if (confirm("해당 게시글을 삭제하시겠습니까?") == true) {
					location.href = "reviewDelete.tr?TR_NUM=" + RP_RNUM;		
				}
			} else {
				if (confirm("해당 댓글을 삭제하시겠습니까?") == true) {
					location.href = "comDelete.tr?BC_BCID=" + RP_RNUM;		
				}
			}
		}
		
		if (RP_BTYPE == 'RC') {
			if (confirm("해당 댓글을 삭제하시겠습니까?") == true) {
				location.href = "comDelete.tr?BC_BCID=" + RP_RNUM;
			}
		}
	});  
	</script>
	<script type="text/javascript">
	function fn_search(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminMemberList.tr' />");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
    }
	</script>
    </body>
</html>
