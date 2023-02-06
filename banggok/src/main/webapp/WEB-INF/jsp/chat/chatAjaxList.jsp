<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.col-13 {
				white-space:nowrap;
				max-width:100%;
				overflow:hidden;
				text-overflow:ellipsis;
				font-size:12px;
				padding:0 0 0 0px;
				}
	 .h522{
				white-space:nowrap;
				max-width:60%;
				overflow:hidden;
				text-overflow:ellipsis;
				font-size:17px;
				} 
</style> 
<%@ include file="/WEB-INF/include/include-body.jspf"%>

<c:forEach var="list" items="${list}" varStatus="status">
   <div class="chat_list_box${list.CH_ROOM} chat_list_box">
      <div type="button" class="chat_list" room="${list.CH_ROOM}" chatToId="${list.CH_TOID}" chatFromId="${list.CH_FROMID}" mem_block="${nicknameList[status.index].MEM_BLOCK}">
         <!-- active-chat -->
         <div class="chat_people">
            <div class="chat_img" >
               <a href="#">
                  <img class="img" src="resources/images/traveler.png" alt="sunil" >
               </a>
            </div>
            <div class="chat_ib">
            	<div class="d-flex justify-content-between">
               		<div class="h522">${nicknameList[status.index].MEM_NICKNAME}</div><div class="chat_date" style="font-size:0.5em;">${list.CH_SENDTIME}</div>
            	</div>
             	<div class="d-flex justify-content-between">
             		<div class="col-13">${list.CT_CONTENT}</div>
                 	<div class="col-2 unread${list.CH_ROOM}">
                     	<c:if test="${unreadList[status.index].UNREAD > 0}">
                        <div class="badge bg-danger" style="font-size:0.5em; color:#ffffff">${unreadList[status.index].UNREAD}</div>
                    </c:if>
                 	</div>
                    
             </div>
            
               <div class="row">
               </div>
            </div>
         </div>
      </div>
   </div>
</c:forEach>