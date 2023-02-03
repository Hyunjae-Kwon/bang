<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
	<br>
	<form id="frm" name="frm" action="<c:url value='/recommendWrite.tr'/>" method="post" encType="multipart/form-data">
	<div class="board-list">
		<div class="container" style="margin-left: 250px;">
			<table class="board-table">
				<tbody>
					<tr>
						<td>썸네일 이미지 등록 : <input type="file" id="RC_IMAGE" name="RC_IMAGE" value=""></td>
					</tr>
					<!-- 파일 이미지 출력  -->
					<tr>
						<td>
							<label>썸네일 이미지 미리보기 : </label>
							<img src="resources/images/banggok_logo.png" width="100" border="0" id="preview-image">
							<script>
								// input file에 change 이벤트 부여
								const inputImage = document.getElementById("RC_IMAGE");
								inputImage.addEventListener("change", e=> {
									readImage(e.target)
								});
							</script>
						</td>
					</tr>
					<!-- 제목 입력 부분 -->
					<tr>
						<td>
							<input type="text" placeholder="제목을 입력하세요" id="RC_TITLE" name="RC_TITLE" class="form-control input-sm">
							<!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
						    <input type="hidden" id="RC_NUM" name="RC_NUM" value="${RC_NUM}"/> 
    						<input type="hidden" id="RC_ID" name="RC_ID" value="${MEM_ID}"/>
						</td>
					</tr>
					<tr>
						<td>
							 <!-- 글 작성 폼 -->
   							 <textarea id="summernote" class="RC_CONTENT" name="RC_CONTENT"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<!-- 버튼 가운데 정렬 -->
						    <div style="text-align: center;">
						    	<br>
							    <button class="btn btn-outline-success" onclick="return insertRecommend()">작성</button>
								<button class="btn btn-outline-success" onclick="location.href='/bang/recommendList.tr'">취소</button>
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
 	function insertRecommend(){
	    var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("/bang/recommendWrite.tr");
	    
		var RC_TITLE = document.getElementById("RC_TITLE").value;
		var RC_CONTENT = document.getElementById("summernote").value;
		var RC_IMAGE = document.getElementById("RC_IMAGE").value;
		
		if (!RC_TITLE) {
			alert("제목을 입력하세요.");
			$("#RV_TITLE").focus();		/* #은 Id */
			return false;
		}

		if (!RC_CONTENT) {
			alert("내용을 입력하세요.");
			$(".RV_CONTENT").focus();	/* .은 ClassName */
			return false;
		}
		
		if (!RC_IMAGE) {
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
