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
							<div>
								<div>
									<!-- 추후 멤버에 프로필 사진 추가하면 주석 해제 -->
									<%-- <image src="/resources/images/member/${list.MEM_IMAGE}" alt=""> --%>
								</div>
								<tbody class="items">			
									<tr>
										<td align="center" style="font-weight: bold;">${list.BC_ID }</td>
										<td align="center" colspan="3">${list.BC_COMMENT }</td>
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
							</div>
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
					<input type="button" value="신고하기" class="del btn btn-outline-success" onClick="return togetherReport()">
				</c:if>
				<button class="btn btn-outline-success" onClick="location.href='/bang/togetherList.tr'">목록보기</button>
				<c:if test="${MEM_ID != map.TG_ID}">	
					<button type="button" class="btn btn-outline-success" name="msgModal"
					 data-bs-toggle="modal" data-bs-target="#messageModal" data-bs-whatever="채팅 보내기">채팅</button>
				</c:if>					
			</div>
		</div>
		<br>
		<!-- 게시글 신고하기 -->
		<div class="report"></div>
	</div>
	
	<!-- 쪽지 Modal창  -->
	<div class="modal fade" id="messageModal"  tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					  <h1 class="modal-title fs-5" id="exampleModalLabel">title</h1>
					    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>받는 사람</label>
						<input class="form-control" value="${memList.MEM_NICKNAME}" readonly="readonly">
				</div>
					<div class="form-group">
					 <form id="msgModalForm" name="msgModalForm" class="needs-validation2" novalidate>
						<label>메세지</label>
							<div class='textLengthWrap'>
	                  			<span class='textCount'>0</span>
	                			 <span class='textTotal'>/ 666자</span>
	                 		 </div>
						<textarea cols="10" rows="10" class="form-control" name='CH_CONTENT' maxlength='666' id='CH_CONTENT' placeholder='메세지를 입력...' required></textarea>
						<div class="invalid-feedback text-start">
				        	쪽지 내용을 작성해주세요
				        </div>
					</form>
					</div>
					
				</div>
				<div class="modal-footer">
					 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					 <button type="button" class="btn btn-primary" name="sendChat" id="sendChat">전송</button>
				</div> <!-- /.modal-footer  -->
			</div> 
			<!-- /.modal-content -->
		</div> 
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->		
	
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
    
<script type="text/javascript">	
	// 쪽지 모달 설정
	const messageModal = document.getElementById('messageModal'); 
	messageModal.addEventListener('show.bs.modal', event => {
	   
	  const button = event.relatedTarget;
	  console.log(button);
	  
	  const recipient = button.getAttribute('data-bs-whatever');
	  const modalTitle = messageModal.querySelector('.modal-title');
	  

	  modalTitle.textContent = recipient;
	  
	}); // 모달 설정
	
$(document).ready(function() {	
	$("button[name='msgModal']").on("click", function(e) {  // 쪽지 버튼 클릭
		e.preventDefault();
		 fn_validate(); 
	});


	function fn_confirmMessage() { //쪽지 전송 전 confirm창 띄우기
		if(confirm("메세지를 전송하시겠습니까?")) {
			fn_sendChat();
		} else {
			return false;
		}		
	};
	
 	function fn_validate() { //쪽지 입력 글자수 표시, 글자수 제한
		   $('#CH_CONTENT').keyup(function () {
		  	  var inputLength = $(this).val().length;
		  	   
		  	  $('.textCount').html(inputLength);
		  	  
		  	  if(inputLength > 666) {
		  		  alert("내용을 최대 666글자로 작성해주세요.");
		  		  $('#CH_CONTENT').focus();
		  	      return false;
		  	  }
		    });
	};
		 
	   
	function fn_sendChat() { //쪽지 보내기
		var comSubmit = new ComSubmit("msgModalForm");
		comSubmit.setUrl("/bang/insertChat.tr");
		comSubmit.addParam("CH_TOID", ${map.TG_ID});
		comSubmit.addParam("CH_FROMID", ${memList.MEM_ID});
		comSubmit.addParam("viewName", "chat/chatList");
		comSubmit.submit();
	}; 

	//유효성 검사
	(() => {
		  'use strict'	  
	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const form1 = document.querySelector('.needs-validation2')

	  // Loop over them and prevent submission
		$("button[name='sendChat']").on("click", function(e) {  // 채팅 보내기
		e.preventDefault();
		form1.classList.add('was-validated')
		
		if (!form1.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	        return false;
	    }
		
		fn_confirmMessage(); //confirm창 띄우기
	  });
	})()
	
	
}); 
</script> 
 
    
</html>