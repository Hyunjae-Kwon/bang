<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
</head>
<body>

<!-- title -->
<div align="center">
   <h3><b>글 작성</b></h3> 
</div>
<div style="height: 50px;"></div>

<!-- body -->
<form id="frm" name="frm" enctype="multipart/form-data" action="<c:url value='/bang/recommendWrite.tr'/>" method="post">
<div class="container" id="frm" style="width:60%;">
   <div style="margin-bottom:15px;">
   

      <!-- 제목 -->
   
      <div style="display:inline-block; width:80%; float:right;">
         <input type="text" id="RC_TITLE" name="RC_TITLE" class="form-control" placeholder="제목을 입력해주세요." style="width:100%;">
    <input type="hidden" id="RC_NUM" name="RC_NUM" value="${RC_NUM}"/> 
     
         <input type="hidden" id="RC_ID" name="RC_ID" value="${RC_ID}"/>
      </div>
    
   </div>
   <!-- 내용 -->
   <div style="margin-bottom:15px;">
      <textarea class="form-control" id="BC_CONTENT" name="BC_CONTENT" placeholder="내용을 입력해주세요." rows="12"></textarea> 
   </div>
  
  <!-- 첨부파일 -->
<!--     <div class="custom-file" style="margin-bottom:15px;">
     <input type="file" class="custom-file-input" id="customFile">
     <label class="custom-file-label" for="customFile">첨부 파일</label>
     <input type="file" name="file">
   </div> -->
   <!-- 버튼 -->
   
    <div align="center" style="height:100px;"> 
      <input type="button" class="btn btn-primary py-2 px-2" onClick="return fn_insertBoard()" value="글 작성"></a>
      <input type="button" class="btn btn-primary py-2 px-2" value="목록으로" onclick="location.href='/bang/allRecommendList.tr'">
   </div>
</div>

</form>

<script type="text/javascript">

/* CKEDITOR.replace('BD_CONTENT',{
	   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.omc"});
   
   $("#insertBoard").on("click", function(e){
      e.preventDefault();
      fn_insertBoard();
   });

   $("#write").on("click", function(e){ //작성하기 버튼
       e.preventDefault();
       fn_insertBoard();
    });
 */
function fn_insertBoard(){

   var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("/bang/recommendWrite.tr");
	var RC_TITLE = document.getElementById("RC_TITLE").value;
	var RC_CONTENT = document.getElementById("RC_CONTENT").value;

		if (!$("#RC_TITLE").val()) {
			alert("제목을 입력하세요.");
			$("#RC_TITLE").focus();
			return false;
		}

		if (!$("#RC_CONTENT").val()) {
			alert("내용을 입력하세요.");
			$("#RC_CONTENT").focus();
			return false;
		}

		alert("게시글이 정상적으로 등록 되었습니다.");
		comSubmit.submit();

	}
</script>

</body>
</html>