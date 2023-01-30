<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>방방곡곡</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>"/>
</head>
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>여행 후기</h2>
				<ul>
					<li><a href="/bang/reviewList.tr"><i class="fas fa-blog"></i>목록</a></li>
					<li><a href="/bang/reviewModifyForm.tr?RV_NUM=${reviewDetail.RV_NUM}"><i class="fas fa-blog"></i> 수정/삭제</a></li>
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
						<td scope="col">${reviewDetail.RV_NUM}</td>
						<td scope="col" style="font-weight: bold;">조회수</td>
						<td scope="col">${reviewDetail.RV_CNT}</td>
						<td scope="col" style="font-weight: bold;">추천수</td>
						<td scope="col">${reviewDetail.RV_LIKE}</td>
						<td scope="col" style="font-weight: bold;">작성일시</td>
						<td scope="col">${reviewDetail.RV_REGDATE}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">제목</td>
						<td align="center" colspan="5">${reviewDetail.RV_TITLE}</td>
						<td align="center" style="font-weight: bold;">작성자</td>
						<td align="center">${reviewDetail.RV_ID}</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">내용</td>
						<td colspan="7" style="height: 300px;">${reviewDetail.RV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
		<br>
		</div>				 
	</div>
	<div align="center">
		<input type="button" value="수정" class="btn btn-outline-success" onClick="location.href='reviewModifyForm.tr?RV_NUM=${reviewDetail.RV_NUM}'">
		<input type="button" value="삭제" class="btn btn-outline-success" onClick="return reviewDel()">
		<input type="hidden" id="RV_NUM" value="${reviewDetail.RV_NUM}">
		<input type="button" value="목록" class="btn btn-outline-success" onClick="location.href='reviewList.tr';">
	</div>
	<br>
	<!--  ************************* 댓글 Starts Here ************************** -->
	<div class="row contact-rooo no-margin">
		<div class="container">
			<h2>댓글 입력</h2>
			<br>
			<div class="row cont-row">
				<div class="col-sm-3">
					<label>작성자 </label><span>:</span>
				</div>
				<div class="col-sm-8">
					<input type="text" placeholder="" name="name" class="form-control input-sm" readonly>
				</div>
			</div>
			<div class="row cont-row">
				<div class="col-sm-3">
					<label>내용</label><span>:</span>
				</div>
				<div class="col-sm-8">
					<textarea rows="5" placeholder="Enter Your Message" class="form-control input-sm"></textarea>
				</div>
			</div>
			<div style="margin-top: 10px;" class="row">
				<div style="padding-top: 10px;" class="col-sm-3">
					<label></label>
				</div>
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
</body>
<!-- 여행후기 삭제 스크립트 -->
<script>
function reviewDel() {
	var RV_NUM = document.getElementById('RV_NUM').value;
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="/bang/reviewDel.tr?RV_NUM=" + RV_NUM;
	}
}
</script>
</html>
