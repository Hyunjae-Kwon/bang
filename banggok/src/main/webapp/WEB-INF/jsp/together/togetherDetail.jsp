<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>" />
</head>
<style>
.hide{
display: none;
}
</style>
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
			<div style="display: inline-block; width: 90%;">
		   		<textarea style="height: 100px;" name="comment" id="comment" class="form-control" rows ="1" placeholder="댓글을 입력해주세요."></textarea>
			</div>
			<div style="display: inline-block; float: right; width: 10%;" >
				<input type="button" value="댓글쓰기" style="margin: 28px;" id="comWrite" class="btn btn-primary py-2 px-2">
			</div>
		</div>
	</div>
	<div style="padding: 0px 140px 10px 140px;">
		<h5 style="float: left;">총 댓글 수 </h5>&nbsp;<span id="cntPlace"></span>
	</div>
	<div class="board-list">
		<div class="container">
			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<c:choose>
					<c:when test="${fn:length(comment) > 0}">
						<c:forEach var="list" items="${comment}">
							<tbody class="items">			
								<tr>
									<td class="profil"></td>
									<td class="comId" style="text-align: left; font-weight: bold;">${list.BC_ID }</td>
									<td align="center" style="text-align: left;">${list.BC_COMMENT }</td>
									<td align="center" style="font-weight: bold;">
									<fmt:formatDate value="${list.BC_REGDATE}" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<input type="hidden" id="BC_ID" name="BC_ID" value="${list.BC_ID}">
										<input type="hidden" id="BC_BCID" name="BC_BCID" value="${list.BC_BCID }">
										<input type="hidden" id="BC_COMMENT" name="BC_COMMENT" value="${list.BC_COMMENT}">
										<c:if test="${MEM_ID != null}">
											<input type="button" class="com btn btn-outline-success" value="답글">			
											<input type="button" class="com del btn btn-outline-success" value="신고" name="reportCom">
										</c:if>	
										<c:if test="${MEM_ID eq list.BC_ID}">
											<input type="button" class="com del btn btn-outline-success" onClick="comDelete(${list.BC_BCID})" value="삭제">
										</c:if>
									</td>
								</tr>
								<!-- 댓글 신고하기 입력 칸 -->
								<tr class="reportSpace"></tr>
							</tbody>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div align="center">
			<table>
				<tbody>
					<tr>
						<td colspan="6" style="padding: 0px;"><input type="button" id="add" style="cursor: pointer; background: none; border: 0px; width: 1070px; height: 60px;" value="댓글 더보기"></td>
					<tr>
				</tbody>
			</table>
		</div>
		<!-- 댓글 끝 -->
		<br>
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
					<input type="button" value="신고하기" class="del btn btn-outline-success" onClick="return togetherReport()">
				</c:if>
				<button class="btn btn-outline-success" onClick="location.href='/bang/togetherList.tr'">목록보기</button>
				<c:if test="${MEM_ID != map.TG_ID}">
					<!-- 작성자가 아닐 경우에만 채팅버튼 보이게 -->
					<input type="button" value="채팅하기" name="chatBtn"class="del btn btn-outline-success" onClick="return sendChat()">
				</c:if>
			</div>
		</div>
		<br>
		<!-- 게시글 신고하기 -->
		<div class="report"></div>
		<!-- 채팅 보내기 -->
		<div class="chat"></div>
	</div>
</body>
<script>
$(document).ready(function(){
	/* 댓글 더보기 */
	var com = $(".items");
	var cnt = 0;
	
	addCom();
	
	function addCom(){
		for(let i = cnt; i < com.length; i ++){
			if(i < cnt + 10){
				com[i].classList.remove('hide')
			}
			if(i > cnt + 9){
				com[i].classList.add('hide')
			}
		};
	}
	
	$("#add").click(function(){
		cnt += 10;
		addCom();
	});
	
	/* 댓글 수 */
	var comCnt = com.length;
	var cntPlace = document.getElementById("cntPlace");
	cntPlace.innerText = comCnt;
	
	/* 댓글 프로필 이미지 */
	var comId = $(".comId");
	var addImg = $(".profil");
	var mem = [];
	
	for(let i = 0; i < comId.length; i ++){
		var item = '';
		var id = comId[i].innerText;
		$.ajax({
			url:"/bang/getMemberImage.tr",
			method:"GET",
			data: {MEM_ID : id},
			async: false,
			success: function(data){
				
				mem = data.memImg;
				
				item += '<img style="width: 50px; height: 50px; border-radius: 50%;" src="http://localhost:8080/bang/getProfileFile.tr?filename=' + mem.MEM_IMAGE + '" alt="썸네일 없음">'
				
				addImg[i].innerHTML += item;
			}
		});
	}
});
</script>
<!-- 게시글 삭제 스크립트 -->
<script>
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
		
		var reportCom = $(".items").eq(index).find(".reportSpace");
		
		var itemCom = '<td colspan="7" class="reportCom">' + 
						'<form action="reportComWrite.tr" name="frm" id="frmCom" method="post" enctype="multipart/form-data">' + 
							'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
								'<input type="hidden" name="RP_RID" value="' + RP_RID + '">' +
								'<input type="hidden" name="RP_BTYPE" value="RC">' +
								'<input type="hidden" name="RP_RNUM" value="' + RP_RNUM + '">' +	
								'<input type="hidden" name="RP_TITLE" value="' + RP_TITLE + '">' +
								'<input type="hidden" name="RP_ID" value="${MEM_ID}">' +
								'<textarea name="RP_CONTENT" id="RP_CONTENT" class="form-control" placeholder="신고 내용을 입력해주세요."></textarea>' +
							'</div>' +
							'<div style="display: inline-block; float: right; width: 10%;">' +
								'<input type="button" value="신고하기" onclick="reportCom()" class="btn btn-primary py-2 px-2">' +
							'</div>' +
						'</form>' +
					  '</td>';
					  
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
    
    <!-- 채팅 보내기 -->
    <script>
    
    function sendChat(){
    	
    	var chat = $(".chat");
    	
		var item = '<form action="insertChat.tr" name="frm" id="chatFrm" method="post" enctype="multipart/form-data">' + 
						'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
							'<input type="hidden" name="CH_FROMID" value="${MEM_ID}">' +
							'<input type="hidden" name="CH_TOID" value="${map.TG_ID}">' +
							'<textarea name="CH_CONTENT" id="CH_CONTENT" class="form-control" placeholder="채팅 내용을 입력해주세요."></textarea>' +
						'</div>' +
						'<div style="display: inline-block; float: right; width: 10%;">' +
							'<input type="button" value="전송" onclick="chatBoard()" class="btn btn-primary py-2 px-2">' +
						'</div>' +
					'</form>';
				chat.append(item);
				
				return chat;
				    }
    
    function chatBoard(){
    	var frm = document.getElementById('chatFrm');   	
    	
		if (!$("#CH_CONTENT").val()) {
	        alert("내용을 입력하세요.");
	        $("#CH_CONTENT").focus();
	        return false;
	     }
		frm.submit();
	    alert("채팅 전송 완료.");
	}
       
    </script>
</html>