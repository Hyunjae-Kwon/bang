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
    
    <!-- summernote에 필요한 스크립트와 링크 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

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
		  // 에디터 높이
		  height: 150,
		  // 에디터 한글 설정
		  lang: "ko-KR",
		  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
		  focus : true,
		  toolbar: [
			    // 글꼴 설정
			    ['fontname', ['fontname']],
			    // 글자 크기 설정
			    ['fontsize', ['fontsize']],
			    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // 글자색
			    ['color', ['forecolor','color']],
			    // 표만들기
			    ['table', ['table']],
			    // 글머리 기호, 번호매기기, 문단정렬
			    ['para', ['ul', 'ol', 'paragraph']],
			    // 줄간격
			    ['height', ['height']],
			    // 그림첨부, 링크만들기, 동영상첨부
			    ['insert',['picture','link','video']],
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			  ],
			  // 추가한 글꼴
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			 // 추가한 폰트사이즈
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      }); 
    </script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>
