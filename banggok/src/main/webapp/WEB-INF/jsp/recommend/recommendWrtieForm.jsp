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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <!--  내가 넣은거..  -->
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>

    <body>
    
<!-- ################# Header Starts Here#######################--->


 

    
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>관광지 추천 글쓰기</h2>
                <ul>
                    <li> <a href="allRecommendList.tr"><i class="fas fa-blog"></i>관리자 관광지 추천</a></li>
                    <li><i class="fas fa-angle-double-right"></i>추천글</li>
                </ul>
            </div>
        </div>
    </div>
    
    
     <!--*************** Blog Starts Here ***************-->
        
    <!-- 폼 -->
    <form id="frm" name="frm" enctype="multipart/form-data" action="<c:url value='/recommendWrite.tr'/>" method="post">
                     
	<!-- 제목 입력 부분 -->
   <!--  <input type="text" placeholder="제목을 입력하세요" name="name" class="form-control input-sm"> -->
    <input type="text" placeholder="!!!!제목을 입력하세요" id="RC_TITLE" name="RC_TITLE" class="form-control input-sm">
   <!--  추가 --> 
    <input type="hidden" id="RC_NUM" name="RC_NUM" value="${RC_NUM}"/> 
    <input type="hidden" id="RC_ID" name="RC_ID" value="${MEM_ID}"/>
    <input type="hidden" id="RC_IMAGE" name="RC_IMAGE" value="${RC_IMAGE }" />   <!-- 파일기능 넣기전까지 이거로..안그러면 부적합한열에러 -->
    
    
    <!-- 글 작성 폼 -->
   <!--  <div id="summernote"></div> -->
   <textarea id="summernote" name="RC_CONTENT"></textarea>
    
    <!-- 글 작성 폼 스크립트 -->
    <script>
    $(document).ready(function() {
      $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 300
      });
    });
    </script>
    
    <!-- 버튼 가운데 정렬 -->
    <div style="text-align: center;">
    <button id="write" class="btn btn-primary" onclick="insertRecommend()" type="submit">작성</button>
	<button id="close" class="btn btn-primary" onclick="location.href='/bang/allRecommendList.tr'" type="button">취소</button>
	</div>
	
	</form>


	<!-- 글 작성 자바스크립트 -->
	<script>
	function insertRecommend(){

		    var comSubmit = new ComSubmit("frm");
		      comSubmit.setUrl("/trip/recommendWrite.tr");
			var RC_TITLE = document.getElementById("RC_TITLE").value;
			var RC_CONTENT = document.getElementById("RC_CONTENT").value;

				if (!$("#RC_TITLE").val()) {
					alert("제목을 입력하세요.");
					$("#RC_TITLE").focus();
					return false;
				}

				if (!$("#RC_CONTENT").val()) {
					alert("내용을 입력하세요.");
					$("#RC_CONTENT").focus();
					return false;
				}

				alert("게시글이 정상적으로 등록 되었습니다.");
				comSubmit.submit();

			}
	

		</script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>
