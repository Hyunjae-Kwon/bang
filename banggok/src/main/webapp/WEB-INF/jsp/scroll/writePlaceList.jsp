<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(writePlaceList) > 0}">
			<c:forEach var="list" items="${writePlaceList}">
				<ul id="placesList2" class="placesLists">
					<li class="item">
						<h5 id=TP_PLACE>${list.R}. ${list.TP_PLACE}</h5> 
						<span id="TP_RADDRESS">${list.TP_RADDRESS}</span> 
						<span id="TP_ADDRESS" class="jibun gray">${list.TP_ADDRESS}</span> 
						<span class="tel" id="TP_PHONE">${list.TP_PHONE}<input type="button" id="del" style="float: right;" onclick="deletePlace(${list.TP_NUM}, ${list.TP_MAP_LAT}, ${list.TP_MAP_LNG})" value="장소 삭제"></span>						 
						<span style="display: none;" id="TP_NUM">${list.TP_NUM}</span>
						<span style="display: none;" id="TP_MAP_LAT">${list.TP_MAP_LAT}</span>
						<span style="display: none;" id="TP_MAP_LNG">${list.TP_MAP_LNG}</span>
					</li>
				</ul>			
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p style="margin-left: 20px;">방문하실 장소를 추가해주세요.</p><br>
		</c:otherwise>
	</c:choose>
</body>
</html>