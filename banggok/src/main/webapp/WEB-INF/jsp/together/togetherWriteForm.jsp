<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                    <li> <a href="togetherList.tr"><i class="fas fa-blog"></i>동행게시판</a></li>
                    <li><i class="fas fa-angle-double-right"></i>글쓰기</li>
                </ul>
            </div>
        </div>
    </div>
	<!-- ################# 게시물 Starts Here #######################--->
	<br>
	<form id="frm" name="frm" action="<c:url value='/togetherWrite.tr'/>" method="post" encType="multipart/form-data">
	<div class="board-list">
		<div class="container" style="margin-left: 170px;">
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
    <script>
 	$('#summernote').summernote({
 		 placeholder: '내용을 입력하세요.',
 		  /* 에디터 높이 */
		  height: 150,
		  /* 에디터 한글 설정 */
		  lang: "ko-KR",
		  /* 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.) */
		  focus : true,
		  toolbar: [
			 	 /* 글꼴 설정 */
			    ['fontname', ['fontname']],
			    /* 글자 크기 설정 */
			    ['fontsize', ['fontsize']], 
			    /* 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기 */
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    /* 글자색 */
			    ['color', ['forecolor','color']],
			    /* 표만들기 */
			    ['table', ['table']],
			    /* 글머리 기호, 번호매기기, 문단정렬 */
			    ['para', ['ul', 'ol', 'paragraph']],
			    /* 줄간격 */
			    ['height', ['height']],
			    /* 그림첨부, 링크만들기, 동영상첨부 */
			    ['insert',['picture','link','video']],
			    /* 코드보기, 확대해서보기, 도움말 */
			    ['view', ['codeview','fullscreen', 'help']]
			  ],
			  /* 추가한 글꼴 */
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			 /* 추가한 폰트사이즈 */
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			
			/* 이미지 파일을 서버에 저장하고, 이미지를 호출 할 수 있는 URL을 리턴 받아서 입력하면,
				이미지가 삽입된 것 처럼 보임 */
			callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            /* 파일 업로드(다중업로드를 위해 반복문 사용) */
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
      }); 
    </script>
</body>

</html>