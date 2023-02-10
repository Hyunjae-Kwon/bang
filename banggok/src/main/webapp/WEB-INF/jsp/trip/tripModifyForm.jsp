<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
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
#placesList2 .item {position:relative;border-bottom:1px solid #eaeaea;overflow: hidden;min-height: 65px;}
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
	
.searchBtn{
color: #0078FF;
border-color: #0078FF;
}

.searchBtn:hover{
background-color: #0078FF !important;
border-color: #0078FF !important; 
}
</style>
</head>
    <body>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
            	<h2>여행 일정 수정</h2>
            </div>
        </div>
    </div>
    
    <!--  ************************* 여행 일정 수정 Starts Here ************************** -->  
    <div class="row contact-rooo no-margin">
        <div class="container">
            <div class="row">
            	<form style="max-width: 100%; margin-left: 20px;" id="frm" name="frm" encType="multipart/form-data" method="post">
            		<br>
            		<div>
            			<h4>여행 일정 이름</h4>
            			<input type="text" id="TR_TITLE" name="TR_TITLE" value="${trip.TR_TITLE}" class="form-control input-sm">
            			<!-- <form>안에 input type="text"가 1개 있을 경우 -->
            			<!-- 입력 후 엔터시 새로고침 작동함, 이를 막기 위해 아래 코드 작성 -->
            			<input type="text" style="display:none;">
            			<input type="hidden" id="TR_ID" name="TR_ID" value="${trip.TR_ID}">
            			<input type="hidden" id="TR_NUM" name="TR_NUM" value="${trip.TR_NUM}">
    					<input type="hidden" id="maxDayNum" name="maxDayNum" value="${maxDayNum}">
            		</div>
            		<div>
						<label>썸네일 이미지 : </label>&nbsp;&nbsp;<img src="${trip.TR_IMAGE}" width="100" border="0">
					</div>
            		<div>
            			<label>썸네일 이미지 수정 : </label>&nbsp;&nbsp;<input type="file" id="TR_IMAGE" name="TR_IMAGE" value="">
            		</div>
            		<div>
            			<label>썸네일 이미지 미리보기 : </label>&nbsp;&nbsp;
            			<img src="resources/images/banggok_logo.png" border="0" id="preview-image" style="width: 100px; height: 100px; object-fit: contain;">
						<script>
							// input file에 change 이벤트 부여
							const inputImage = document.getElementById("TR_IMAGE");
							inputImage.addEventListener("change", e=> {
								readImage(e.target)
							});
						</script>
            		</div>
            		
            		<div class="row" style="margin-top: 15px; flex-wrap: nowrap;">
                		<!-- 여행 일정 -->
                		<div style="border-left: solid #eaeaea; height: 450px; overflow-y: auto;">
                			<h5 style="margin-left: 30px; margin-right: 20px;">여행 일정</h5>
                			<input type="button" value="추가" class="btn btn-outline-success btn-sm" onClick="addSch()" style="margin-left: 20px; margin-right: 5px;">
                			<input type="button" value="삭제" class="del btn btn-outline-success btn-sm" onClick="delSch()" style="margin-left: 5px; margin-right: 10px;">
                			<ul id="schList"></ul>
                		</div>
                		
                		<!-- 일정별 장소 리스트 -->                		
                		<div id="addListItem" style="border-left: solid #eaeaea; height: 450px; overflow-y: auto; width: 280px;"></div>
						
						<div style="border-left: solid #eaeaea; height: 450px;"></div>
	                </div>
	            </form>
                <div class="col-sm-5">
                    <div style="margin:20px" class="serv">
                    	<br><br><br><br><br><br>
                    	<!-- 카카오 지도 드로잉 기능 -->
                    	<div class="map_wrap">
						    <div id="map" style="width:700px;height:560px;position:relative;overflow:hidden;"></div>
						    <div id="menu_wrap" class="bg_white" style="height: 530px;">
						        <div class="option">
						            <div>
						                <form onsubmit="searchPlaces(); return false;">
						                    <b>키워드</b> : <input type="text" id="keyword" placeholder="키워드 입력!!" size="15">  
						                    <button class="com searchBtn btn btn-outline-success" type="submit" style="line-height: 1.6;">검색하기</button> 
						                </form>
						            </div>
						        </div>
						        <hr>
						        <ul id="placesList"></ul>
						        <div id="pagination"></div>
						    </div>
						</div>
                    </div>
                </div>
            </div>
            <br>
            <div>
            	<h3>여행 일정 내용</h3>
            	<!-- 글 작성 폼 -->
    			<textarea id="summernote" class="TR_CONTENT" name="TR_CONTENT" >${trip.TR_CONTENT}</textarea>
            </div>
            <!-- 하단 버튼 -->
            <div style="margin-top:10px;">
                <!-- <div style="padding-top:10px;" class="col-sm-3"><label></label></div> -->
                <div class="col-sm-8" style="max-width: 100%; text-align: center;">
                	<input type="button" class="btn btn-outline-success" value="수정하기" onclick="tripModify()">
                	<input type="button" class="del btn btn-outline-success" value="삭제하기" onclick="deleteTrip(${trip.TR_NUM})">
                	<input type="button" class="del btn btn-outline-success" onClick="tripCancel(${trip.TR_NUM})" value="취소하기">
                </div>
                <br>
            </div>
        </div>
    </div>
	</body>
    
    <!--  ************************* 여행 일정 수정 자바스크립트 ************************** -->
    <script>
 	function tripModify(){
 		var id = document.getElementById("TR_ID").value;
		var title = document.getElementById("TR_TITLE").value;
		var content = document.getElementById("summernote").value;
		var image = document.getElementById("TR_IMAGE").value;
		var trNum = document.getElementById("TR_NUM").value;
		
			if (!$("#TR_TITLE").val()) {
				alert("일정 제목을 입력하세요.");
				$("#TR_TITLE").focus();
				return false;
			}
			if (!$(".TR_CONTENT").val()) {
				alert("일정 내용을 입력하세요.");
				$(".TR_CONTENT").focus();
				return false;
			}
			if (!$("#TR_IMAGE").val()) {
				alert("썸네일 이미지를 등록하세요.");
				$("#TR_IMAGE").focus();
				return false;
			}
			
		var form = $("#frm")[0];
		var formData = new FormData(form);
		formData.append("TR_CONTENT", content);
		
			$.ajax({
				type: "POST",
				enctype: "multipart/form-data",
				url: "<c:url value='tripModify.tr'/>",
				data: formData,
				async: false,
				contentType: false,
				processData: false,
				cache: false,
				success: function(data){
					alert("게시글이 정상적으로 수정 되었습니다.");
					location.href="tripDetail.tr?TR_NUM=" + trNum;
				}	
	        });
		}
 	
 	function deleteTrip(TR_NUM) {
 		if (confirm("삭제하시겠습니까?") == true) {
 			location.href = "tripDelete.tr?TR_NUM=" + TR_NUM;		
 		}
 	}
 	
 	function tripCancel(TR_NUM){
 		var id = document.getElementById("TR_ID").value;
 		
 		if(confirm("여행 일정 수정을 취소하시겠습니까?") == true){
			$.ajax({
				type: "POST",
				url: "<c:url value='tripCancel.tr'/>",
				data: {TP_ID: id},
				success: function(data){
					location.href="tripDetail.tr?TR_NUM=" + TR_NUM;
				}
		    });
 		}
 	}
 	
 	
	</script>
	
	<!-- 카카오 지도 API, services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fa3a582f3278c83fd4f3031cc4f96d&libraries=services,clusterer,drawing"></script>
	
	<!-- 일정 및 방문 장소 리스트 -->
	<!-- 카카오 지도 Drawing Library에서 데이터 얻기 스크립트 -->
    <script>
	    /* 추가 장소 커스텀 마커를 담을 배열 */
		var addMarkers = [];
		
		/* 추가 장소 커스텀 오버레이를 담을 배열 */
		var customOverlays = [];
		
		/* 추가 장소 연결선을 담을 배열 */
		var polylines = [];
		
		/* 일정번호 초기값 */ 
		var dayNum = document.getElementById("maxDayNum").value - 1;
		
		/* 선택한 일정 목록 번호 */
		var dayIdx;
		
		addSch();
		
		/* 일정 추가 버튼 */
		function addSch(){
			console.log(dayNum);
			dayNum += 1;
			
			schList(dayNum);
		}
		
		/* 일정 삭제 버튼 */
		function delSch(){
			console.log(dayNum);
			if(dayNum>1){
				
				var trNum = document.getElementById("TR_NUM").value;
			
				/* 해당 일정 DB에서 삭제 */
				$.ajax({
					type: "POST",
					url: "<c:url value='modifyDelSch.tr'/>",
					data: {TP_TRNUM: trNum, TP_DATE: dayNum},
					success: function(data){
					}
				});
				dayNum -= 1;
			}
			schList(dayNum);
		}
		
		/* 여행 일정 Day 리스트 */
		function schList(dayNum){
			var dayList = document.getElementById('schList');
			dayList.innerHTML = '';
			
			var day = '';
			console.log(dayNum);
			for(var i=1; i<dayNum+1; i++){
				console.log(i);
				day += '<ul id="schList" class="schList">' + 
				  '<li class="day">' +
				  '<span id="selectNum">' +
				  '<a style="font-size: 25px; cursor:pointer; margin-left: 25px; margin-right: 25px;" onclick="placeList(' + i + ')">' + 
				  'DAY - ' + i + '</a>' +
				  '</span>' +
				  '</li>' + 
				  '</ul>';
			}
			
			dayList.innerHTML += day;
			
			/* 일정 목록 삭제시, 장소리스트 일정 번호가 동일 시 아래 function 동작 */
			if(dayNum+1 == dayIdx){
				/* 일정 추가 장소 리스트 초기화 */
				placeList();
				
				/* 지도에 표시되는 추가 장소 마커, 커스텀오버레이, 연결선 제거 */
				removeAddMarker();
			}
		}
		/* 방문 장소 리스트 배열 */
		var addPlace = [];
		
		placeList(1);
		
		/* 일정 선택 및 장소리스트 */
		function placeList(selectNum){
			var trNum = document.getElementById("TR_NUM").value;
			var place = document.getElementById("addListItem");
			var item = '';
			
			if(selectNum==null){
				place.innerHTML = '<h5 style="margin-left: 20px;">일정을 선택해 주세요.</h5>';
				dayIdx = selectNum;
				return false;
			}else{
				place.innerHTML = '<h5 id="selectNum" style="margin-left: 20px;">DAY - ' + selectNum + '일정 목록</h5>';
				dayIdx = selectNum;
			}
			
			/* 지도에 표시되는 추가 장소 마커, 커스텀오버레이, 연결선 제거 */
			removeAddMarker();
			
			$.ajax({
				url:"/bang/writePlaceList.tr",
				method:"GET",
				data: "TP_TRNUM=" + trNum + "&TP_DATE=" + selectNum,
				success:function(data){
					addPlace = data.writePlaceList;
					if(addPlace.length>0){
						for(var i=0; i<addPlace.length; i++){
							item += '<ul id="placesList2" class="placesLists">' + 
									'<li class="item">';
							if(i > 0){
								item += '<span style="text-align:right; color:blue; cursor:pointer;"' +
										'onclick="modifyUp(' + addPlace[i].TP_NUM + ',' + addPlace[i].TP_DATE + ');">▲</span>';
							}		
							item +=		'<h4 id=TP_PLACE style="font-size: 17px;"><b>' + addPlace[i].R +'. ' + addPlace[i].TP_PLACE + '</b></h4>';
							if(addPlace[i].TP_RADDRESS != null){
								item +=	'<span id="TP_RADDRESS">' + addPlace[i].TP_RADDRESS + '</span>';
							}
							if(addPlace[i].TP_ADDRESS != null){
								item +=	'<span id="TP_ADDRESS" class="jibun gray">' + addPlace[i].TP_ADDRESS + '</span>'; 
							}			
							if(addPlace[i].TP_PHONE != null){
								item +=	'<span class="tel" id="TP_PHONE">' + addPlace[i].TP_PHONE; 
							}
							item +=		'<input type="button" id="del" style="float: right; cursor:pointer;"' +
										'onclick="deletePlace(' + addPlace[i].TP_NUM + ',' + addPlace[i].TP_MAP_LAT + ',' + addPlace[i].TP_MAP_LNG + ')"' + 
										'value="장소 삭제"></span>';
							if(i < addPlace.length-1){
								item += '<span style="text-align:left; color:red; cursor:pointer;"' + 
										'onclick="modifyDown(' + addPlace[i].TP_NUM + ',' + addPlace[i].TP_DATE + ');">▼</span>';
							}
							item +=		'<span style="display: none;" id="TP_NUM">' + addPlace.TP_NUM + '</span>' +
										'<span style="display: none;" id="TP_MAP_LAT">' + addPlace[i].TP_MAP_LAT + '</span>' +
										'<span style="display: none;" id="TP_MAP_LNG">' + addPlace[i].TP_MAP_LNG + '</span>' +
										'<span style="display: none;" id="TP_DATE">' + addPlace[i].TP_DATE + '</span>' +
									'</li>' +
								'</ul>';
						}
					}else{
						item = '<p style="margin-left: 20px;">방문하실 장소를 추가해주세요.</p><br>';
					}
					place.innerHTML += item;
					
					/* 추가 장소 리스트 커스텀 마커, 오버레이, 연결선 지도에 표시 */
					addPlaceMarker(addPlace);
				}
			});
		}
	
		/* 검색 결과 마커를 담을 배열 */
		var markers = [];
		
		/* 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다 */
		var bounds = new kakao.maps.LatLngBounds();
		
		/* points 배열에 아무것도 없을 때 기본 위치를 지정하는 배열 */
		var center = [];
		center.push(new kakao.maps.LatLng(37.566826, 126.9786567));
		
		/* 지도를 표시할 div */
		var mapContainer = document.getElementById('map'),  
		    mapOption = {
				/* 지도의 중심좌표 */
		        center: new kakao.maps.LatLng(37.566826, 126.9786567),
		        /* 지도의 확대 레벨 */
		        level: 3
		    };  
	
		/* 지도 생성 */    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		/* 장소 검색 객체 생성 */
		var ps = new kakao.maps.services.Places();  
	
		/* 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성 */
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		/* 키워드 검색 요청 함수 */
		function searchPlaces() {
	
		    var keyword = document.getElementById('keyword').value;
	
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
	
		    /* 장소검색 객체를 통해 키워드로 장소검색을 요청 */
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
	
		/* 장소검색이 완료됐을 때 호출되는 콜백함수 */
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
	
		        /* 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출 */
		        displayPlaces(data);
	
		        /* 페이지 번호를 표출 */
		        displayPagination(pagination);
	
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
	
		    } else if (status === kakao.maps.services.Status.ERROR) {
	
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
	
		    }
		}
	
		/* 검색 결과 목록과 마커를 표출하는 함수 */
		function displayPlaces(places) {
	
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    /* 검색 결과 목록에 추가된 항목들을 제거 */
		    removeAllChildNods(listEl);
	
		    /* 지도에 표시되고 있는 마커를 제거 */
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
	
		        /* 마커를 생성하고 지도에 표시 */
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            /* 검색 결과 항목 Element를 생성 */
		            itemEl = getListItem(i, places[i]);
		            
		        /* 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 */
		        /* LatLngBounds 객체에 좌표를 추가 */
		        bounds.extend(placePosition);
	
		        /* mouseout 했을 때는 인포윈도우를 닫습니다 */
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
	
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
	
		         	/* 마커와 검색결과 항목에 mouseover 했을때 인포윈도우에 장소명을 표시 */
			        itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
	
		         	/* mouseout 했을 때는 인포윈도우 다음 */
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		            
		        })(marker, places[i].place_name);
		        
		        fragment.appendChild(itemEl);
		    }
	
		    /* 검색결과 항목들을 검색결과 목록 Element에 추가 */
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
	
		    /* 검색된 장소 위치를 기준으로 지도 범위를 재설정 */
		    map.setBounds(bounds);
		}
	
		/* 검색결과 항목을 Element로 반환하는 함수 */
		function getListItem(index, places) {
			
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		              '<div class="info">' +
		              '   <h5 id="place">' + places.place_name + '</h5>';
	
		    if (places.road_address_name) {
		        itemStr += '    <span id="roadAddress">' + places.road_address_name + '</span>' +
		                    '   <span id="address" class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span id="address">' +  places.address_name  + '</span>'; 
		    }
		    itemStr += '  <span class="tel" id="phone">' + places.phone  + 
		    		   '<button style="float: right;" id="addPlaceData" onClick="addListItem(\'' + 
		    				   places.place_name + '\',\'' + places.road_address_name + '\',\'' + places.address_name + '\',\'' + places.phone + '\')">장소 추가</button></span>' +
		    		   '</div>';           
	
		    el.innerHTML = itemStr;
		    el.className = 'item';		    
		    return el;
		}
		
		/* 검색 결과 마커 생성 */
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
	
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
		    return marker;
		}
		
		/* 일정 추가 장소 DB 추가 */
		function addListItem(tpPlace, tpAddress, tpRaddress, tpPhone) {
			if(dayIdx == null){
				alert('일정을 선택해 주세요.');
				return false;
			}
			
			/* 위도 경도 구하기 */
			var markerPosition = infowindow.getPosition();
			
			var markerLat = markerPosition.getLat();
			var markerLng = markerPosition.getLng();
			
			var lat = markerLat.toString();
			var lng = markerLng.toString();
			
			var id = document.getElementById("TR_ID").value;
			
			/* 추가한 장소 DB에 저장 */
			$.ajax({
					type: "POST",
					url: "<c:url value='addPlaceList.tr'/>",
					data: {TP_ID: id, TP_PLACE: tpPlace, TP_ADDRESS: tpAddress, TP_RADDRESS: tpRaddress, TP_PHONE: tpPhone, TP_MAP_LAT: lat, TP_MAP_LNG: lng, TP_DATE: dayIdx},
					success: function(data){
						var selectNum = dayIdx;
						
						placeList(selectNum);
					}
		        });
		}
		
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
		}
		
		/* 추가 장소 순서 Up */
		function modifyUp(tpNum, tpDate){
			var id = document.getElementById("TR_ID").value;
			var trNum = document.getElementById("TR_NUM").value;
			var selectNum = dayIdx;
			
			/* 추가 장소 DB에서 순서 Up */
			$.ajax({
 				type: "POST",
 				url: "<c:url value='placeModifyUp.tr'/>",
 				data: {TP_ID:id, TP_TRNUM:trNum, TP_NUM:tpNum, TP_DATE:tpDate},
 				success: function(data){
 					placeList(selectNum);
 				}
			});
		}
		
		/* 추가 장소 순서 Down */
		function modifyDown(tpNum, tpDate){
			var id = document.getElementById("TR_ID").value;
			var trNum = document.getElementById("TR_NUM").value;
			var selectNum = dayIdx;
			
			/* 추가 장소 DB에서 순서 Down */
			$.ajax({
 				type: "POST",
 				url: "<c:url value='placeModifyDown.tr'/>",
 				data: {TP_ID:id, TP_TRNUM:trNum, TP_NUM:tpNum, TP_DATE:tpDate},
 				success: function(data){
 					
 					placeList(selectNum);
 				}
			});
		}
		
		/* 추가한 장소 삭제하기 */
		function deletePlace(tpNum, lat, lng){
			
			var id = document.getElementById("TR_ID").value;
			var selectNum = dayIdx;
			
			/* 추가한 장소 DB에서 삭제 */
			$.ajax({
					type: "POST",
					url: "<c:url value='delPlaceList.tr'/>",
					data: {TP_NUM:tpNum,TP_MAP_LAT:lat, TP_MAP_LNG:lng, TP_ID:id},
					success: function(data){
						
						placeList(selectNum);
					}
			});
		};
		
		/* 지도 위에 표시되는 검색하기 마커를 모두 제거합니다 */
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		/* 지도 위에 추가된 마커, 커스텀오버레이, 연결선 제거 */
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
		
		/* 검색결과 목록 하단에 페이지 표시 함수 */
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
	
		    /* 기존에 추가된 페이지번호 삭제 */
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
	
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
	
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
	
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
	
		/* 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수 */
		/* 인포윈도우에 장소명을 표시 */
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
	
		/* 검색결과 목록의 자식 Element를 제거하는 함수입니다 */
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
	
		/* LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정 */
		/* 이때 지도의 중심좌표와 레벨이 변경될 수 있음 */
		function setBounds() {
			
			map.setBounds(bounds);
		}
	</script>

	<!-- summernote 스크립트 -->
	<script>
	$('#summernote').summernote({
		  /* 에디터 높이 */
	  height: 150,
	  /* 에디터 한글 설정 */
	  lang: "ko-KR",
	  /* 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.) */
	  focus : true,
	  toolbar: [
		 	 /* 글꼴 설정 */
		    ['fontname', ['fontname']],
		    /* 글자 크기 설정 */
		    ['fontsize', ['fontsize']], 
		    /* 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기 */
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    /* 글자색 */
		    ['color', ['forecolor','color']],
		    /* 표만들기 */
		    ['table', ['table']],
		    /* 글머리 기호, 번호매기기, 문단정렬 */
		    ['para', ['ul', 'ol', 'paragraph']],
		    /* 줄간격 */
		    ['height', ['height']],
		    /* 그림첨부, 링크만들기, 동영상첨부 */
		    ['insert',['picture','link','video']],
		    /* 코드보기, 확대해서보기, 도움말 */
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  /* 추가한 글꼴 */
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 /* 추가한 폰트사이즈 */
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		
		/* 이미지 파일을 서버에 저장하고, 이미지를 호출 할 수 있는 URL을 리턴 받아서 입력하면,
			이미지가 삽입된 것 처럼 보임 */
		callbacks : { 
        	onImageUpload : function(files, editor, welEditable) {
        /* 파일 업로드(다중업로드를 위해 반복문 사용) */
        for (var i = files.length - 1; i >= 0; i--) {
        uploadSummernoteImageFile(files[i],
        this);
        		}
        	}
        }
	}); 

	/* 파일 업로드를 위한 Ajax */
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile.tr",	/* 이미지 업로드 경로 */
			contentType : false,
			enctype : 'multipart/form-data',	/* 파일 업로드를 위해 꼭 이대로 써줘야함 */
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);	/* 이미지를 삽입할 수 있도록 해줌 */
			}
		});
	}	
	</script>
	
	<script>
	/* 이미지 미리보기 스크립트 */
	function readImage(input) {
		/* 인풋 태그에 파일이 있는 경우 */
		if(input.files && input.files[0]) {
			
			/* FileReader 인스턴스 생성 */
			const reader = new FileReader();
			
			/* 이미지가 로드가 된 경우 */
			reader.onload = e => {
				const previewImage = document.getElementById("preview-image");
				previewImage.src = e.target.result;
			};
			
			/* reader가 이미지 읽도록 하기 */
			reader.readAsDataURL(input.files[0]);
		}	
	}
	</script>
</html>