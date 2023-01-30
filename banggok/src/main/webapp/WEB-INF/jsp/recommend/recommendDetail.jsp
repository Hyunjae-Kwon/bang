<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<!--  ************************관광지 추천 게시판 글제목/작성자************************** -->
	<div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
            	<p>작성자 | ${map.RC_ID }</p>
                <h2>${map.RC_TITLE }</h2>
            </div>
        </div>
    </div>
	<!--  *************************관광지추천 게시판 내용 시작 ************************** -->
	<hr/>
<div class="container" align = "center" >
	<table class="board_view" width="1000">
		<colgroup>
			<col width="35%"/>
			<col width="35%"/>
			<col width="35%"/>
		</colgroup>
				
			<tr>														
				<td>조회수|${map.RC_CNT }</td>				
				<td>추천수|${map.RC_LIKE }
				<input type="hidden" id="RC_NUM" name="RC_NUM" value="${map.RC_NUM }"></td>	
				<td>작성일|
				<fmt:formatDate value="${map.RC_REGDATE }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
		</div>
		<hr/>	
			<div style="max-width: 100%; height:200px; margin-left:20px;">
				${map.RC_CONTENT }
			</div>
		<hr/>
	
	<!--  댓글  -->
	<div style="max-width: 100%; margin-left: 40px;">
                <h5>댓글</h5>                              
		   <c:forEach var="comment" items="${rcComment}" varStatus="status">
		    <div id="commentList">
							
	          <span class="pric">${comment.BC_ID }|<fmt:formatDate value="${comment.BC_REGDATE}" pattern="yyyy-MM-dd"/></span> 
	        	  <p>${comment.BC_COMMENT }
	        		<input type="hidden" id="BC_BCID" name="BC_BCID" value="${comment.BC_BCID }">
					<input type="hidden" id="BC_NUM" name="BC_NUM" value="${comment.BC_NUM }">
	   			  </p>
	   			<div style="font-size:8pt; color:gray; padding-right:10px; margin-bottom:10px;" > 
				 <c:if test="${MEM_ID eq comment.BC_ID}">
					<input type="button" onClick="return deleteComment()" value="삭제하기">
				 </c:if>
				</div>
	         </div>	         
	        </c:forEach>
 	</div>				
													 	
	<form action="rcCommentWrite.tr?RC_NUM=${map.RC_NUM}" name="frm" id="frm" method="post" enctype="multipart/form-data">
   
   <input type="hidden" name="BC_NUM" id="BC_NUM" value="${map.RC_NUM}">
   <input type="hidden" id="MEM_ID" name="MEM_ID" value="${MEM_ID}"/>
   <div style="display:inline-block; width:88%; margin-left:20px;">
  	 <textarea name="BC_COMMENT" id="BC_COMMENT" class="form-control"  placeholder="댓글을 입력해주세요."></textarea>
   </div>
   <div style="display:inline-block; float:right; width:10%;">
		<input type="button" value="댓글쓰기" onclick="fn_commentCheck()" class="btn btn-primary py-2 px-2" > 
   </div>
    </form> 
    
	
	<!--  댓글 끝 -->
	
	<div style="margin-top:10px; margin-bottom:20px;" align="center">
       <button class="btn btn-success btn-sm" onClick="location.href='/bang/recommendList.tr'">목록</button>
       
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