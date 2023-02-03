	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
	.textLengthWrap {
				color: #747474;
			  	font-size: 12px;
			  	float:right;
			  	margin-top:10px;
			  	position:relative;
				}	
</style>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>"/>
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
	<br><br>
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
						<td scope="col">${map.TG_NUM }</td>
						<td scope="col" style="font-weight: bold;">조회수</td>
						<td scope="col">${map.TG_CNT }</td>
						<td scope="col" style="font-weight: bold;">작성일시</td>
						<td scope="col">${map.TG_REGDATE}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center" style="font-weight: bold;">제목</td>
						<td align="center" colspan="3">${map.TG_TITLE}</td>
						<td align="center" style="font-weight: bold;">작성자</td>
						<td align="center">${map.TG_ID}</td>
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
	<div align="center">
		<input type="button" value="수정" class="btn btn-outline-success" onClick="location.href='togetherModifyForm.tr?TG_NUM=${map.TG_NUM}'">
		<input type="button" value="목록" class="btn btn-outline-success" onClick="return fn_openList()">
	<c:if test="${map.TG_ID != null}">	
		<button type="button" class="btn btn-outline-success" name="msgModal"
		 data-bs-toggle="modal" data-bs-target="#messageModal" data-bs-whatever="쪽지 보내기">쪽지</button>
	</c:if>	
	</div>
	<br>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

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

	
<script type="text/javascript">
	function fn_openList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/togetherList.tr' />");
		comSubmit.submit();
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
</body>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="resources/js/script.js"></script>

</html>