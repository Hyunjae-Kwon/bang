<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>"/>
<body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>회원 관리</h2>
                <ul>
                    <li> <a href="adminPage.tr"><i class="fas fa-user-alt"></i>관리자 페이지</a></li>
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-map-marked"></i> 회원 목록</li>
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
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">별명</th>
						<th scope="col">가입날짜</th>
						<th scope="col">이메일</th>
						<th scope="col">연락처</th>
						<th scope="col">활동유무</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${member[0].MEM_ID != null}">
							<c:forEach items="${member}" var="list" varStatus="status">
								<tr>
									<td align="center">${list.RNUM}</td>
									<td><a href="adminMemberModifyForm.tr?MEM_ID=${list.MEM_ID}">${list.MEM_ID}</a></td>
									<td align="center">${list.MEM_NAME}</td>
									<td align="center">${list.MEM_NICKNAME}</td>
									<td align="center" ${list.MEM_REGDATE}><fmt:formatDate value="${list.MEM_REGDATE}" pattern="yyyy-MM-dd" /></td>
									<td align="center">${list.MEM_EMAIL}</td>
									<td align="center">${list.MEM_PHONE}</td>
									<td align="center">									  
										<c:if test="${list.MEM_BLOCK eq 'Y' }">회원활동정지</c:if>
										<c:if test="${list.MEM_BLOCK eq 'N' }">활동중</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div>
				<br>
				<form action="/bang/adminMemberList.tr" method="GET">
					<button class="search-btn" onClick="form.submit()" style="width: 30px; height: 30px; margin-top: 5px;"><i class="fas fa-search" style="margin: 0px;"></i></button>
					<input type="text" id="searchKeyword" name="searchKeyword" placeholder=" 검색어를 입력하세요." style="height: 30px; float: right; border-radius:30px; margin-right: 3px; margin-top: 5px; padding-left: 6px;">
				</form>
		    </div>
			<!-- 페이지 -->
		  	<div align="center">	    
				<c:if test="${not empty paginationInfo}">
				  <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
				</c:if>
				  <input type="hidden" id="currentPageNo" name="currentPageNo"/>	
				<%@ include file="/WEB-INF/include/include-body.jspf" %>
			</div>
			<br><br>
		</div>				 
	</div>
	<script type="text/javascript">
	function deleteMember() {
		var MEM_ID = document.getElementById("MEM_ID").value;
		if (confirm("강제로 탈퇴시키겠습니까?") == true) {
			location.href = "memberDelete.tr?MEM_ID=" + MEM_ID;		
		}
	}
	
	function fn_search(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/adminMemberList.tr' />");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
    }
	</script>
    </body>
</html>
