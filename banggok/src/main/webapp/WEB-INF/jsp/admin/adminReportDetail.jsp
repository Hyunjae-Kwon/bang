<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>방방곡곡</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>" />
</head>
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>신고 관리</h2>
				<ul>
					<li> <a href="adminPage.tr"><i class="fas fa-user-alt"></i>관리자 페이지</a></li>
                    <li><i class="fas fa-angle-double-right"></i><i class="fas fa-map-marked"></i> 신고 내용 상세보기</li>
				</ul>
			</div>
		</div>
	</div>
	<!--*************** 상세 내용 Starts Here ***************-->
	<br>
	<br>
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
				<c:if test="${report.RP_TYPE eq 'B'}">
					<c:if test="${report.RP_RTYPE eq 'T'}">
						<thead>
							<tr align="center">
								<td scope="col" style="font-weight: bold;">글번호</td>
								<td scope="col">${board.TR_NUM}</td>
								<td scope="col" style="font-weight: bold;">게시판 위치</td>
								<td scope="col">${report.RP_RTYPE}</td>
								<td scope="col" style="font-weight: bold;">분류</td>
								<td scope="col">${report.RP_TYPE}</td>
								<td scope="col" style="font-weight: bold;">신고 날짜</td>
								<td scope="col">${report.RP_REGDATE}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center" style="font-weight: bold;">제목</td>
								<td align="center" colspan="5">${board.TR_TITLE}</td>
								<td align="center" style="font-weight: bold;">작성자</td>
								<td align="center">${board.TR_ID}</td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<td align="center" style="font-weight: bold;">본문 내용</td>
								<td colspan="7" style="height: 300px;">${board.TR_CONTENT}</td>
							</tr>
						</tbody>
					</c:if>
					<c:if test="${report.RP_RTYPE eq 'W'}">
					
					</c:if>
					<c:if test="${report.RP_RTYPE eq 'R'}">
					
					</c:if>
				</c:if>
				<c:if test="${report.RP_TYPE eq 'C'}">
					<thead>
						<tr align="center">
							<td scope="col" style="font-weight: bold;">댓글번호</td>
							<td scope="col">${board.BC_BCID}</td>
							<td scope="col" style="font-weight: bold;">게시판 위치</td>
							<td scope="col">${board.BC_TYPE}</td>
							<td scope="col" style="font-weight: bold;">분류</td>
							<td scope="col">${report.RP_TYPE}</td>
							<td scope="col" style="font-weight: bold;">신고 날짜</td>
							<td scope="col">${report.RP_REGDATE}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center" style="font-weight: bold;">작성자</td>
							<td align="center" colspan="7">${board.BC_ID}</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td align="center" style="font-weight: bold;">댓글 내용</td>
							<td colspan="7" style="height: 300px;">${board.BC_COMMENT}</td>
						</tr>
					</tbody>
				</c:if>
			</table>
			
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
						<td scope="col" style="font-weight: bold;">신고번호</td>
						<td scope="col" colspan="5">${report.RP_NUM}</td>
						<td scope="col" style="font-weight: bold;">신고자</td>
						<td scope="col">${report.RP_ID}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">신고 내용</td>
						<td colspan="7" style="height: 300px;">${report.RP_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			<br>
		</div>
	</div>
</body>

<!-- 게시글 삭제 스크립트 -->
<script>
	function fn_reviewDelete() {
		var RV_NUM = document.getElementById('RV_NUM').value;
		if(confirm("삭제하시겠습니까?") == true) {
			location.href="/bang/reviewDelete.tr?RV_NUM=" + RV_NUM;
		}
	}
</script>

<!-- 게시글 신고하기 -->
<script>
function reviewReport(){
	
	var report = $(".report");
	
	var item = '<form action="reportBoardWrite.tr" name="frmReport" id="frmReport" method="post" enctype="multipart/form-data">' + 
					'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
						'<input type="hidden" name="RP_RID" value="${review.RV_ID}">' +
						'<input type="hidden" name="RP_BTYPE" value="R">' +
						'<input type="hidden" name="RP_RNUM" value="${review.RV_NUM}">' +
						'<input type="hidden" name="RP_TITLE" value="${review.RV_TITLE}">' +
						'<input type="hidden" name="RP_ID" value="${MEM_ID}">' +
						'<textarea name="RP_CONTENT" id="RP_CONTENT" class="form-control" placeholder="신고 내용을 입력해주세요."></textarea>' +
					'</div>' +
					'<div style="display: inline-block; float: right; width: 10%;">' +
						'<input type="button" value="신고하기" onclick="reportBoard()" class="btn btn-primary py-2 px-2">' +
					'</div>' +
				'</form>';
	report.append(item);
	
	return report;
}

function reportBoard() {
	var frm = document.getElementById('frmReport');
	
	if (!$("#RP_CONTENT").val()) {
        alert("내용을 입력하세요.");
        $("#RP_CONTENT").focus();
        return false;
     }
  alert("신고 내용이 정상적으로 접수 되었습니다."); 
	frm.submit();
}
</script>

<!-- 게시글 추천하기 -->
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

<!-- 댓글 작성하기 -->
<script>
$(document).ready(function(){
	$("#comWrite").click(function(){
		
		let bcNum = $("#RV_NUM").val();
		let bcId = $("#MEM_ID").val();
		let content = $("#comment").val();
		content = content.trim();
		
		if(content == ""){
			alert("내용을 입력하세요.");
			$("#comment").focus();
	        return false;
		} else {
			$("#comment").val("");
			
			$.ajax({
				url : "/bang/comWrite.tr",
				type : "GET",
				data : {
					BC_NUM : bcNum,
					BC_ID : bcId,
					BC_COMMENT : content,
					BC_TYPE : 'R'
				},
				success : function(){
					console.log("댓글 작성 성공");
					location.reload();
				},
				error : function(){
					alert("에러");
				}
			});
		};
	});
});
</script>
<!-- 댓글 삭제 스크립트 -->
<script>
function comDelete(num){
	$.ajax({
		url: "/bang/comDelete.tr",
		type: "GET",
		data: {BC_BCID: num},
		success: function(){
			console.log("댓글 삭제 성공");
			location.reload();
		},
		error: function(){
			alert("에러");
		}
	});
};
</script>
<!-- 댓글 신고하기 -->
<script>
$(document).on("click","[name=reportCom]", function(){
	
	var index = $("[name=reportCom]").index(this);
	var RP_RID = $(".items").eq(index).find("#BC_ID").val();
	var RP_RNUM = $(".items").eq(index).find("#BC_BCID").val();
	var RP_TITLE = $(".items").eq(index).find("#BC_COMMENT").val();
	
	var reportCom = $(".items").eq(index).find(".reportCom");
	
	var itemCom = '<form action="reportComWrite.tr" name="frm" id="frmCom" method="post" enctype="multipart/form-data">' + 
						'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
						'<input type="hidden" name="RP_RID" value="' + RP_RID + '">' +
						'<input type="hidden" name="RP_BTYPE" value="R">' +
						'<input type="hidden" name="RP_RNUM" value="' + RP_RNUM + '">' +
						'<input type="hidden" name="RP_TITLE" value="' + RP_TITLE + '">' +
						'<input type="hidden" name="RP_ID" value="${MEM_ID}">' +
						'<textarea name="RP_CONTENT" id="RP_CONTENT" class="form-control" placeholder="신고 내용을 입력해주세요."></textarea>' +
					'</div>' +
					'<div style="display: inline-block; float: right; width: 10%;">' +
						'<input type="button" value="신고하기" onclick="reportCom()" class="btn btn-primary py-2 px-2">' +
					'</div>' +
				'</form>';
	reportCom.append(itemCom);
	
	return reportCom;
	
});  

function reportCom() {
	var frm = document.getElementById('frmCom');
	
	if (!$("#RP_CONTENT").val()) {
        alert("내용을 입력하세요.");
        $("#RP_CONTENT").focus();
        return false;
     }
  alert("신고 내용이 정상적으로 접수 되었습니다."); 
	frm.submit();
}
</script>
</html>