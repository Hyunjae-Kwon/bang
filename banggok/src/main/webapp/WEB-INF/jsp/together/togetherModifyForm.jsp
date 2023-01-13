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

	<form id="frm">
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
							<td>${map.TG_NUM }
							<input type="hidden" id="TG_NUM" name="TG_NUM" value="${map.TG_NUM }"></td>
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
							<td colspan="5"><input type="text" id="TG_TITLE" name="TG_TITLE" class="form-control input-sm"
								value="${map.TG_TITLE }" /></td>
						</tr>
						<tr>
							<td colspan="6"><textarea rows="5" title="내용"
									id="TG_CONTENT" name="TG_CONTENT" class="form-control input-sm">${map.TG_CONTENT}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<hr>
	<div align="center">
		<input type="button" value="저장" class="btn btn-outline-success"
			style="height: 55px;" onClick="return updateForm()"> 
			<input type="button" value="삭제" class="btn btn-outline-success"
			style="height: 55px;" onClick="return deletetogether()"> 
			<input type="button" value="목록" class="btn btn-outline-success"
			style="height: 55px;" onClick="return fn_openList()">
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		function deletetogether() {
			var TG_NUM = document.getElementById("TG_NUM").value;
			if (confirm("삭제하시겠습니까?") == true) {
				location.href = "togetherDelete.tr?TG_NUM=" + TG_NUM;
			}
		}

		function fn_openList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherList.tr' />");
			comSubmit.submit();
		}

		function updateForm() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/togetherModify.tr' />");
			var TG_TITLE = document.getElementById("TG_TITLE").value;
			var TG_CONTENT = document.getElementById("TG_CONTENT").value;

			if (!$("#TG_TITLE").val()) {
				alert("제목을 입력하세요.");
				$("#TG_TITLE").focus();
				return false;
			}

			if (!$("#TG_CONTENT").val()) {
				alert("내용을 입력하세요.");
				$("#TG_CONTENT").focus();
				return false;
			}

			alert("게시글이 정상적으로 수정 되었습니다.");
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