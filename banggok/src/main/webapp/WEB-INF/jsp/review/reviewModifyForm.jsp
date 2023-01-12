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

</head>

    <body>
    
<!-- ################# Header Starts Here#######################--->


 

    
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
        
        
    <!-- 폼 -->
    <form id="reviewModify" name="reviewModify" enctype="multipart/form-data" action="<c:url value='/reviewModify.tr'/>" method="post">

	<!-- 제목 입력 부분 -->
    <input type="text" id="RV_TITLE" placeholder="제목을 입력하세요" value="${review.RV_TITLE}" name="RV_TITLE" class="form-control input-sm">
    
    <!-- 쿼리문 동작을 위해 hidden으로 숨겨놓음 -->
    <input type="hidden" id="RV_NUM" name="RV_NUM" value="${review.RV_NUM}"/>
    <input type="hidden" id="RV_ID" name="RV_ID" value="${member.MEM_ID}"/>
    <input type="hidden" id="RV_IMAGE" name="RV_IMAGE" value="${review.RV_IMAGE}"/>
    
    <!-- 글 작성 폼 -->
    <textarea id="summernote" class="RV_CONTENT" name="RV_CONTENT"></textarea>
    
    <!-- summernote 스크립트 -->
    <script>
	       $('#summernote').summernote({
	        placeholder: '내용을 입력하세요.',
	        tabsize: 2,
	        height: 300
	      }); 
	       
	       /* summernote에 글 추가할 수 있는 함수 */
	       $("#summernote").summernote('code',  '${review.RV_CONTENT}');
    </script>
    
    <!-- 버튼 가운데 정렬 -->
    <div style="text-align: center;">
    <button id="frm" class="btn btn-primary" onclick="return reviewModify()" type="submit">수정</button>
	<button id="close" class="btn btn-primary" onclick="location.href='/bang/reviewList.tr'" type="button">취소</button>
	</div>
	
	</form>


	<!-- 글 수정 자바스크립트 -->
	<script>
	function reviewModify(){

		   var comSubmit = new ComSubmit("frm");
		      comSubmit.setUrl("/bang/reviewModify.tr");
			var BD_TITLE = document.getElementById("RV_TITLE").value;
			var BD_CONTENT = document.getElementById("RV_CONTENT").value;

				if (!$("#RV_TITLE").val()) {
					alert("제목을 입력하세요.");
					$("#RV_TITLE").focus();
					return false;
				}

				if (!$("#RV_CONTENT").val()) {
					alert("내용을 입력하세요.");
					$("#RV_CONTENT").focus();
					return false;
				}

				alert("여행후기가 정상적으로 수정 되었습니다.");
				comSubmit.submit();
	}
	</script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>
