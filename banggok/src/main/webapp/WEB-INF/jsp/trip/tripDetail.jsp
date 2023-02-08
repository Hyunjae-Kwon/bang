<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/board.css'/>" />
<!-- 카카오 지도 스타일 -->
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
#placesList2 {margin-left: 5px; margin-right: 5px;}
#placesList2 li {list-style: none; font-size:14px;}
#placesList2 .item {position:relative;border-bottom:1px solid #eaeaea;overflow: hidden;min-height: 65px; padding-bottom: 10px;}
#placesList2 .item span {display: block;margin-top:4px;}
#placesList2 .item h5, #placesList2 .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList2 .item .info{padding:10px 0 10px 55px;}
#placesList2 .info .head {font-size: 18px;}
#placesList2 .info .gray {color:#8a8a8a;}
#placesList2 .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList2 .info .tel {color:#009900;}
#placesList2 .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList2 .item .marker_1 {background-position: 0 -10px;}
#placesList2 .item .marker_2 {background-position: 0 -56px;}
#placesList2 .item .marker_3 {background-position: 0 -102px}
#placesList2 .item .marker_4 {background-position: 0 -148px;}
#placesList2 .item .marker_5 {background-position: 0 -194px;}
#placesList2 .item .marker_6 {background-position: 0 -240px;}
#placesList2 .item .marker_7 {background-position: 0 -286px;}
#placesList2 .item .marker_8 {background-position: 0 -332px;}
#placesList2 .item .marker_9 {background-position: 0 -378px;}
#placesList2 .item .marker_10 {background-position: 0 -423px;}
#placesList2 .item .marker_11 {background-position: 0 -470px;}
#placesList2 .item .marker_12 {background-position: 0 -516px;}
#placesList2 .item .marker_13 {background-position: 0 -562px;}
#placesList2 .item .marker_14 {background-position: 0 -608px;}
#placesList2 .item .marker_15 {background-position: 0 -654px;}

#addPlaceData{
  border: 1px solid #14863d;
  border-radius: 5px;
  text-align: center;
  color: #14863d;
  cursor: pointer;
}

#addPlaceData:hover{
  background-color: green;
  color: #fff;
}

