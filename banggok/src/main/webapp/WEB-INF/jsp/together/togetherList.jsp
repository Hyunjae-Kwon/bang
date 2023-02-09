<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>" />
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>동행</h2>
				<ul>
					<li><a href="togetherWriteForm.tr"><i class="fas fa-blog"></i>글쓰기</a></li>
					<li><i class="fas fa-angle-double-right"></i>Together</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- ################# 게시물 Starts Here #######################--->
	<br>
	<br>
	<div class="board-list">
		<div class="container" align="center">
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr align="center">
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list[0].TG_NUM != null}">
							<c:forEach items="${list}" var="list">
								<tr>
									<td align="center">${list.TG_NUM}</td>
									<td>
										<a href="togetherDetail.tr?TG_NUM=${list.TG_NUM}">${list.TG_TITLE}</a>
										<c:if test="${list.COMCOUNT == null}">[0]</c:if>
										<c:if test="${list.COMCOUNT != null}">[${list.COMCOUNT}]</c:if>
									</td>
									<td align="center">${list.TG_ID}
									<td align="center">${list.TG_CNT}</td>
									<td align="center" ${list.TG_REGDATE}>
										<fmt:formatDate value="${list.TG_REGDATE}" pattern="yyyy-MM-dd" />
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<br>
			<c:if test="${not empty paginationInfo}">
				<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_search" />
			</c:if>
			<input type="hidden" id="currentPageNo" name="currentPageNo" />
		</div>
		<div>
			<form action="/bang/searchTogether.tr" method="GET">
				<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;">
					<i class="fas fa-search" style="margin: 0px;"></i>
				</button>
				<input type="text" id="searchKeyword" name="searchKeyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius: 30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
			</form>
		</div>
		<br><br><br>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		/* function fn_openWriteForm() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherWriteForm.tr' />");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherDetail.tr' />");
			comSubmit.addParam("TG_NUM", obj.parent().find("#TG_NUM").val());
			comSubmit.submit();
		} */
		
		function fn_search(pageNo){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherList.tr' />");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
	</script>
	<!-- <script src="resources/js/common.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>

	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
	<script src="resources/js/script.js"></script> -->
</body>
</html>