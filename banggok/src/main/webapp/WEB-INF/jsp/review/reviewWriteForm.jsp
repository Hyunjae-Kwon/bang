<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <h2>여행 후기 글쓰기</h2>
                <ul>
                    <li> <a href="reviewList.tr"><i class="fas fa-blog"></i>여행 후기</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Review</li>
                </ul>
            </div>
        </div>
    </div>
    <!--*************** Blog Starts Here ***************-->
    <br>
	<br>
	<form id="frm" name="frm" action="<c:url value='/reviewWrite.tr'/>" method="post" encType="multipart/form-data">
	<div class="board-list">
		<div class="container" style="margin-left: 250px;">
			<table class="board-table">
				<tbody>
					<tr>
						<td>썸네일 이미지 등록 : <input type="file" id="RV_IMAGE" name="RV_IMAGE"></td>
					</tr>
					<!-- 파일 이미지 출력  -->
					<tr>
						<td>
							<b><label style="color:slategray">상품 이미지 미리보기</label></b>
							<img src="resources/images/banggok_logo.png" width="100" border="0" id="preview-image">
							<script>
								// input file에 change 이벤트 부여
								const inputImage = document.getElementById("RV_IMAGE");
								inputImage.addEventListener("change", e=> {
									readImage(e.target)
								});
							</script>
						</td>
					</tr>
					<!-- 제목 입력 부분 -->
					<tr>
						<td>
							<input type="text" placeholder="제목을 입력하세요" id="RV_TITLE" name="RV_TITLE" class="form-control input-sm">
							<!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
						    <input type="hidden" id="RV_NUM" name="RV_NUM" value="${RV_NUM}"/>
						    <input type="hidden" id="RV_ID" name="RV_ID" value="${MEM_ID}"/>
						</td>
					</tr>
					<tr>
						<td>
							 <!-- 글 작성 폼 -->
   							 <textarea id="summernote" class="RV_CONTENT" name="RV_CONTENT"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<!-- 버튼 가운데 정렬 -->
						    <div style="text-align: center;">
						    <button class="btn btn-primary" onclick="return insertReview()">작성</button>
							<button class="btn btn-primary" onclick="location.href='/bang/reviewList.tr'">취소</button>
							</div>
							<br>
						</td>
					</tr>					 
				</tbody>
			</table>
		</div>
	</div>
	</form>

	<!-- 글 작성 자바스크립트 -->
	<script>
 	function insertReview(){
	    var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("/bang/reviewWrite.tr");
	    
		var RV_TITLE = document.getElementById("RV_TITLE").value;
		var RV_CONTENT = document.getElementById("summernote").value;
		var RV_IMAGE = document.getElementById("RV_IMAGE").value;
		
		if (!RV_TITLE) {
			alert("제목을 입력하세요.");
			$("#RV_TITLE").focus();		/* #은 Id */
			return false;
		}

		if (!RV_CONTENT) {
			alert("내용을 입력하세요.");
			$(".RV_CONTENT").focus();	/* .은 ClassName */
			return false;
		}
		
		if (!RV_IMAGE) {
			alert("썸네일 이미지를 등록하세요.");
			$("#RV_IMAGE").focus();		/* .은 ClassName */
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
						  					console.log(files);
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
			comSubmit.setUrl("<c:url value='/bang/review/reviewList.tr' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/bang/review/reviewWrite.tr' />");
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
	<script>
	/* 이미지 미리보기 스크립트 */
	function readImage(input) {
		// 인풋 태그에 파일이 있는 경우
		if(input.files && input.files[0]) {
			
			// FileReader 인스턴스 생성
			const reader = new FileReader();
			
			// 이미지가 로드가 된 경우
			reader.onload = e => {
				const previewImage = document.getElementById("preview-image");
				previewImage.src = e.target.result;
			};
			
			// reader가 이미지 읽도록 하기
			reader.readAsDataURL(input.files[0]);
		}	
	}
	</script>
    </body>
</html>