<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <h2>동행게시판 글쓰기</h2>
                <ul>
                    <li><a href="togetherList.tr"><i class="fas fa-blog"></i>동행게시판</a></li>
                    <li><i class="fas fa-angle-double-right"></i>글쓰기</li>
                </ul>
            </div>
        </div>
    </div>
	<!-- ################# 게시물 Starts Here #######################--->
	<br>
	<form id="frm" name="frm" action="<c:url value='/togetherWrite.tr'/>" method="post" encType="multipart/form-data">
	<div class="board-list">
		<div class="container" align="center">
			<table class="board-table">
				<tbody>
					<tr>
						<td>
							<!-- 제목 입력 부분 -->
				    		<input type="text" placeholder="제목을 입력하세요" id="TG_TITLE" name="TG_TITLE" class="form-control input-sm">
						</td>
					</tr>
					<tr>
						<td>
						    <!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
						    <input type="hidden" id="TG_ID" name="TG_ID" value="${MEM_ID}"/>
					    </td>
					</tr>
					<tr>
						<td>
						    <!-- 글 작성 폼 -->
						    <textarea id="summernote"  name="TG_CONTENT"></textarea>
					    </td>
					</tr>
					<tr>
						<td>
							<!-- 버튼 가운데 정렬 -->
							<div style="text-align: center;">
								<br>
								<button id="write" class="btn btn-outline-success" onclick="return fn_insertBoard()">작성</button>
								<button id="close" class="btn btn-outline-success" onclick="return fn_openList()">취소</button>
							</div>
							<br>
						</td>
					</tr>	
				</tbody>
			</table>
		</div>
	</div>
	</form>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		function fn_insertBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("/bang/togetherWrite.tr");
			var TG_TITLE = document.getElementById("TG_TITLE").value;
			var TG_CONTENT = document.getElementById("summernote").value;

			if (!$("#TG_TITLE").val()) {
				alert("제목을 입력하세요.");
				$("#TG_TITLE").focus();
				return false;
			}

			if (!$("#summernote").val()) {
				alert("내용을 입력하세요.");
				$("#summernote").focus();
				return false;
			}
			alert("게시글이 정상적으로 등록 되었습니다.");
			comSubmit.submit();

		}

		function fn_openList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherList.tr' />");
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
		});
	</script>
</body>

</html>