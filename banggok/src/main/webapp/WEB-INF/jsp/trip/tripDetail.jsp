<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
#placesList2 .item {position:relative;border-bottom:1px solid #eaeaea;overflow: hidden;cursor: pointer;min-height: 65px; padding-bottom: 10px;}
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
</style>
</head>
    <body>
    <form id="ftm" name="frm" action="/bang/tripDelete.tr">
    	<input type="hidden" id="TR_NUM" name="TR_NUM" value="${trip.TR_NUM}">
    	<c:if test="${MEM_ID != null}">
    		<input type="hidden" id="BC_ID" name="BC_ID" value="${MEM_ID}">
    	</c:if>
    </form>
    <!--  ************************* Page Title Starts Here ************************** -->
    <div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
            	<p>${trip.TR_ID}님의 여행 일정입니다.</p>
                <h2>${trip.TR_TITLE}</h2>
            </div>
        </div>
    </div>
    <!-- ################# 게시물 상세 내용 Starts Here ####################### -->  
    <div class="row contact-rooo no-margin">
        <div class="container">
        	<div>
        		<div class="row cont-row">
                    <div class="col-sm-3"><label>작성일</label><span>:</span></div>
                    <div class="col-sm-8">${trip.TR_REGDATE}</div>
                </div>
                <div class="row cont-row">
                    <div class="col-sm-3"><label>조회수</label><span>:</span></div>
                    <div class="col-sm-8">${trip.TR_CNT}</div>
                    <div class="col-sm-3"><label>추천수</label><span>:</span></div>
                    <div class="col-sm-8">${trip.TR_LIKE}</div>
                </div>
        	</div>
            <div class="row">
                <div style="max-width: 100%; margin-left: 20px;">
                	<div class="row" style="margin-top: 15px; flex-wrap: nowrap; margin-right: 0px;">
                		<div style="border-left: solid #eaeaea; height: 515px;">
                			<h5 style="margin-left: 20px; margin-right: 25px;">여행 일정</h5>
                			<p style="margin-left: 20px; margin-right: 25px;">여행 기간 : </p><br>
                			<h3 style="margin-left: 20px; margin-right: 25px;">DAY 01</h3>
                		</div>
	                    <div id="addListItem" style="border-left: solid #eaeaea; height: 515px; overflow-y: auto; width: 280px;">
	                    	<h5 style="margin-left: 20px;">방문 예정 장소</h5><br>
	                    	<!-- <p style="margin-left: 20px;">방문하실 곳을 추가해주세요.</p><br> -->
	                    	<c:forEach var="list" items="${tripplace}">
		                    	<ul id="placesList2" class="placesLists" style="padding-bottom: 15px;">
		                    		<li class="item">
		                    			<h5 id="place">${list.TP_PLACE}</h5>
		                    			<span id="roadAddress">${list.TP_RADDRESS}</span>
		                    			<span id="address" class="jibun gray">${list.TP_ADDRESS}</span>
		                    			<span class="tel" id="tel">${list.TP_PHONE}</span>
		                    			<span style="display: none;" id="lat">${list.TP_MAP_LAT}</span>
		                    			<span style="display: none;" id="lng">${list.TP_MAP_LNG}</span>
		                    		</li>
		                    	</ul>
	                    	</c:forEach>
	                    </div>
	                    <div style="border-left: solid #eaeaea; height: 515px;"></div>
                	</div>
                </div>
                <div class="col-sm-5" style="padding-left: 0px;">
                    <div style="margin:20px" class="serv">
                    	<!-- 카카오 지도 드로잉 기능 -->
                    	<div class="map_wrap">
						    <div id="map" style="width:800px;height:100%;position:relative;overflow:hidden;"></div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <div style="max-width: 100%; margin-left: 40px;">
    	<h4>댓글</h4>
    <!-- ################# 댓글 내용 Starts Here ####################### -->
    <div id="commentList">
    	<c:choose>
			<c:when test="${fn:length(comment) > 0}">
				<c:forEach var="list" items="${comment}">
		    		<div>
		    			<div>
		    				<!-- 추후 멤버에 프로필 사진 추가하면 주석 해제 -->
		    				<%-- <image src="/resources/images/member/${list.MEM_IMAGE}" alt=""> --%>
		    			</div>
		    			<div>
		    				<div>
		    					<span>
		    						${list.BC_ID}|
		    						<span class="pric">
			                        	<fmt:formatDate value="${list.BC_REGDATE}" pattern="yyyy-MM-dd"/> 
			                   		</span>
		    					</span>
		    					<p>
		    						${list.BC_COMMENT}
		    				</div>
		    			</div>
		    			<div style="font-size:8pt; color:gray; padding-right:10px; " >
		    			<c:if test="${MEM_ID != null}">	    				
			    				<input type="button" value="답글 달기">			    			
		    			</c:if>
		    			<c:if test="${MEM_ID eq list.BC_ID}">
		    					<input type="button"  onClick="comDelete(${list.BC_BCID})" value="삭제 하기">
		    			</c:if>
		    			</div>
		    		</div>
		    	</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
    </div>
    <div style="display:inline-block; width:88%;">
    	<textarea name="comment" id="comment" width="88%" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
    </div>
    <div style="display:inline-block; float:right; width:10%;">
    	<input type="button" id="comWrite" class="btn btn-primary py-2 px-2" value="작성하기" >
    </div>
	<form id="commonForm" name="commonForm"></form>
	
	 <!-- 하단 버튼 (목록으로 돌아가기, 수정하기, 삭제하기, 추천하기 등) -->
    <div style="margin-top:10px;" align="center">
        <!-- <div style="padding-top:10px;" class="col-sm-3"><label></label></div> -->
        <div class="col-sm-8" style="max-width: 100%;">
         <c:if test="${MEM_ID eq trip.TR_ID}">  <!--  작성자일때만 보이게 -->
        	<button class="btn btn-success btn-sm" onClick="location.href='/bang/tripModifyForm.tr?TR_NUM=${trip.TR_NUM}'">수정하기</button>
        	<button class="btn btn-success btn-sm" onClick="return fn_tripDelete()">삭제하기</button>
        </c:if>
        <c:if test="${MEM_ID != trip.TR_ID }">  <!-- 작성자가 아닐 경우에만 추천버튼 보이게 -->
			<input type = "button" class="btn btn-success btn-sm" onclick="return fn_recommendLike()" value="추천하기">
      	</c:if>
            <button class="btn btn-success btn-sm" onClick="location.href='/bang/tripList.tr'">목록보기</button>
        </div>
    </div>
    </div>
    </body>
    <!-- 댓글 내용 작성 후 작성하기 눌렀을 때 동작하는 댓글 입력 함수 -->
    <script>
    $(document).ready(function(){
    	
    	setBounds();
    	
    	/* 댓글 작성하기 */
    	$("#comWrite").click(function(){
    		
    		let bcNum = $("#TR_NUM").val();
    		let bcId = $("#BC_ID").val();
    		let content = $("#comment").val();
    		content = content.trim();
    		
    		if(content == ""){
    			alert("내용을 입력하세요.");
    		} else {
    			$("#comment").val("");
    			
    			$.ajax({
    				url : "/bang/tripComWrite.tr",
    				type : "GET",
    				data : {
    					BC_NUM : bcNum,
    					BC_ID : bcId,
    					BC_COMMENT : content
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
    <script>
	    /* 댓글 삭제하기 */
		function comDelete(num){
			console.log("aa");
			$.ajax({
				url: "/bang/comDelete.tr",
				type: "POST",
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
    <script>
	    function fn_tripDelete(){
			var comSubmit = new ComSubmit();
			var CONFIRM = confirm("정말로 삭제하시겠습니까?");
			
			if(CONFIRM==true){
				comSubmit.setUrl("/bang/tripDelete.tr");
				comSubmit.addParam("TR_NUM", $("#TR_NUM").val());
				comSubmit.submit();
				alert("삭제가 완료되었습니다.");
			}
		}
    </script>
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
    
    <!-- 카카오 지도 API, services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fa3a582f3278c83fd4f3031cc4f96d&libraries=services,clusterer,drawing"></script>
	<!-- 카카오 지도 Drawing Library에서 데이터 얻기 스크립트 -->
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	/* 방문 예정 장소들의 이름이 포함된 노드를 담을 배열 */
	var placeNode = [];
	
	placeNode = document.querySelectorAll("#place");
	
	/* 방문 예정 장소들의 위도와 경도가 포함된 노드를 담을 배열 */
	var latNode = [];
	var lngNode = [];
	
	latNode = document.querySelectorAll("#lat");
	lngNode = document.querySelectorAll("#lng");
	
	/* 지도 범위 재설정을 위해 위도 경도 정보를 저장할 배열 */
	var points = [];
	
	for(let i = 0; i < placeNode.length; i ++){
		const latItem = latNode.item(i);
		const lngItem = lngNode.item(i);
		const placeItem = placeNode.item(i);
		
		points.push(new kakao.maps.LatLng(latItem.innerText, lngItem.innerText)); 
		// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: points[i] // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: placeItem.innerText // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    (function(marker, infowindow) {
	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	            infowindow.open(map, marker);
	        });
	
	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            infowindow.close();
	        });
	    })(marker, infowindow);
	}
	
	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	    path: points, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();    

	var i;
	for (i = 0; i < points.length; i++) {
	    
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(points[i]);
	}

	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}

	</script>
</html>