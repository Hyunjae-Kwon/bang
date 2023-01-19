<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<c:choose>
		<c:when test="${searchKeyword==null}">
			<div class="page-nav no-margin row">
			    <div class="container">
			        <div class="row">
			            <h2>여행 후기</h2>
			            <ul>
			                <li> <a href="reviewWriteForm.tr"><i class="fas fa-blog"></i>글쓰기</a></li>
			                <li><i class="fas fa-angle-double-right"></i> Review</li>
			            </ul>
			        </div>
			    </div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="page-nav no-margin row">
		        <div class="container">
		            <div class="row">
		                <h2>여행 후기 검색 결과</h2>
		                <p>여행 후기 게시판에서 <b>'${searchKeyword}'</b> 로 검색한 결과입니다.</p>
		            </div>
		        </div>
		    </div>	
		</c:otherwise>
	</c:choose>
	
	<!--  ************************* 여행 후기 Starts Here ************************** -->
	<!-- 검색어 입력란 -->
	<div>
		<form action="/bang/reviewList.tr" method="GET">
			<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
			<input type="text" id="searchKeyword" name="searchKeyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
		</form>
	</div>
	
	<!-- 후기 리스트 출력란 -->
	<section id="review-List" class="review-List">
	    <div class="container">
	       	<div class="blog-row row review-List-container"></div>
	  	</div>
	</section>
	    
    <!--  ************************* 여행 후기 script ************************** -->
    <script>
    $(document).ready(function(){ 
		GetList(1);
	});
    
    /* 페이지 처음 로딩시 p1므로 초기값 1로 지정 */
    let currentPage = 1;
    /* 현재 페이지 로딩 여부 저장 변수 */
    let isLoading = false;
    /* 웹브라우저 창을 스크롤 할 때 마다 호출 */
    $(window).on("scroll", function(){
    	/* 위로 스크롤된 길이 */
    	let scrollTop = $(window).scrollTop();
    	/* 웹브라우저 창의 높이 */
    	let windowHeight = $(window).height();
    	/* 리스트 전체 높이 */
    	let documentHeight = $(document).height();
    	/* 끝까지 스크롤 여부 확인 */
    	let isBottom = scrollTop+windowHeight + 10 >= documentHeight;
    	
    	if(isBottom){
    		/* 마지막 페이지일 경우 */
    		if(currentPage >= ${totalPageCount} || isLoading){
    			return;
    		}
    		/* 로딩 중 */
    		isLoading = true;
    		
    		/* 요청할 페이지 번호 1 증가 */
    		currentPage++;
    		
    		/* 추가 페이지를 서버에 ajax 요청 */
    		console.log("inscroll" + currentPage);
    		
    		GetList(currentPage);
    	};
    });
    
    const GetList = function(currentPage){
		console.log("inGetList"+currentPage);
		/* 무한 스크롤 */
		$.ajax({
			url:"/bang/reviewListScroll.tr",
			method:"GET",
			data:"pageNum="+currentPage+"&searchKeyword=${searchKeyword}",
			success:function(data){
				$(".review-List-container").append(data);
				/* 로딩중이 아니라고 표시 */
				isLoading = false;
				console.log("ajax");
			}
		});
    }
    </script>
</body>
</html>