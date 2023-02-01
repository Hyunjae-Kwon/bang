<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>" />
</head>
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>동행게시판</h2>
			</div>
		</div>
	</div>
	<!-- ################# 게시물 Starts Here #######################--->
	<br>
	<br>
	<div class="board-list">
		<div class="container">
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
					<col width="*" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr align="center">
						<td scope="col" style="font-weight: bold;">글번호</td>
						<td scope="col">${map.TG_NUM}<input type="hidden" id="TG_NUM" value="${map.TG_NUM}"></td>
						<td scope="col" style="font-weight: bold;">조회수</td>
						<td scope="col">${map.TG_CNT}</td>
						<td scope="col" style="font-weight: bold;">작성일시</td>
						<td scope="col">${map.TG_REGDATE}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">제목</td>
						<td align="center" colspan="3">${map.TG_TITLE}</td>
						<td align="center" style="font-weight: bold;">작성자</td>
						<td align="center">${map.TG_ID}<input type="hidden" id="MEM_ID" value="${MEM_ID}"></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">내용</td>
						<td colspan="5" style="height: 300px;">${map.TG_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			<br>
		</div>
	</div>
		<!-- ################# 댓글 내용 Starts Here ####################### -->
	<div class="board-list">
		<div class="container">
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="20%" />
				</colgroup>
			<c:choose>
				<c:when test="${fn:length(comment) > 0}">
					<c:forEach var="list" items="${comment}">
						<div class="items">
							<div>
								<!-- 추후 멤버에 프로필 사진 추가하면 주석 해제 -->
								<%-- <image src="/resources/images/member/${comment.MEM_IMAGE}" alt=""> --%>
							</div>
						<tbody>			
					<tr>
						<td align="center" style="font-weight: bold;">${list.BC_ID }</td>
						<td align="center" colspan="3">${list.BC_COMMENT }</td>
						<td align="center" style="font-weight: bold;">
						<fmt:formatDate value="${list.BC_REGDATE}" pattern="yyyy-MM-dd" />
						</td>
						<td>
						<input type="hidden" id="BC_BCID" name="BC_BCID" value="${list.BC_BCID }">
						<input type="hidden" id="BC_NUM" name="BC_NUM" value="${list.BC_NUM }">
						
					<c:if test="${MEM_ID eq list.BC_ID}">
						<input type="button" onClick="comDelete(${list.BC_BCID})" value="X">
					</c:if>
					<c:if test="${MEM_ID != null}">
						<input type="button" value="답글">
						<input type="button" value="신고" name="reportCom">
					</c:if>
						
						</td>
					</tr>
				</tbody>	
				<!-- 댓글 신고하기 입력 칸 -->
							<div class="reportCom"></div>
				</div>			
			</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose></table>
		</div>
		<br>
		<div style="display: inline-block; width: 78%; margin-left: 96px;">
    	<textarea name="comment" id="comment" class="form-control" rows ="1" placeholder="댓글을 입력해주세요."></textarea>
    </div>
		 <div style="display: inline-block; float: right; width: 10%; margin-right: 40px;" >
			<input type="button" value="댓글쓰기"  id="comWrite" class="btn btn-primary py-2 px-2">
		</div>
		<!-- 댓글 끝 -->
		<form id="commonForm" name="commonForm"></form>

		<!-- 하단 버튼 (목록으로 돌아가기, 수정하기, 삭제하기, 추천하기 등) -->
		<div style="margin-top: 10px;" align="center">
			<!-- <div style="padding-top:10px;" class="col-sm-3"><label></label></div> -->
			<div class="col-sm-8" style="max-width: 100%;">
				<c:if test="${MEM_ID eq map.TG_ID}">
					<!--  작성자일때만 보이게 -->
					<button class="btn btn-outline-success" onClick="location.href='/bang/togetherModifyForm.tr?TG_NUM=${map.TG_NUM}'">수정하기</button>
					<button class="btn btn-outline-success" onClick="return fn_togetherDelete()">삭제하기</button>
				</c:if>
				<c:if test="${MEM_ID != map.TG_ID}">
					<!-- 작성자가 아닐 경우에만 신고버튼 보이게 -->
					<input type="button" value="신고하기" class="btn btn-outline-success" onClick="return togetherReport()">
				</c:if>
				<button class="btn btn-outline-success" onClick="location.href='/bang/togetherList.tr'">목록보기</button>
			</div>
		</div>
		<br>
		<!-- 게시글 신고하기 -->
		<div class="report"></div>
	</div>
</body>
<!-- 게시글 삭제 스크립트 -->
<script type="text/javascript">
function fn_togetherDelete() {
	var TG_NUM = document.getElementById("TG_NUM").value;
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "togetherDelete.tr?TG_NUM=" + TG_NUM;
	}
}
</script>
<!-- 댓글 작성 스크립트 -->
<script>
$(document).ready(function(){
	$("#comWrite").click(function(){
		
		let bcNum = $("#TG_NUM").val();
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
					BC_TYPE : 'TG'
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
<!-- 댓글 삭제 스크립 -->
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
							'<input type="hidden" name="RP_BTYPE" value="W">' +
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
    
	<!-- 게시글 신고하기 -->
	<script>
	function togetherReport(){
		
		var report = $(".report");
		
		var item = '<form action="reportBoardWrite.tr" name="frm" id="frm" method="post" enctype="multipart/form-data">' + 
						'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
							'<input type="hidden" name="RP_RID" value="${map.TG_ID}">' +
							'<input type="hidden" name="RP_BTYPE" value="W">' +
							'<input type="hidden" name="RP_RNUM" value="${map.TG_NUM}">' +
							'<input type="hidden" name="RP_TITLE" value="${map.TG_TITLE}">' +
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
		var frm = document.getElementById('frm');
		var BC_NUM = document.getElementById('BC_NUM');
		
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