#addPlaceData:focus{
  box-shadow: 0 0 0 2px black;
  background-color: green;
  color: #fff;
}
.customoverlay {position:relative;bottom:73px;border-radius:4px;border: 2px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay .item {display:block;float:left; text-decoration:none;padding:8px 8px;color:#000;text-align:center;border-radius:3px;font-size:11px;font-weight:bold;background: #FA8072;}
.customoverlay .title {display:block;text-align:center;background:#fff;padding:8px 15px;font-size:11px;font-weight:bold;border-radius:3px;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

.hide{
display: none;
}
</style>
</head>
<body>
	
	<form id="ftm" name="frm" action="/bang/tripDelete.tr">
		<input type="hidden" id="TR_NUM" name="TR_NUM" value="${trip.TR_NUM}">
		<c:if test="${MEM_ID != null}">
			<input type="hidden" id="MEM_ID" name="BC_ID" value="${MEM_ID}">
		</c:if>
	</form>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<p>${trip.TR_ID}님의여행 일정입니다.</p>
				<h2>${trip.TR_TITLE}</h2>
			</div>
		</div>
	</div>
	
	<!--  ************************* 게시물 상세 내용 Starts Here ************************** -->
	<div class="row contact-rooo no-margin">
		<div class="container">
			<div>
				<div class="row cont-row">
					<div class="col-sm-1.5">
						<span style="color: gray;">◎ 작성일: <b style="color: black;"><fmt:formatDate value="${trip.TR_REGDATE}" pattern="yyyy-MM-dd"/></b> / </span>
					</div>
					<div class="col-sm-0.7">
						<span style="color: gray;">조회수: <b style="color: black;">${trip.TR_CNT}</b> /</span>
					</div>
					<div class="col-sm-0.7">
						<span style="color: gray;">추천수: <b style="color: black;">${trip.TR_LIKE}</b></span>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="max-width: 100%; margin-left: 20px;">
					<div class="row" style="margin-top: 15px; flex-wrap: nowrap; margin-right: 0px;">
						<!-- 여행 일정 -->
						<div style="border-left: solid #eaeaea; height: 515px; overflow-y: auto;">
							<h5 style="margin-left: 20px; margin-right: 25px;">여행 일정</h5>
							<p style="margin-left: 20px; margin-right: 25px;">여행 기간 :</p>
							<br>
							<c:forEach var="day" items="${dayNum}">
							<ul id="schList" class="schList"> 
				  				<li class="day">
				  					<span id="selectNum">
				  						<a style="font-size: 25px; cursor:pointer; margin-left: 25px; margin-right: 25px;" 
				  							onclick="placeList(${day.TP_DATE})">DAY-${day.TP_DATE}</a>
				  					</span>
				  				</li>
				  			</ul>
				  			</c:forEach>
						</div>
						
						<!-- 일정별 장소 리스트 -->
						<div id="addListItem" style="border-left: solid #eaeaea; height: 515px; overflow-y: auto; width: 280px;"></div>
						
						<div style="border-left: solid #eaeaea; height: 515px;"></div>
					</div>
				</div>
				<div class="col-sm-5" style="padding-left: 0px;">
					<div style="margin: 20px" class="serv">
						<!-- 카카오 지도 드로잉 기능 -->
						<div class="map_wrap">
							<div id="map" style="width: 800px; height: 100%; position: relative; overflow: hidden;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  ************************* 댓글 내용 Starts Here ************************** -->
	<div style="display: inline-block; width: 78%; margin-left: 96px;">
   		<textarea name="comment" id="comment" class="form-control" rows ="1" placeholder="댓글을 입력해주세요."></textarea>
	</div>
	<div style="display: inline-block; float: right; width: 10%; margin-right: 40px;" >
		<input type="button" value="댓글쓰기"  id="comWrite" class="btn btn-primary py-2 px-2">
	</div>
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
								<!-- 추후 멤버에 프로필 사진 추가하면 주석 해제 -->
								<%-- <image src="/resources/images/member/${list.MEM_IMAGE}" alt=""> --%>
							</div>
							<tbody class="items">			
								<tr>
									<td align="center" style="font-weight: bold;">${list.BC_ID }</td>
									<td align="center" style="text-align: left;" colspan="3">${list.BC_COMMENT }</td>
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
						<td colspan="6" style="padding: 0px;"><input type="button" id="add" style="width: 1070px; height: 30px;" value="더보기"></td>
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
				<c:if test="${MEM_ID eq trip.TR_ID}">
					<!--  작성자일때만 보이게 -->
					<button class="btn btn-outline-success" onClick="location.href='/bang/tripModifyForm.tr?TR_NUM=${trip.TR_NUM}'">수정하기</button>
					<button class="del btn btn-outline-success" onClick="deleteTrip(${trip.TR_NUM})">삭제하기</button>
					<c:if test="${trip.TR_SHARE eq 'Y' }">
						<button class="del btn btn-outline-success" 
						onClick="location.href='/bang/tripShare.tr?TR_NUM=${trip.TR_NUM}&TR_SHARE=${trip.TR_SHARE}'">공유취소</button>
					</c:if>
					<c:if test="${trip.TR_SHARE eq 'N' }">
						<button class="btn btn-outline-success" 
						onClick="location.href='/bang/tripShare.tr?TR_NUM=${trip.TR_NUM}&TR_SHARE=${trip.TR_SHARE}'">공유하기</button>
					</c:if>
				</c:if>
				<c:if test="${MEM_ID != trip.TR_ID }">
					<!-- 작성자가 아닐 경우에만 추천, 신고버튼 보이게 -->
					<input type="button" class="btn btn-outline-success" onclick="return fn_recommendLike()" value="추천하기">
					<input type="button" value="신고하기" class="del btn btn-outline-success" onClick="return tripReport()">
				</c:if>
				<button class="btn btn-outline-success" onClick="location.href='/bang/tripList.tr'">목록보기</button>
			</div>
		</div>
		<br>
		<!-- 게시글 신고하기 -->
		<div class="report"></div>
	</div>
</body>

<!-- 댓글 더보기 -->
<script>
$(document).ready(function(){
	var com = $(".items");
	var cnt = 0;
	
	console.log(com);
	
	addCom();
	console.log(com.length);
	console.log(cnt);
	function addCom(){
		for(let i = cnt; i < com.length; i ++){
			console.log(i);
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
});
</script>

<!-- 카카오 지도 API, services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fa3a582f3278c83fd4f3031cc4f96d&libraries=services,clusterer,drawing"></script>

<!-- 일정 및 방문 장소 리스트 -->
<!-- 카카오 지도 Drawing Library에서 데이터 얻기 스크립트 -->
<script>
	/* 방문 장소 리스트 배열 */
	var addPlace = [];
	
	/* 추가 장소 커스텀 마커를 담을 배열 */
	var addMarkers = [];
	
	/* 추가 장소 커스텀 오버레이를 담을 배열 */
	var customOverlays = [];
	
	/* 추가 장소 연결선을 담을 배열 */
	var polylines = [];
	
	placeList(1);

	/* 일정 선택 및 장소리스트 */
	function placeList(selectNum){
		var trNum = document.getElementById("TR_NUM").value;
		var place = document.getElementById("addListItem");
		var item = '';
		
		
		place.innerHTML = '<h5 id="selectNum" style="margin-left: 20px;">DAY - ' + selectNum + '일정 목록</h5>';
		
		//dayIdx = selectNum;
		
		/* 지도에 표시되는 추가 장소 마커, 커스텀오버레이, 연결선 제거 */
		removeAddMarker();
		
		$.ajax({
			url:"/bang/tripPlaceDetail.tr",
			method:"GET",
			data: "TP_TRNUM=" + trNum + "&TP_DATE=" + selectNum,
			success:function(data){
				addPlace = data.tripPlace;
				for(var i=0; i<addPlace.length; i++){
					item += '<ul id="placesList2" class="placesLists">' + 
							'<li class="item">' +
								'<h5 id=TP_PLACE>' + addPlace[i].R +'. ' + addPlace[i].TP_PLACE + '</h5>';
					if(addPlace[i].TP_RADDRESS != null){
						item +=	'<span id="TP_RADDRESS">' + addPlace[i].TP_RADDRESS + '</span>';
					}
					if(addPlace[i].TP_ADDRESS != null){
						item +=	'<span id="TP_ADDRESS" class="jibun gray">' + addPlace[i].TP_ADDRESS + '</span>'; 
					}			
					if(addPlace[i].TP_PHONE != null){
						item +=	'<span class="tel" id="TP_PHONE">' + addPlace[i].TP_PHONE; 
					}
					item +=		'<span style="display: none;" id="TP_NUM">' + addPlace.TP_NUM + '</span>' +
								'<span style="display: none;" id="TP_MAP_LAT">' + addPlace[i].TP_MAP_LAT + '</span>' +
								'<span style="display: none;" id="TP_MAP_LNG">' + addPlace[i].TP_MAP_LNG + '</span>' +
								'<span style="display: none;" id="TP_DATE">' + addPlace[i].TP_DATE + '</span>' +
							'</li>' +
						'</ul>';
				}
				
				place.innerHTML += item;
				
				/* 추가 장소 리스트 커스텀 마커, 오버레이, 연결선 지도에 표시 */
				addPlaceMarker(addPlace);
			}
		});
	}

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다 */

	/* 추가 장소 커스텀 마커, 오버레이, 연결선 */
	function addPlaceMarker(addPlace){
		/* 추가한 장소 list를 담을 배열입니다. */
		var placeNode = [];
		
		placeNode = addPlace;
		
		var addPoints = [];
		
		for(let i = 0; i < placeNode.length; i ++){
			/* 방문 예정 장소들의 위도와 경도가 포함된 노드를 담을 배열 */
			var addLat = placeNode[i].TP_MAP_LAT;
			var addLng = placeNode[i].TP_MAP_LNG;
			
			/* 추가 장소 위치 */
			addPoints[i] = new kakao.maps.LatLng(addLat, addLng);
			
			/* 커스텀 마커 이미지 */
			var imageSrc = 'resources/images/marker.png',
		  	    imageSize = new kakao.maps.Size(30, 30),
			    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
					addMarker = new kakao.maps.Marker({
		        	position: addPoints[i], // 마커의 위치
		        	image: markerImage // 마커 이미지
		    });
	    	
			/* 지도 위에 커스텀 마커를 표출 */
			addMarker.setMap(map); 
			/* 배열에 생성된 커스텀 마커를 추가 */
			addMarkers.push(addMarker); 
			
		    /* 커스텀오버레이 */
			var content = '<div class="customoverlay">' +
		    	'  <span class="item">' + placeNode[i].R + '</span>' +
		    	'  <span class="title">' + placeNode[i].TP_PLACE; + '</span>' +
		    	'  <span style="display: none;" id="TP_DATE">' + placeNode[i].TP_DATE + '</span>' +
		    	'</div>',
		    		customOverlay = new kakao.maps.CustomOverlay({
			    	position: addPoints[i],
			    	content: content,
			    	yAnchor: 0.05
			});
		    	
		    /* 지도 위에 커스텀 오버레이를 표출 */
			customOverlay.setMap(map); 
			/* 배열에 생성된 커스텀 오버레이를 추가 */
			customOverlays.push(customOverlay); 
		}
		
		/* 지도에 표시할 선을 생성 */
		var polyline = new kakao.maps.Polyline({
		    path: addPoints, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FFAE00', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});

		/* 지도 위 추가 장소 연결선을 표시 */ 
		polyline.setMap(map);
		/* 배열에 생성된 연결선 추가 */
		polylines.push(polyline);
		
		if(addPoints.length>0){		
			/* 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체 생성 */
			bounds = new kakao.maps.LatLngBounds();
						
			for (var i=0; i< addPoints.length; i++) {
			    /* LatLngBounds 객체에 추가장소 리스트 좌표 추가 */
			    bounds.extend(addPoints[i]);
			}
			
			/* 추가 장소 위치를 기준으로 지도 범위를 재설정 */
			map.setBounds(bounds);
		}
		
		/* LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정 */
		/* 이때 지도의 중심좌표와 레벨이 변경될 수 있음 */
		function setBounds() {
			map.setBounds(bounds);
		}
		
	}
	
	/* 지도 위에 추가 된 커스텀 마커, 오버레이, 연결선 제거 */
	function removeAddMarker() {
		for(var i=0; i < addMarkers.length; i++){
			addMarkers[i].setMap(null);
		}
		addMarkers = [];
		
		for(var i=0; i < customOverlays.length; i++){
			customOverlays[i].setMap(null);
		}
		customOverlays = [];
		
		for(var i=0; i < polylines.length; i++){
			polylines[i].setMap(null);
		}
		polylines = [];
	}
</script>

<!-- 댓글 내용 작성 후 작성하기 눌렀을 때 동작하는 댓글 입력 함수 -->
<script>
	$(document).ready(function(){
		
   	/* 댓글 작성하기 */
   	$("#comWrite").click(function(){
   		
   		let bcNum = $("#TR_NUM").val();
   		let bcId = $("#MEM_ID").val();
   		let content = $("#comment").val();
   		content = content.trim();
   		
   		if(content == ""){
   			alert("내용을 입력하세요.");
   		} else {
   			$("#comment").val("");
   			
   			$.ajax({
   				url : "/bang/comWrite.tr",
   				type : "GET",
   				data : {
   					BC_NUM : bcNum,
   					BC_ID : bcId,
   					BC_COMMENT : content,
   					BC_TYPE : 'T'
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
function tripReport(){
	
	var report = $(".report");
	
	var item = '<form action="reportBoardWrite.tr" name="frmReport" id="frmReport" method="post" enctype="multipart/form-data">' + 
					'<div style="display: inline-block; width: 88%; margin-left: 20px;">' + 
						'<input type="hidden" name="RP_RID" value="${trip.TR_ID}">' +
						'<input type="hidden" name="RP_BTYPE" value="T">' +
						'<input type="hidden" name="RP_RNUM" value="${trip.TR_NUM}">' +
						'<input type="hidden" name="RP_TITLE" value="${trip.TR_TITLE}">' +
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

<!-- 게시글 삭제하기 -->
<script>
function deleteTrip(TR_NUM) {
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "tripDelete.tr?TR_NUM=" + TR_NUM;		
	}
}

function fn_search(pageNo){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myTripList.tr' />");
	comSubmit.addParam("currentPageNo", pageNo);
	comSubmit.submit();
}
</script>

<!-- 게시글 추천하기 -->
<script type="text/javascript">
function fn_recommendLike() {
  
  	var tr_num = "${trip.TR_NUM}";
  	var comSubmit = new ComSubmit();
  	var CONFIRM = confirm("추천하시겠습니까?");
  	if(CONFIRM == true) {
		comSubmit.setUrl("/bang/tripLike.tr");
		comSubmit.addParam("TR_NUM", tr_num);
      comSubmit.submit();
      alert("추천되었습니다.");
      
      }
  }
</script>
</html>