<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<!-- ################# Header Starts Here#######################--->


 

    
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
        
        
    <!-- 폼 -->
    <form id="inserReview" name="inserReview" enctype="multipart/form-data" action="<c:url value='/reviewWrite.tr'/>" method="post">

	<!-- 제목 입력 부분 -->
    <input type="text" id="RV_TITLE" placeholder="제목을 입력하세요" name="RV_TITLE" class="form-control input-sm">
    
    <!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
    <input type="hidden" id="RV_NUM" name="RV_NUM" value="${RV_NUM}"/>
    <input type="hidden" id="RV_ID" name="RV_ID" value="${MEM_ID}"/>
    <input type="hidden" id="RV_IMAGE" name="RV_IMAGE" value="${RV_IMAGE}"/>
    
    <!-- 글 작성 폼 -->
    <textarea id="summernote" class="RV_CONTENT" name="RV_CONTENT"></textarea>
    
    <!-- 버튼 가운데 정렬 -->
    <div style="text-align: center;">
    <button id="frm" class="btn btn-primary" onclick="return insertReview()" type="submit">작성</button>
	<button id="close" class="btn btn-primary" onclick="location.href='/bang/reviewList.tr'" type="button">취소</button>
	</div>
	
	</form>


	<!-- 글 작성 자바스크립트 -->
	<script>
 	function insertReview(){

		    var comSubmit = new ComSubmit("frm");
		      comSubmit.setUrl("/bang/reviewWrite.tr");
			var RV_TITLE = document.getElementById("RV_TITLE").value;
			var RV_CONTENT = document.getElementByClassName("RV_CONTENT").value;	/* textarea에 id가 이미 부여되어있어서 class이름으로 생성 */

				if (!$("#RV_TITLE").val()) {	/* #은 Id */
					alert("제목을 입력하세요.");
					$("#RV_TITLE").focus();
					return false;
				}

				if (!$(".RV_CONTENT").val()) {	/* .은 ClassName */
					alert("내용을 입력하세요.");
					$(".RV_CONTENT").focus();
					return false;
				}

				alert("게시글이 정상적으로 등록 되었습니다.");
				comSubmit.submit();

			} 

		</script>
		
		    
    <!-- summernote 스크립트 -->
    <script>
 	$('#summernote').summernote({
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
		  function uploadSummernoteImageFile(file, el) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "uploadSummernoteImageFile.tr",	/* 이미지 업로드 경로 */
					contentType : false,
					enctype : 'multipart/form-data',	/* 파일 업로드를 위해 꼭 이대로 써줘야함 */
					processData : false,
					success : function(data) {
						$(el).summernote('editor.insertImage', data.url);	/* 이미지를 삽입할 수 있도록 해줌 */
					}
				});
			} 
			
    </script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>