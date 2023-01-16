<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>"/>
<body>
<!-- ################# Header Starts Here#######################--->


 

    
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>나의 여행 후기</h2>
                <ul>
                    <li> <a href="myPage.tr"><i class="fas fa-user-alt"></i>마이페이지</a></li>
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-plane"></i> MyReview</li>
                </ul>
            </div>
        </div>
    </div>
    
    
     <!--*************** Blog Starts Here ***************-->
 <br>
 
<div class="board-list">
		<div class="container">
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr align="center">
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
						<th scope="col">수정 / 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(myReviewList) > 0}">
							<c:forEach items="${myReviewList}" var="list" varStatus="status">
								<tr>
									<td align="center">${list.RV_NUM }</td>
									<td><a href="reviewDetail.tr?RV_NUM=${list.RV_NUM}">${list.RV_TITLE}</a>
									</td>

									<td align="center">${list.RV_ID }
									<td align="center">${list.RV_CNT }</td>
									<td align="center" ${list.RV_REGDATE }><fmt:formatDate value="${list.RV_REGDATE}" pattern="yyyy-MM-dd" /></td>
									<td align="center">
									  <button type="button"class="btn btn-outline-success" style="padding:5px;" onClick="location.href='/bang/reviewModify.tr'">수정</button> 
									  <button type="button"class="btn btn-outline-success" style="padding:5px;" onClick="location.href='/bang/reviewDel.tr'">삭제</button>									  
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div>
			<br>
			<form action="/bang/searchReview.tr" method="GET">
				<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
				<input type="text" id="keyword" name="keyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
			</form>
		</div>
		<br><br><br>
		</div>				
	</div>
	<script type="text/javascript">

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/reviewDetail.tr' />");
			comSubmit.addParam("RV_NUM", obj.parent().find("#RV_NUM").val());
			comSubmit.submit();
		}
	</script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>
