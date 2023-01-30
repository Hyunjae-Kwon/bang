	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>"/>
</head>

<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>동행게시판</h2>
			</div>
		</div>
	</div>
	<!-- ################# 게시물 Starts Here #######################--->
	<br><br>
	<div class="board-list">
		<div class="container">		 
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
					<col width="*" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr align="center">
						<td scope="col" style="font-weight: bold;">글번호</td>
						<td scope="col">${map.TG_NUM }</td>
						<td scope="col" style="font-weight: bold;">조회수</td>
						<td scope="col">${map.TG_CNT }</td>
						<td scope="col" style="font-weight: bold;">작성일시</td>
						<td scope="col">${map.TG_REGDATE}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">제목</td>
						<td align="center" colspan="3">${map.TG_TITLE}</td>
						<td align="center" style="font-weight: bold;">작성자</td>
						<td align="center">${map.TG_ID}</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">내용</td>
						<td colspan="5" style="height: 300px;">${map.TG_CONTENT}</td>
					</tr>
				</tbody>
			</table>
		<br>
		</div>				 
	</div>
	<div align="center">
		<input type="button" value="수정" class="btn btn-outline-success" onClick="location.href='togetherModifyForm.tr?TG_NUM=${map.TG_NUM}'">
		<input type="button" value="목록" class="btn btn-outline-success" onClick="return fn_openList()">
	</div>
	<br>
</body>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
<script type="text/javascript">
	function fn_openList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/togetherList.tr' />");
		comSubmit.submit();
	}
</script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="resources/js/common.js"></script>
</html>