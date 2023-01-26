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
                <h2>나의 동행 리스트</h2>
                <ul>
                    <li> <a href="myPage.tr"><i class="fas fa-user-alt"></i>마이페이지</a></li>                 
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-comment"></i> MyTogether</li>
                </ul>
            </div>
        </div>
    </div>
    
    
     <!--*************** Blog Starts Here ***************-->
      <br><br>
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
						<c:when test="${fn:length(myTogetherList) > 0}">
							<c:forEach items="${myTogetherList}" var="list" varStatus="status">
								<tr>
									<td align="center">${list.TG_NUM }
									<input type="hidden" id="TG_NUM" name="TG_NUM" value="${list.TG_NUM }"></td>
									<td><a href="togetherDetail.tr?TG_NUM=${list.TG_NUM}">${list.TG_TITLE}</a>
									</td>

									<td align="center">${list.TG_ID }
									<td align="center">${list.TG_CNT }</td>
									<td align="center" ${list.TG_REGDATE }><fmt:formatDate value="${list.TG_REGDATE}" pattern="yyyy-MM-dd" /></td>
									<td align="center">
									  <button type="button"class="btn btn-outline-success" style="padding:5px;" onClick="location.href='/bang/togetherModifyForm.tr?TG_NUM=${list.TG_NUM}'">수정</button> 
									  <button type="button"class="btn btn-outline-success" style="padding:5px;" onClick="return deleteTogether()">삭제</button>									  
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
			<form action="/bang/searchTogether.tr" method="GET">
				<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
				<input type="text" id="keyword" name="keyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
			</form>
		  </div>
		<br><br><br>
	  </div>		
	</div>
	<script type="text/javascript">

	function deleteTogether() {
		var TG_NUM = document.getElementById("TG_NUM").value;
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "togetherDelete.tr?TG_NUM=" + TG_NUM;		
		}
	}
	</script>

  <!--  ************************* Footer Start Here ************************** -->

    
   
    </body>

</html>
