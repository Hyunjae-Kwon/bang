<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
    <body>
	<!-- 메인 배너 (관광지 추천으로 링크 타고 갈 수 있도록 설정 예정)-->
    <div class="slider container-fluid">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                	<!-- 배너 이미지 누르면 이동하는 경로 -->
                    <a href="/bang/main.tr">
                        <img src="resources/images/slider/slid_1.jpg" class="d-block w-100" alt="..." style="max-height:500px;">
                        <!-- 배너 이미지 하단 설명 글, 필요 없을것 같아서 주석 처리 -->
                        <!-- <div class="detail-card">
                            <p>Pictures, abstract symbols the ingredients with symbols the
                            </p>
                        </div> -->
                    </a>
                </div>
                <div class="carousel-item">
                	<!-- 배너 이미지 누르면 이동하는 경로 -->
                    <a href="/bang/main.tr">
                        <img src="resources/images/slider/slid_2.jpg" class="d-block w-100" alt="..." style="max-height:500px;">
                        <!-- 배너 이미지 하단 설명 글, 필요 없을것 같아서 주석 처리 -->
                        <!-- <div class="detail-card">
                            <p>Pictures, abstract symbols the ingredients with symbols the
                            </p>
                        </div> -->
                    </a>
                </div>
                <div class="carousel-item">
                	<!-- 배너 이미지 누르면 이동하는 경로 -->
                    <a href="/bang/main.tr">
                        <img src="resources/images/slider/slid_3.jpg" class="d-block w-100" alt="..." style="max-height:500px;">
                        <!-- 배너 이미지 하단 설명 글, 필요 없을것 같아서 주석 처리 -->
                        <!-- <div class="detail-card">
                            <p>Pictures, abstract symbols the ingredients with symbols the
                            </p>
                        </div> -->
                    </a>
                </div>
            </div>
            <a
                class="carousel-control-prev"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a
                class="carousel-control-next"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    
	<!-- ################# 인기있는 여행 일정 Starts Here #######################--->   
    <div class="popular-pack container-fluid our-capablit" style="background-image: url(resources/images/hot_bg.jpg); background-size: cover;">
        <div class="container layy" style="max-width:1500px;">
            <div class="session-title">
                <h2>인기있는 여행 일정</h2>
                <p>회원님들의 여행일정 중 가장 조회수 (or 추천수?) 높은 일정입니다.</p>
            </div>
            <!-- 반복문 시작 -->
            <div class="row pack-row">
            	<c:forEach var="list" items="${trip}">
	                <div class="col-lg-4 col-md-6 col-sm-6">
	                    <div class="pack-col">
	                    	<a href="/bang/tripDetail.tr?TR_NUM=${list.TR_NUM}">
	                    		<img src="resources/images/packages/p1.jpg" alt="">
	                    		<!-- 여행 일정 작성 시 이미지 번호를 사용하여 이미지 호출, 지금은 일정 생성이 안되니 우선 주석 -->
	                    		<%-- <img src="resources/images/trip/trip_main_${list.TR_NUM}.png" alt=""> --%>
	                    	</a>
	                        
	                        <div class="revire row no-margin">
	                        	<!-- 별점 사용 여부에 따라 삭제 예정 우선 주석 처리 -->
	                            <!-- <ul class="rat">
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                                <li><i class="fa fa-star"></i></li>
	                            </ul> -->
	                            <span>조회수 | ${list.TR_CNT}&nbsp;</span>
	                            <span>추천수 | ${list.TR_LIKE}</span>
	                            <span class="pric">
	                                <fmt:formatDate value="${list.TR_REGDATE}" pattern="yyyy-MM-dd"/> 
	                            </span>
	                            <span class="pric">|</span>
	                            <span class="pric">
	                                ${list.TR_ID}
	                            </span>
	                        </div>
	                        <div class="detail row no-margin">
	                            <h4>${list.TR_TITLE}</h4>
	                            <p>${list.TR_CONTENT}</p>
	                        </div>
	                        <!-- 여행 일정에 버튼으로 추가할만한게 있으면 넣으면 좋을듯, 우선 주석 처리 -->
	                        <!-- <div class="options row no-margin">
	                            <ul>
	                                <li><i class="fas fa-car"></i></li>
	                                <li><i class="fab fa-fly"></i></li>
	                                <li><i class="fas fa-cocktail"></i></li>
	                                <li><i class="fas fa-umbrella-beach"></i></li>
	                                <li><i class="far fa-bell"></i></li>
	                            </ul>
	                        </div> -->
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <!--################### 담당자's Pick! 추천 여행지! Starts Here #######################--->
    <div class="destinations container-fluid">
       <div class="container">
            <div class="session-title">
                <h2>담당자's Pick! 추천 여행지!</h2>
                <p>담당자들이 직접 고른 추천 여행지입니다.</p>
            </div>
            <div class="dest-row row">
            	<c:forEach var="list" items="${recom}">
	                <div class="col-lg-4 col-md-6">
	                    <div class="dest-col">
	                        <div class="dest-img">
	                        	<a href="/bang/recommendDetail.tr?RC_NUM=${list.RC_NUM}">
		                    		<img src="resources/images/destination/d2.jpg" alt="">
		                    		<!-- 여행지 추천 작성 시 이미지 번호를 사용하여 이미지 호출, 지금은 생성이 안되니 우선 주석 -->
		                    		<%-- <img src="resources/images/recommend/recommend_main_${list.RC_NUM}.png" alt=""> --%>
		                    	</a>
	                        </div>
	                        <h3>${list.RC_TITLE}</h3>
	                        <p>${list.RC_CONTENT}</p>
	                        <button class="btn btn-outline-success" onClick="location.href='/bang/recommendDetail.tr?RC_NUM=${list.RC_NUM}'">상세 보기</button>
	                    </div>
	                </div>
                </c:forEach>
            </div>
       </div>
    </div> 
    
     <!--################### 동행 구합니다! Starts Here #######################--->   
     <div class="review container-fluid">
         <div class="container">
              <div class="session-title">
                <h2>동행 구합니다!</h2>
                <p>낯선 여행지, 낯선 사람들과의 새로운 여행!</p>
            </div>
            <div class="row review-row">
            	<c:forEach var="list" items="${together}">
	                <div class="col-md-6" style="max-width: 25%">
	                    <div class="review-col">
	                        <div class="profil">
	                        	<!-- 동행 구하기는 이미지 없음 -->
	                        </div>
	                        <div class="review-detail" style="max-width: 250px;">
	                            <a href="/bang/togetherDetail.tr?TG_NUM=${list.TG_NUM}">
	                            	<h4>${list.TG_TITLE}</h4>
	                            </a>
	                            <span style="float: right;">조회수 | ${list.TG_CNT}</span>
	                            <span style="float: right;">추천수 | ${list.TG_LIKE}&nbsp;&nbsp;</span>
	                            <p>${list.TG_CONTENT}</p>
	                            <h6>${list.TG_ID}</h6>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
         </div>
     </div>
     
   <!--*************** 여행 후기 Starts Here ***************-->
    <div class="container-fluid blog">
        <div class="container">
        	<div class="session-title">
                <h2>여행 후기</h2>
                <p>회원님들이 직접 다녀온 따끈따끈한 여행 후기입니다.</p>
            </div>
	        <div class="blog-row row">
	        	<c:forEach var="list" items="${review}">
		            <div class="col-lg-4 col-md-6 col-sm-6">
		               <div class="blog-col">
		               		<a href="/bang/reviewDetail.tr?RV_NUM=${list.RV_NUM}">
	                    		<img src="resources/images/destination/d1.jpg" alt="">
	                    		<!-- 여행 후기 작성 시 이미지 번호를 사용하여 이미지 호출, 지금은 여행 후기가 생성이 안되니 우선 주석 -->
	                    		<%-- <img src="resources/images/review/${list.RV_IMAGE}" alt=""> --%>
	                    	</a>
		                    <span>${list.RV_REGDATE}</span>
		                    <span style="float: right;">${list.RV_ID}</span>
		                    <h4>${list.RV_TITLE}</h4>
		                    <p>${list.RV_CONTENT}</p><br>
		                    <span style="float: right;">조회수 | ${list.RV_CNT}</span>
		                    <span style="float: right;">추천수 | ${list.RV_LIKE}&nbsp;&nbsp;</span><br>
		               </div>
		            </div>
				</c:forEach>
            </div>
        </div>
    </div>  
    
    <!-- ################# Why Choos US Starts Here #######################--->   
    <div class="why-choos-us container-fluid">
       <div class="container">
          <div class="session-title">
                <h2>Why Choos Us ?</h2>
                <p>Sagittis vulputate magna sagittis sagittis erat feugiat nullam cubilia amet dignissim Euismod.</p>
            </div>
            <div class="why-ro row">
                <div class="col-lg-4 col-md-6">
                    <div class="col-card">
                        <div class="icon">
                            <i class="far fa-calendar-plus"></i>
                        </div>
                        <div class="detail">
                            <h4>Easy Booking</h4>
                            <p>Turpis accumsan. Proin id ligula suspendisse. Aliquet fringilla, aptent eu dignissim.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="col-card">
                        <div class="icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div class="detail">
                            <h4>Value for Money</h4>
                            <p>Turpis accumsan. Proin id ligula suspendisse. Aliquet fringilla, aptent eu dignissim.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="col-card">
                        <div class="icon">
                           <i class="far fa-heart"></i>
                        </div>
                        <div class="detail">
                            <h4>Passionate Travel</h4>
                            <p>Turpis accumsan. Proin id ligula suspendisse. Aliquet fringilla, aptent eu dignissim.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="col-card">
                        <div class="icon">
                           <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <div class="detail">
                            <h4>Awesome Places</h4>
                            <p>Turpis accumsan. Proin id ligula suspendisse. Aliquet fringilla, aptent eu dignissim.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="col-card">
                        <div class="icon">
                            <i class="fas fa-car"></i>
                        </div>
                        <div class="detail">
                            <h4>Diverse Destinations</h4>
                            <p>Turpis accumsan. Proin id ligula suspendisse. Aliquet fringilla, aptent eu dignissim.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="col-card">
                        <div class="icon">
                            <i class="far fa-comments"></i>
                        </div>
                        <div class="detail">
                            <h4>24 x 7 Support</h4>
                            <p>Turpis accumsan. Proin id ligula suspendisse. Aliquet fringilla, aptent eu dignissim.</p>
                        </div>
                    </div>
                </div>
                
            </div> 
       </div>
    </div>
    
    <!--################### Tour Type Starts Here #######################--->
       <div id="why" class="our-capablit container-fluid">
           <div class="layy">
               <div class="container">
                  <div class="session-title">
                    <h2>Tour Type</h2>
                </div>
                  <div class="row mt-5">
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                               <i class="fas fa-walking"></i>
                           </div>
                           <h6>Walking</h6>
                       </div>
                   </div>
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                               <i class="fas fa-car"></i>
                           </div>
                           <h6>Safari</h6>
                       </div>
                   </div>
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                              <i class="fas fa-fire"></i>
                           </div>
                           <h6>Camp Fire</h6>
                       </div>
                   </div>
                   
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                               <i class="fab fa-fly"></i>
                           </div>
                           <h6>Air Ride</h6>
                          
                       </div>
                   </div>
                   
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                               <i class="fas fa-ship"></i>
                           </div>
                           <h6>Cruise</h6>
                          
                       </div>
                   </div>
                   
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                               <i class="fas fa-suitcase-rolling"></i>
                           </div>
                           <h6>Hiking</h6>
                          
                       </div>
                   </div>
                   
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                              <i class="fas fa-hippo"></i>
                           </div>
                           <h6>Wild Life</h6>
                          
                       </div>
                   </div>
                   
                    <div class="col-md-3 col-sm-6">
                       <div class="cap-det">
                           <div class="icon">
                               <i class="fas fa-baseball-ball"></i>
                           </div>
                           <h6>Sports</h6>
                          
                       </div>
                   </div>
                  </div>
               </div>
           </div>
       </div>
    </body>
</html>