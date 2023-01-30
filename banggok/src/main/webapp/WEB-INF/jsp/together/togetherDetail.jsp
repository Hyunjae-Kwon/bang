
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
<style>
  table {
    width: 100%;
    border-top: 1px solid #CCCCCC;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #CCCCCC;
    padding: 10px;
  }
</style>
<body>

	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row" >
				<h2>동행</h2>
				<ul>
					<li><a href="togetherList.tr"><i class="fas fa-blog"></i>목록으로</a></li>
					<li><i class="fas fa-angle-double-right"></i>Together</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- ################# 게시물 Starts Here #######################--->
	<br>
		<div class="container"  align="center" >
			<table class="board_view" weight="1100" >
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">글번호</th>
						<td>${map.TG_NUM }
						<input type="hidden" id="TG_NUM" name="TG_NUM" value="${map.TG_NUM }"></td>
						
						<th scope="row">조회수</th>
						<td>${map.TG_CNT }</td>
					
						<th scope="row">작성자</th>
						<td>${map.TG_ID }</td>
						<th scope="row">작성시간</th>
						<td>${map.TG_REGDATE}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="7">${map.TG_TITLE }</td>
						
					</tr>
					<tr>
						<td colspan="8">${fn:replace(map.TG_CONTENT, replaceChar,"<br/>")  }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr>
	<c:if test="${MEM_ID == map.TG_ID}">
		<div align="center">
			<input type="button" value="수정" class="btn btn-outline-success"
				style="height: 55px;"
				onClick="location.href='togetherModifyForm.tr?TG_NUM=${map.TG_NUM}'">
			<input type="button" value="삭제" class="btn btn-outline-success"
				style="height: 55px;" onClick="return deletetogether()">
	</c:if>
	</div>


	<script>
		function deletetogether() {
			var TG_NUM = document.getElementById("TG_NUM").value;
			if (confirm("삭제하시겠습니까?") == true) {
				location.href = "togetherDelete.tr?TG_NUM=" + TG_NUM;
			}
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