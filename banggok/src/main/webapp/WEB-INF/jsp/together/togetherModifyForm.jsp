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
                <h2>동행게시판 글수정</h2>
                <ul>
                    <li> <a href="togetherList.tr"><i class="fas fa-blog"></i>동행게시판</a></li>
                    <li><i class="fas fa-angle-double-right"></i>글수정</li>
                </ul>
            </div>
        </div>
    </div>
	<!-- ################# 게시물 Starts Here #######################--->
<br>
<div class="container"  align="center" >
	<form id="frm">

				<table class="board_view" weight="1100" >
					<colgroup>
						<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">글번호</th>
							<td>${map.TG_NUM }
							<input type="hidden" id="TG_NUM" name="TG_NUM" value="${map.TG_NUM }"></td>
							<th scope="row">조회수</th>
							<td>${map.TG_CNT }</td>
							
					
							<th scope="row">작성자</th>
							<td>${map.TG_ID }</td>
							<th scope="row">작성시간</th>
							<td>${map.TG_REGDATE}</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="7"><input type="text" placeholder="제목을 입력하세요" id="TG_TITLE" name="TG_TITLE" class="form-control input-sm"
								value="${map.TG_TITLE }" /></td>
						</tr>
						<tr>
							<td colspan="8"><textarea rows="5" title="내용"
									id="summernote" name="TG_CONTENT" class="form-control input-sm">${map.TG_CONTENT}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
		
	</form>
	</div>
	<hr>
	<div align="center">
		<input type="button" value="저장" class="btn btn-outline-success"
			style="height: 55px;" onClick="return updateForm()"> 
		
			<input type="button" value="목록" class="btn btn-outline-success"
			style="height: 55px;" onClick="return fn_openList()">
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	
		function fn_openList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/togetherList.tr' />");
			comSubmit.submit();
		}

		function updateForm() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/togetherModify.tr' />");
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

			alert("게시글이 정상적으로 수정 되었습니다.");
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
	
		/* 파일 업로드를 위한 Ajax */
	
    </script>
</body>

</html>