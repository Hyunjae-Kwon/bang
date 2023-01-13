<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>

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
				<th scope="row">글번호</th>
				<td>${map.RC_NUM }
				<input type="hidden" id="RC_NUM" name="RC_NUM" value="${map.RC_NUM }"></td>
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
       
      <c:if test="${MEM_ID != map.RC_ID }">  <!-- 작성자가 아닐 경우에만 추천버튼 보이게 -->
		<input type = "button" class="btn btn-success btn-sm" onclick="return fn_recommendLike()" value="추천">
      </c:if>
       
      <c:if test="${MEM_ID eq map.RC_ID}">  <!--  작성자일때만 보이게 -->
       <button class="btn btn-success btn-sm" onClick="location.href='/bang/recommendModifyForm.tr?RC_NUM=${map.RC_NUM}'">수정</button>
       <button class="btn btn-success btn-sm" onClick="return deleteCheck()">삭제</button>
	  </c:if>
	 
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	

</body>
<script>
function deleteCheck() {
	var RC_NUM = document.getElementById('RC_NUM').value;
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="recommendDelete.tr?RC_NUM=" + RC_NUM;
	}
}
</script>

<script type="text/javascript">
function fn_recommendLike() {
	  
	  	var rc_num = "${map.RC_NUM}";
	  	var comSubmit = new ComSubmit();
	  	var CONFIRM = confirm("추천하시겠습니까?");
	  	if(CONFIRM == true) {
			comSubmit.setUrl("/bang/recommendLike.tr");
			comSubmit.addParam("RC_NUM", rc_num);
	      comSubmit.submit();
	      alert("추천되었습니다.");
	      
	      }
	  }
</script>

</html>