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
				<h2>동행게시판 글쓰기</h2>
			</div>
		</div>
	</div>
	<!-- ################# 게시물 Starts Here #######################--->
	<form id="frm" name="frm"
		action="<c:url value='/bang/togetherWrite.tr'/>" method="post">
		<div class="row contact-rooo no-margin">
			<div class="container">



				<div align="center" style="padding: 50px" class="col-sm-7">
					<input type="hidden" id="TG_ID" name="TG_ID" value="${MEM_ID}" />

					<div class="row cont-row">
						<div class="col-sm-3">
							<label>제목</label><span>:</span>
						</div>
						<div class="col-sm-8">
							<input type="text" id="TG_TITLE" name="TG_TITLE"
								class="form-control input-sm">
						</div>
					</div>
					<div class="row cont-row">
						<div class="col-sm-3">
							<label>내용 </label><span>:</span>
						</div>
						<div class="col-sm-8">
							<textarea rows="5" title="내용" id="TG_CONTENT" name="TG_CONTENT"
								class="form-control input-sm"></textarea>

						</div>

					</div>

				</div>

			</div>
		</div>
	</form>
	<div align="center">

		<input type="button" value="작성" class="btn btn-outline-success"
			style="height: 55px;" onClick="return fn_insertBoard()"> <input
			type="button" value="목록" class="btn btn-outline-success"
			style="height: 55px;" onClick="return fn_openList()">
	</div>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		function fn_insertBoard() {

			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("/bang/togetherWrite.tr");
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

			alert("게시글이 정상적으로 등록 되었습니다.");
			comSubmit.submit();

		}

		function fn_openList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherList.tr' />");
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