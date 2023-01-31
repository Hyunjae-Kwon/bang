<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<<<<<<< HEAD

<body>  
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>여행 후기</h2>
                <ul>
                    <li> <a href="/bang/reviewList.tr"><i class="fas fa-blog"></i> 목록</a></li>
                    <li> <a href="/bang/reviewModifyForm.tr?RV_NUM=${review.RV_NUM }"><i class="fas fa-blog"></i> 수정/삭제</a></li>
                    <li><i class="fas fa-angle-double-right"></i> Review</li>
                </ul>
            </div>
        </div>
    </div>   
    
     <!--*************** Blog Starts Here ***************-->
                     
    <div class="about-us container-fluid">
	    <div class="container" style="text-align: center";>	
	                <h2 style="text-align: center; margin-bottom: 100px; width: 100%;">${review.RV_TITLE}</h2>
	                <p style="margin-bottom: 100px; width: 100%;">${review.RV_CONTENT }</p>
	                <img src="resources/images/review/${review.RV_IMAGE}.jpg" alt="">  
	                
	  				<input type="hidden" name="RV_NUM" id="RV_NUM" value="${review.RV_NUM}">
	
	        <!-- 버튼 가운데 정렬 -->
		    <div style="text-align: center; margin-bottom: 100px; width: 100%;">
	            <input type="button" value="수정" class="btn btn-primary py-2 px-2" style="height:55px;" onClick="location.href='reviewModifyForm.tr?RV_NUM=${review.RV_NUM}'">
				<input type="button" value="삭제" class="btn btn-primary py-2 px-2" style="height:55px;" onClick="return reviewDel()">
				<input type="button" value="목록" class="btn btn-primary py-2 px-2" style="height:55px;" onclick="location.href='reviewList.tr';">
              <c:if test="${MEM_ID != review.RV_ID }">  <!-- 작성자가 아닐 경우에만 추천버튼 보이게 -->
				<input type="button" value="추천" class="btn btn-primary py-2 px-2" style="height:55px;" onclick="return fn_reviewLike()">
		      </c:if>  
	        </div>	   	    
	    </div>
    </div>
                

          <!--  ************************* Contact Us Starts Here ************************** -->


    <div class="row contact-rooo no-margin">
        <div class="container">
                    <h2 >댓글 입력</h2> <br>
                    <div class="row cont-row">
                        <div  class="col-sm-3"><label>작성자 </label><span>:</span></div>
                        <div class="col-sm-8"><input type="text" placeholder="${RV_ID}" name="name" class="form-control input-sm" readonly></div>
                    </div>
                    <div  class="row cont-row">
                        <div  class="col-sm-3"><label>내용</label><span>:</span></div>
                        <div class="col-sm-8">
                            <textarea rows="5" placeholder="Enter Your Message" class="form-control input-sm"></textarea>
                        </div>
                    </div>
                    <div style="margin-top:10px;" class="row">
                        <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                        <div class="col-sm-8">
                            <button class="btn btn-success btn-sm">작성</button>
                            <button class="btn btn-success btn-sm">수정</button>
                            <button class="btn btn-success btn-sm">삭제</button>  
                        </div>
                    </div>
        </div>
    </div>

	<!-- 댓글 -->
	<div class="review container-fluid">
         <div class="container">
              <div class="session-title" style="text-align: center">
                <a href="#"><h2>댓글</h2></a>
            </div>
            <div class="row review-row">
                <div class="col-md-12">
                    <div class="review-col">
					<c:forEach var="comment" items="${reviewCommentList}" varStatus="status">
                        <div class="profil">
                          <img src="resources/images/testimonial/member-01.jpg" alt="">  
                        </div>
                        <div class="review-detail">
                            <!-- <h4>댓글 제목</h4> -->
                            <p>${comment.BC_COMMENT }</p>
                            <h6>${comment.BC_ID }</h6>
                            <ul class="rat">
                            </ul>
                        </div>
					</c:forEach>
                    </div>
                </div>
			</div>
            </div>
         </div>
     <%@ include file="/WEB-INF/include/include-body.jspf" %>    
        
  <!--  ************************* Footer Start Here ************************** -->

    </body>
    <!-- 댓글 모달창 -->
	<script>
	  $('#cmtModal').on('click', function(){
	    $('.black-bg').addClass('show-modal');
	  });
	</script>
