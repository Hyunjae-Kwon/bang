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
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>동행게시판</h2>
			</div>
		</div>
	</div>
	<!-- ################# 게시물 Starts Here #######################--->
	<div class="popular-pack  container-fluid">
		<div class="container">
			<table style="border: 1px solid #ccc" width="100%">
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
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="list">
								<tr>
									<td align="center">${list.TG_NUM }</td>
									<td><a href="togetherDetail.tr?TG_NUM=${list.TG_NUM}">${list.TG_TITLE}</a>
									</td>

									<td align="center">${list.TG_ID }
									<td align="center">${list.TG_CNT }</td>
									<td align="center" ${list.TG_REGDATE }><fmt:formatDate
											value="${list.TG_REGDATE}" pattern="yyyy-MM-dd" /></td>
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

		</div>
	</div>
	<script type="text/javascript">

		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/bang/togetherWriteForm.tr' />");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/bang/togetherDetail.tr' />");
			comSubmit.addParam("TG_NUM", obj.parent().find("#TG_NUM").val());
			comSubmit.submit();
		}
	</script>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script
		src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
	<script src="resources/js/common.js" charset="utf-8"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
	<script src="resources/js/script.js"></script>
</body>

</html>