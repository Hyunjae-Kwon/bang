<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>방방곡곡</title>
    
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
    
<!-- ################# Header Starts Here#######################--->

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
        
    <!-- 폼 -->
    <form id="frm" name="recommendModify" enctype="multipart/form-data" action="<c:url value='/recommendModify.tr'/>" method="post">
        
	<!-- 제목 입력 부분 -->
    <input type="text" value=${map.RC_TITLE } id="RC_TITLE" name="RC_TITLE" 
    class="form-control input-sm">
   <!--  추가 --> 
    <input type="hidden" id="RC_NUM" name="RC_NUM" value="${map.RC_NUM}"/> 
    <input type="hidden" id="RC_ID" name="RC_ID" value="${member.MEM_ID}"/>
    <input type="hidden" id="RC_IMAGE" name="RC_IMAGE" value="${map.RC_IMAGE }" />   <!-- 파일기능 넣기전까지 이거로..안그러면 부적합한열에러 -->
  
    <!-- 글 작성 폼 -->
   <textarea id="summernote" class="RC_CONTENT" name="RC_CONTENT" ></textarea>

    
    <!-- 글 작성 폼 스크립트 -->
    <script>
    $('#summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 300,
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
       
       /* summernote에 글 추가할 수 있는 함수 */
       $("#summernote").summernote('code',  '${map.RC_CONTENT}');
    </script>
    
    <!-- 버튼 가운데 정렬 -->
    <div style="text-align: center;">
   <!--  <button id="update" class="btn btn-primary" onclick="updateRecommend()" type="submit">수정</button> -->
<!--     <input type="button" class="btn btn-primary" onClick="return fn_updateRecommend()" value="글 수정"></a>--> 
	<button id="modify" class="btn btn-primary" onclick="return recommendUpdate()">수정</button>
	<button id="close" class="btn btn-primary" onclick="location.href='/bang/recommendList.tr'" type="button">취소</button>
	</div>
	
	</form>


	<!-- 글 수정 자바스크립트 -->
	<script>
	function recommendUpdate(){

		    var comSubmit = new ComSubmit("frm");
		      comSubmit.setUrl("/bang/recommendModify.tr");
			var RC_TITLE = document.getElementById("RC_TITLE").value;
			var RC_CONTENT = document.getElementById("summernote").value;

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

				alert("게시글이 정상적으로 수정 되었습니다.");
				comSubmit.submit();

			}
	

		</script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
   
    </body>

</html>