=======
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>여행 후기</h2>
				<ul>
					<li><a href="/bang/reviewList.tr"><i class="fas fa-blog"></i>목록</a></li>
					<li><a href="/bang/reviewModifyForm.tr?RV_NUM=${review.RV_NUM}"><i class="fas fa-blog"></i> 수정/삭제</a></li>
					<li><i class="fas fa-angle-double-right"></i> Review</li>
				</ul>
			</div>
		</div>
	</div>
	<!--*************** 상세 내용 Starts Here ***************-->
	<br><br>
	<div class="board-list">
		<div class="container">		 
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr align="center">
						<td scope="col" style="font-weight: bold;">글번호</td>
						<td scope="col">${review.RV_NUM}</td>
						<td scope="col" style="font-weight: bold;">조회수</td>
						<td scope="col">${review.RV_CNT}</td>
						<td scope="col" style="font-weight: bold;">추천수</td>
						<td scope="col">${review.RV_LIKE}</td>
						<td scope="col" style="font-weight: bold;">작성일시</td>
						<td scope="col">${review.RV_REGDATE}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">제목</td>
						<td align="center" colspan="5">${review.RV_TITLE}</td>
						<td align="center" style="font-weight: bold;">작성자</td>
						<td align="center">${review.RV_ID}</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">내용</td>
						<td colspan="7" style="height: 300px;">${review.RV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
		<br>
		</div>				 
	</div>
	<!-- 버튼 가운데 정렬 -->
	<div align="center" style="text-align: center; margin-bottom: 100px; width: 100%;">
		<input type="button" value="수정" class="btn btn-outline-success" onClick="location.href='reviewModifyForm.tr?RV_NUM=${reviewDetail.RV_NUM}'">
		<input type="button" value="삭제" class="btn btn-outline-success" onClick="return reviewDel()">
		<input type="hidden" id="RV_NUM" value="${review.RV_NUM}">
		<input type="button" value="목록" class="btn btn-outline-success" onClick="location.href='reviewList.tr';">
		<c:if test="${MEM_ID != review.RV_ID }">  <!-- 작성자가 아닐 경우에만 추천버튼 보이게 -->
			<input type="button" value="추천" class="btn btn-primary py-2 px-2" style="height:55px;" onclick="return fn_reviewLike()">
		</c:if>  
	</div>
	<br>
	<hr>
<!--  댓글  -->
	<div style="max-width: 100%; margin-left: 40px;">
		<h5>댓글</h5>
		<c:forEach var="comment" items="${reviewCommentList}" varStatus="status">
			<div id="commentList">
				<span class="pric">${comment.BC_ID }|<fmt:formatDate value="${comment.BC_REGDATE}" pattern="yyyy-MM-dd" /></span>
				<p>${comment.BC_COMMENT }
					<input type="hidden" id="BC_BCID" name="BC_BCID" value="${comment.BC_BCID }">
					<input type="hidden" id="BC_NUM" name="BC_NUM" value="${comment.BC_NUM }">
				</p>
				<div style="font-size: 8pt; color: gray; padding-right: 10px; margin-bottom: 10px;">
					<c:if test="${MEM_ID eq comment.BC_ID}">
						<input type="button" onClick="return deleteComment()" value="삭제하기">
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<form action="rvCommentWrite.tr?RV_NUM=${review.RV_NUM}" name="frm" id="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="BC_NUM" id="BC_NUM" value="${review.RV_NUM}">
		<input type="hidden" id="MEM_ID" name="MEM_ID" value="${MEM_ID}" />
		<div style="display: inline-block; width: 88%; margin-left: 20px;">
			<textarea name="BC_COMMENT" id="BC_COMMENT" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
		</div>
		<div style="display: inline-block; float: right; width: 10%;">
			<input type="button" value="댓글쓰기" onclick="fn_commentCheck()" class="btn btn-primary py-2 px-2">
		</div>
	</form>
	<!--  댓글 끝 -->
</body>
>>>>>>> branch 'CHAEYEONG' of https://github.com/Hyunjae-Kwon/bang.git
    <!-- 여행후기 삭제 스크립트 -->
    <script>
		function reviewDel() {
			var RV_NUM = document.getElementById('RV_NUM').value;
			if(confirm("삭제하시겠습니까?") == true) {
				location.href="/bang/reviewDel.tr?RV_NUM=" + RV_NUM;
			}
		}
	</script>	
    <script type="text/javascript">
        function fn_reviewLike() {
	  
	  	var rv_num = "${review.RV_NUM}";
	  	var comSubmit = new ComSubmit();
	  	var CONFIRM = confirm("추천하시겠습니까?");
	  	if(CONFIRM == true) {
			comSubmit.setUrl("/bang/reviewLike.tr");
			comSubmit.addParam("RV_NUM", rv_num);
	      comSubmit.submit();
	      alert("추천되었습니다.");
	      
	      }
	  }
       </script>
       <script>
       <!-- 댓글 -->
       function fn_commentCheck() {
       	var frm = document.getElementById('frm');
       	var BC_NUM = document.getElementById('BC_NUM');
       	if (!$("#BC_COMMENT").val()) {
               alert("내용을 입력하세요.");
               $("#BC_COMMENT").focus();
               return false;
            }
         alert("댓글이 정상적으로 등록 되었습니다."); 
       	frm.submit();
       }
       
       <!-- 댓글삭제-->
       function deleteComment() {
       	var BC_BCID = document.getElementById('BC_BCID').value;
       	var RV_NUM = document.getElementById('RV_NUM').value;
       	if(confirm("삭제하시겠습니까?") == true) {
       		location.href="rvCommentDelete.tr?BC_BCID=" + BC_BCID +"&RV_NUM="+ RV_NUM;
       	}
       }
       </script>
</html>
