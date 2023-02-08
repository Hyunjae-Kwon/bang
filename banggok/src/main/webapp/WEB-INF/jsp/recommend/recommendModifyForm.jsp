<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- summernote에 필요한 스크립트와 링크 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!--  내가 넣은거..  -->
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>관광지 추천 수정하기</h2>
                <ul>
                    <li> <a href="recommendList.tr"><i class="fas fa-blog"></i>관리자 관광지 추천</a></li>
                    <li><i class="fas fa-angle-double-right"></i>추천글</li>
                </ul>
            </div>
        </div>
    </div>
    <!--*************** Blog Starts Here ***************-->
	<br>
	<form id="frm" name="frm" action="<c:url value='/recommendModify.tr'/>" method="post" encType="multipart/form-data">
	<div class="board-list">
		<div class="container" style="margin-left: 250px;">
			<table class="board-table">
				<tbody>
					<tr>
						<td>
							<label>썸네일 이미지 : </label>
							<img src="${map.RC_IMAGE}" width="100" border="0" id="preview-image">
						</td>
					</tr>
					<tr>
						<td>썸네일 이미지 수정 : <input type="file" id="RC_IMAGE" name="RC_IMAGE">
							<input type="hidden" id="basicImage" name="IMAGE" value="${map.RC_IMAGE}">
						</td>
					</tr>
					<!-- 파일 이미지 출력  -->
					<tr>
						<td>
							<label>썸네일 이미지 미리보기 : </label>
							<img src="resources/images/banggok_logo.png" width="100" border="0" id="preview-image">
							<script>
								// input file에 change 이벤트 부여
								const inputImage = document.getElementById("RC_IMAGE");
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
							<input type="text" placeholder="제목을 입력하세요" id="RC_TITLE" name="RC_TITLE" class="form-control input-sm" value="${map.RC_TITLE}">
							<!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
						    <input type="hidden" id="RC_NUM" name="RC_NUM" value="${map.RC_NUM}"/>
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
							    <button class="btn btn-outline-success" onclick="return recommendModify()">수정</button>
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
	function recommendModify(){
		var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("/bang/recommendModify.tr");
		var RC_TITLE = document.getElementById("RC_TITLE").value;
		var RC_CONTENT = document.getElementById("summernote").value;
		var RC_IMAGE = document.getElementById("RC_IMAGE").value;
	
		if (!$("#RC_TITLE").val()) {
			alert("제목을 입력하세요.");
			$("#RC_TITLE").focus();
			return false;
		}
		if (!$("#summernote").val()) {
			alert("내용을 입력하세요.");
			$("#summernote").focus();
			return false;
		}
		if (!RC_IMAGE) {
			if (confirm("기존 등록된 이미지를 썸네일로 사용하시겠습니까?") == true) {
				return true;
			} else {
				alert("썸네일 이미지를 등록하세요.");
				$("#RC_IMAGE").focus();
				return false;
			}
		}
		
		alert("여행지 추천 게시글이 정상적으로 수정 되었습니다.");
		comSubmit.submit();
	}
	</script>
    </body>
</html>
