<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>" />
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
	<br>
	<br>
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
						<td scope="col">${map.TG_NUM}</td>
						<td scope="col" style="font-weight: bold;">조회수</td>
						<td scope="col">${map.TG_CNT}</td>
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
		<c:if test="${MEM_ID == map.TG_ID}">
			<input type="button" value="수정" class="btn btn-outline-success" onClick="location.href='togetherModifyForm.tr?TG_NUM=${map.TG_NUM}'">
			<input type="button" value="삭제" class="btn btn-outline-success" onClick="return deletetogether()">
		</c:if>
		<input type="button" value="신고" class="btn btn-outline-success" onClick="return togetherReport()">
		<input type="button" value="목록" class="btn btn-outline-success" onClick="return fn_openList()">
	</div>
	<br>
	<!-- 신고하기 -->
	<div class="report"></div>
	<hr />
	<!--  댓글  -->
	<div style="max-width: 100%; margin-left: 40px;">
		<h5>댓글</h5>
		<c:forEach var="comment" items="${comment}" varStatus="status">
			<div id="commentList">
				<span class="pric">${comment.BC_ID }|<fmt:formatDate value="${comment.BC_REGDATE}" pattern="yyyy-MM-dd" /></span>
				<p>${comment.BC_COMMENT }
					<input type="hidden" id="BC_BCID" name="BC_BCID" value="${comment.BC_BCID }">
					<input type="hidden" id="BC_NUM" name="BC_NUM" value="${comment.BC_NUM }">
				</p>
				<div style="font-size: 8pt; color: gray; padding-right: 10px; margin-bottom: 10px;">
					<c:if test="${MEM_ID eq comment.BC_ID}">
						<input type="button" onClick="comDelete(${comment.BC_BCID})" value="삭제하기">
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<form action="tgCommentWrite.tr?TG_NUM=${map.TG_NUM}" name="frm" id="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="BC_NUM" id="BC_NUM" value="${map.TG_NUM}">
		<input type="hidden" id="MEM_ID" name="MEM_ID" value="${MEM_ID}" />
		<div style="display: inline-block; width: 88%; margin-left: 20px;">
			<textarea name="BC_COMMENT" id="BC_COMMENT" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
		</div>
		<div style="display: inline-block; float: right; width: 10%;">
			<input type="button" value="댓글쓰기" onclick="fn_commentCheck()" class="btn btn-primary py-2 px-2">
		</div>
	</form>
	<!--  댓글 끝 -->
</body>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
function deletetogether() {
	var TG_NUM = document.getElementById("TG_NUM").value;
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "togetherDelete.tr?TG_NUM=" + TG_NUM;
	}
}
</script>
<script>
 <!-- 댓글 -->
 function fn_commentCheck() {
 	var frm = document.getElementById('frm');
 	var BC_NUM = document.getElementById('BC_NUM');
 	if (!$("#BC_COMMENT").val()) {
         alert("내용을 입력하세요.");
         $("#BC_COMMENT").focus();
         return false;
      }
   alert("댓글이 정상적으로 등록 되었습니다."); 
 	frm.submit();
 }
    </script>
<script>
	    /* 댓글 삭제하기 */
		function comDelete(num){
			console.log("aa");
			$.ajax({
				url: "/bang/comDelete.tr",
				type: "POST",
				data: {BC_BCID: num},
				success: function(){
					console.log("댓글 삭제 성공");
					location.reload();
				},
				error: function(){
					alert("에러");
				}
			});
		};
    </script>
<!-- 신고하기 -->
<script>
	function togetherReport(){
		
		var report = $(".report");
		console.log(report);
		
		var item = '<form action="reportBoardWrite.tr" name="frm" id="frm" method="post" enctype="multipart/form-data">' + 
						'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
							'<input type="hidden" name="RP_RID" value="${map.TG_ID}">' +
							'<input type="hidden" name="RP_BTYPE" value="T">' +
							'<input type="hidden" name="RP_RNUM" value="${map.TG_NUM}">' +
							'<input type="hidden" name="RP_TITLE" value="${map.TG_TITLE}">' +
							'<input type="hidden" name="RP_ID" value="${MEM_ID}">' +
							'<textarea name="RP_CONTENT" id="RP_CONTENT" class="form-control" placeholder="신고 내용을 입력해주세요."></textarea>' +
						'</div>' +
						'<div style="display: inline-block; float: right; width: 10%;">' +
							'<input type="button" value="신고하기" onclick="reportBoard()" class="btn btn-primary py-2 px-2">' +
						'</div>' +
					'</form>';
		report.append(item);
		
		return report;
	}
	
	function reportBoard() {
		var frm = document.getElementById('frm');
		var BC_NUM = document.getElementById('BC_NUM');
		
		if (!$("#RP_CONTENT").val()) {
	        alert("내용을 입력하세요.");
	        $("#RP_CONTENT").focus();
	        return false;
	     }
	  alert("신고 내용이 정상적으로 접수 되었습니다."); 
		frm.submit();
	}
    </script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="resources/js/script.js"></script>
<!-- <script src="resources/js/common.js"></script> -->
</html>