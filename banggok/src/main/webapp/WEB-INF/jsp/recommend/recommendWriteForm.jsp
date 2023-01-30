<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>방방곡곡</title>
   <!-- header.jspf 를 빼서 아래 스크립트, css 필요 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

</head>

    <body>
    
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>관광지 추천 글쓰기</h2>
                <ul>
                    <li> <a href="recommendList.tr"><i class="fas fa-blog"></i>관리자 관광지 추천</a></li>
                    <li><i class="fas fa-angle-double-right"></i>추천글</li>
                </ul>
            </div>
        </div>
    </div>
    
     <!--*************** Blog Starts Here ***************-->
        
    <!-- 폼 -->
    <form id="insertRecommend" name="insertRecommend" enctype="multipart/form-data" action="<c:url value='/recommendWrite.tr'/>" method="post">
                     
	<!-- 제목 입력 부분 -->
    <input type="text" placeholder="제목을 입력하세요" id="RC_TITLE" name="RC_TITLE" class="form-control input-sm">
   <!--  추가 --> 
    <input type="hidden" id="RC_NUM" name="RC_NUM" value="${RC_NUM}"/> 
    <input type="hidden" id="RC_ID" name="RC_ID" value="${MEM_ID}"/>
    <input type="hidden" id="RC_IMAGE" name="RC_IMAGE" value="${RC_IMAGE }" />   
 
    <!-- 글 작성 폼 -->
   <textarea id="summernote" class="RC_CONTENT" name="RC_CONTENT"></textarea>
    
    <!-- 버튼 가운데 정렬 -->
    <div style="text-align: center;">
    <button id="frm" class="btn btn-primary" onclick="insertRecommend()" type="submit">작성</button>
	<button id="close" class="btn btn-primary" onclick="location.href='/bang/recommendList.tr'" type="button">취소</button>
	</div>
	
	</form>

	<!-- 글 작성 자바스크립트 -->
	<script>
	function fn_insertRecommend(){

		    var comSubmit = new ComSubmit("frm");
		      comSubmit.setUrl("/bang/recommendWrite.tr");
			var RC_TITLE = document.getElementById("RC_TITLE").value;
			var RC_CONTENT = document.getElementByClassName("RC_CONTENT").value;

				if (!$("#RC_TITLE").val()) {
					alert("제목을 입력하세요.");
					$("#RC_TITLE").focus();
					return false;
				}

				if (!$(".RC_CONTENT").val()) {
					alert("내용을 입력하세요.");
					$(".RC_CONTENT").focus();
					return false;
				}

				alert("게시글이 정상적으로 등록 되었습니다.");
				comSubmit.submit();

			}
		</script>
<!-- summernote 스크립트 -->
	<script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			$('#summernote').summernote({
				  height: 300,				// set editor height
				  minHeight: null,			// set minimum height of editor
				  maxHeight: null,			// set maximum height of editor
				  focus: true,				// set focus to editable area after initializing summernote
				  lang: 'ko-KR',			// default: 'en-US'
				  callbacks: {
					  onImageUpload: function(files){
										  sendFile(files[0]);
									  }
				  }
				});
			
			function sendFile(file){
				data = new FormData();
				data.append("file", file);
				$.ajax({
					url:			'/bang/GetTempFileUrl.tr',
					data:			data,
					cache:			false,
					type:			"POST",
					contentType:	false,
					processData:	false,
					success:		function(url){
						console.log(url);
										$('#summernote').summernote('insertImage', url);
									}
				});
			}
			
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/bang/recommend/recommendList.tr' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/bang/recommend/recommendWrite.tr' />");
			comSubmit.submit();
		}
		
		function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
	</script>

  <!--  ************************* Footer Start Here ************************** -->

    
   </body>

</html>
