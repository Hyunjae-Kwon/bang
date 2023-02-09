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
                <h2>여행 후기 수정하기</h2>
                <ul>
                    <li> <a href="reviewList.tr"><i class="fas fa-blog"></i>여행 후기</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Review</li>
                </ul>
            </div>
        </div>
    </div>
    <!--*************** Blog Starts Here ***************-->
	<br>
	<form id="frm" name="frm" action="<c:url value='/reviewModify.tr'/>" method="post" encType="multipart/form-data">
	<div class="board-list">
		<div class="container" style="margin-left: 250px;">
			<table class="board-table">
				<tbody>
					<tr>
						<td>
							<label>썸네일 이미지 : </label>
							<img src="${review.RV_IMAGE}" width="100" border="0">
						</td>
					</tr>
					<tr>
						<td>썸네일 이미지 수정 : <input type="file" id="RV_IMAGE" name="RV_IMAGE">
							<input type="hidden" id="basicImage" name="IMAGE" value="${review.RV_IMAGE}">
						</td>
					</tr>
					<!-- 파일 이미지 출력  -->
					<tr>
						<td>
							<label>썸네일 이미지 미리보기 : </label>
							<img src="resources/images/banggok_logo.png" width="100" border="0" id="preview-image">
							<script>
								// input file에 change 이벤트 부여
								const inputImage = document.getElementById("RV_IMAGE");
								const image = document.getElementById("basicImage");
								inputImage.addEventListener("change", e=> {
									readImage(e.target)
									image.remove();
								});
							</script>
						</td>
					</tr>
					<!-- 제목 입력 부분 -->
					<tr>
						<td>
							<input type="text" placeholder="제목을 입력하세요" id="RV_TITLE" name="RV_TITLE" class="form-control input-sm" value="${review.RV_TITLE}">
							<!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
						    <input type="hidden" id="RV_NUM" name="RV_NUM" value="${review.RV_NUM}"/>
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
						    	<br>
							    <button class="btn btn-outline-success" onclick="return reviewUpdate()">수정</button>
								<button class="btn btn-outline-success" onclick="location.href='/bang/reviewList.tr'">취소</button>
							</div>
							<br>
						</td>
					</tr>					 
				</tbody>
			</table>
		</div>
	</div>
	</form>
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
			
			/* summernote에 글 추가할 수 있는 함수 */
			$("#summernote").summernote('code',  '${review.RV_CONTENT}');
		});
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
	<!-- 글 수정 자바스크립트 -->
	<script>
	function reviewUpdate(){
		var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("/bang/reviewModify.tr");
		var BD_TITLE = document.getElementById("RV_TITLE").value;
		var BD_CONTENT = document.getElementById("summernote").value;
		var RV_IMAGE = document.getElementById("RV_IMAGE").value;
	
		if (!$("#RV_TITLE").val()) {
			alert("제목을 입력하세요.");
			$("#RV_TITLE").focus();
			return false;
		}
		if (!$("#summernote").val()) {
			alert("내용을 입력하세요.");
			$("#summernote").focus();
			return false;
		}
		if (!RV_IMAGE) {
			if (confirm("기존 등록된 이미지를 썸네일로 사용하시겠습니까?") == true) {
				return true;
			} else {
				alert("썸네일 이미지를 등록하세요.");
				$("#RV_IMAGE").focus();
				return false;
			}
		}
		
		alert("여행후기가 정상적으로 수정 되었습니다.");
		comSubmit.submit();
	}
	</script>
    </body>
</html>
