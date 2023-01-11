<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<!-- .. -->
	<table class="board_view">
	<h3>게시글 상세</h3>
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		
		<br/><br/><br/><br/>
		<tbody>
		
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.RC_NUM }</td>
				<th scope="row">조회수</th>
				<td>${map.RC_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.RC_ID }</td>
				<th scope="row">추천수</th>
				<td>${map.RC_LIKE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.RC_TITLE }</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="4">${map.RC_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	<div class="col-sm-8">
       <button class="btn btn-success btn-sm" onClick="location.href='/bang/allRecommendList.tr'">목록</button>
    </div>
	<a href="#this" class="btn" id="update">수정하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){		
			$("#update").on("click", function(e){
				e.preventDefault();
				fn_openBoardUpdate();
			});
		});
		
		
		function fn_openBoardUpdate(){
			var RC_ID = "${map.RC_ID}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/bang/recommendUpdate.tr' />");
			comSubmit.addParam("RC_ID", RC_ID);
			comSubmit.submit();
		}  
	</script>
</body>
</html>