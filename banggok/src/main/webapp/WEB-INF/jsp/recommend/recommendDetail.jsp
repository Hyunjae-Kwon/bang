<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>여행지 추천</h2>
				<ul>
					<li><a href="recommendWriteForm.tr"><i class="fas fa-blog"></i>글쓰기</a></li>
					<li><i class="fas fa-angle-double-right"></i> Gallery</li>
				</ul>
			</div>
		</div>
	</div>
	<!--  ************************* 관광지 추천 Gallery Starts Here ************************** -->


	<table class="board_view">
		<colgroup>
			<col width="20%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="20%"/>
		</colgroup>
		
		<tbody>
			<tr>
			<th><h4>${map.RC_TITLE }</h4></th> <!-- 제목 -->
			</tr>
			<tr>
				<td>글번호|${map.RC_NUM }
				<input type="hidden" id="RC_NUM" name="RC_NUM" value="${map.RC_NUM }">
				</td>							
				<td>조회수|${map.RC_CNT }</td>				
				<td>추천수|${map.RC_LIKE }</td>
				<td>작성자|${map.RC_ID }</td>				
			</tr>	
			<tr>
				<th>내용</th>
				<td colspan="4">${map.RC_CONTENT }</td>
			</tr>
		</tbody>
		
	</table>
	<hr>
	
	<!--  댓글  -->
	<div class="review container-fluid">
         <div class="container">
              <div class="session-title">
                <h5>댓글</h5>
               </div>
                
		   <c:forEach var="comment" items="${rcComment}" varStatus="status">
		    <div class="col-sm-8">
		     <div class="review-col">
		     <div class="review-detail">
							
	          <h5>${comment.BC_ID }|${comment.BC_REGDATE}</h5> 
	          <p>${comment.BC_COMMENT }
	        <input type="hidden" id="BC_BCID" name="BC_BCID" value="${comment.BC_BCID }">
			<input type="hidden" id="BC_NUM" name="BC_NUM" value="${comment.BC_NUM }">
				</p>
				 <c:if test="${MEM_ID eq comment.BC_ID}">
				<p><a onClick="return deleteComment()" class="reply">삭제</a>
				</p></c:if>
	         	</div>
	         	</div>
	         	</div>
	         	</c:forEach></div></div>
 							
													 	
	<form action="rcCommentWrite.tr?RC_NUM=${map.RC_NUM}" name="frm" id="frm" method="post" enctype="multipart/form-data">
   
   <input type="hidden" name="BC_NUM" id="BC_NUM" value="${map.RC_NUM}">
   <input type="hidden" id="MEM_ID" name="MEM_ID" value="${MEM_ID}"/>
   <div style="display:inline-block; width:88%;">
   <textarea name="BC_COMMENT" id="BC_COMMENT" class="form-control" width="100%" placeholder="댓글을 입력해주세요."></textarea>
   </div>
   <div style="display:inline-block; float:right; width:10%;">
	<input type="button" value="댓글쓰기" onclick="fn_commentCheck()" class="btn btn-primary py-2 px-2" > 
   
   </div>
    </form> 
    
	
	<!--  댓글 끝 -->
	
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
<!-- 글삭제-->
function deleteCheck() {
	var RC_NUM = document.getElementById('RC_NUM').value;
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="recommendDelete.tr?RC_NUM=" + RC_NUM;
	}
}
<!-- 댓글삭제-->
function deleteComment() {
	var BC_BCID = document.getElementById('BC_BCID').value;
	var RC_NUM = document.getElementById('RC_NUM').value;
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="rcCommentDelete.tr?BC_BCID=" + BC_BCID +"&RC_NUM="+ RC_NUM;
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

</html>