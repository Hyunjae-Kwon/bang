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
	<div align="center" class="row contact-rooo no-margin">
		<div class="container">
			<table class="text-part col-md-6">
				<colgroup>
					<col width="10%" />
					<col width="25%" />
					<col width="10%" />
					<col width="25%" />
					<col width="10%" />
					<col width="25%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">글번호</th>
						<td>${map.TG_NUM }</td>
						<th scope="row">조회수</th>
						<td>${map.TG_CNT }</td>
						<th scope="row">추천수</th>
						<td>${map.TG_LIKE }</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td colspan="2">${map.TG_ID }</td>
						<th scope="row">작성시간</th>
						<td colspan="2">${map.TG_REGDATE}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="5">${map.TG_TITLE }</td>
					</tr>
					<tr>
						<td colspan="6">${fn:replace(map.TG_CONTENT, replaceChar,"<br/>")  }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr>
	<div align="center">
		<input type="button" value="수정" class="btn btn-outline-success"
			style="height: 55px;"
			onClick="location.href='togetherModifyForm.tr?TG_NUM=${map.TG_NUM}'">
		<input type="button" value="목록" class="btn btn-outline-success"
			style="height: 55px;" onClick="return fn_openList()">
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		function fn_openList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherList.tr' />");
			comSubmit.submit();
		}
	</script>

</body>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="resources/js/script.js"></script>
<script src="resources/js/common.js"></script>
</html>