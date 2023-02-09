<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <style>
.textLengthWrap {
				color: #747474;
			  	font-size: 12px;
			  	float:right;
			  	right:100;
			  	position:relative;
				}	
</style>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<c:forEach var="list" items="${list}">
      <c:if test="${map.MEM_ID ne list.CH_FROMID}">
      <!-- 받은 메세지 -->
      <div class="incoming_msg">
         <div class="incoming_msg_img">
         	<c:choose>
         		<c:when test="${map.MEM_BLOCK=='Y'}">
                	<img class="img" src="/resources/images/traveler.png" alt="sunil">
		        </c:when>
<%-- 		      	<c:otherwise>
		      		<a href="/ns/seller/info?MEM_ID=${list.FROMID}">
		      			<img class="img" src="/resources/images/기본 프사.png" alt="sunil">
		      		</a>
		      	</c:otherwise> --%>
		     </c:choose> 		
         </div>
         <div class="received_msg">
            <div class="received_withd_msg" style="word-break:break-all;">
               <p>${list.CH_CONTENT}</p>
               <span class="time_date"> ${list.CH_SENDTIME}</span>
            </div>
         </div>
      </div>
      </c:if>
      

      <!-- 보낸 메세지 -->   
      <c:if test="${map.MEM_ID eq list.CH_FROMID}">
      <div class="outgoing_msg" style="word-break:break-all;">
         <div class="sent_msg">
            <p>${list.CH_CONTENT}</p>
            <span class="time_date"> ${list.CH_SENDTIME}</span>
         </div>
      </div>
      </c:if>

</c:forEach>