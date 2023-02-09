<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<img src="resources/images/slider/slid_1.jpg" class="d-block w-100" alt="..." style="max-height: 500px;">
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
						<img src="resources/images/slider/slid_2.jpg" class="d-block w-100" alt="..." style="max-height: 500px;">
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
						<img src="resources/images/slider/slid_3.jpg" class="d-block w-100" alt="..." style="max-height: 500px;">
						<!-- 배너 이미지 하단 설명 글, 필요 없을것 같아서 주석 처리 -->
						<!-- <div class="detail-card">
                            <p>Pictures, abstract symbols the ingredients with symbols the
                            </p>
                        </div> -->
					</a>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!-- ################# 인기있는 여행 일정 Starts Here #######################--->
	<div class="popular-pack container-fluid our-capablit" style="background-image: url(resources/images/hot_bg.jpg); background-size: cover;">
		<div class="container layy" style="max-width: 1500px;">
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
								<img src="${list.TR_IMAGE}" alt="썸네일 없음">
							</a>

							<div class="revire row no-margin">
								<span>조회수 | ${list.TR_CNT}&nbsp;</span>
								<span>추천수 | ${list.TR_LIKE}</span>
								<span class="pric">
									<fmt:formatDate value="${list.TR_REGDATE}" pattern="yyyy-MM-dd" />
								</span>
								<span class="pric">|</span>
								<span class="pric"> ${list.TR_ID} </span>
							</div>
							<div class="detail row no-margin">
								<h4>${list.TR_TITLE}</h4>
							</div>
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
									<img src="${list.RC_IMAGE}" alt="썸네일 없음" style="width: 340px; height: 245px; object-fit: contain;">
								</a>
							</div>
							<h3>${list.RC_TITLE}</h3>
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
							<!-- 프로필 이미지 -->
							<div class="profil" style="padding: 0px; padding-right: 10px;"></div>
							<div class="review-detail" style="max-width: 250px;">
								<a href="/bang/togetherDetail.tr?TG_NUM=${list.TG_NUM}">
									<h4>${list.TG_TITLE}</h4>
								</a>
								<span style="float: right;">조회수 | ${list.TG_CNT}</span>
								<span style="float: right;">추천수 | ${list.TG_LIKE}&nbsp;&nbsp;</span>
								<h6 class="tgId">${list.TG_ID}</h6>
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
								<img src="${list.RV_IMAGE}" alt="썸네일 없음" style="width: 360px; height: 260px; object-fit: contain;">
							</a> <span>${list.RV_REGDATE}</span> <span style="float: right;">${list.RV_ID}</span>
							<h4>${list.RV_TITLE}</h4>
							<span style="float: right;">조회수 | ${list.RV_CNT}</span>
							<span style="float: right;">추천수 | ${list.RV_LIKE}&nbsp;&nbsp;</span><br>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	var tgId = $(".tgId");
	var addImg = $(".profil");
	var mem = [];
	
	for(let i = 0; i < tgId.length; i ++){
		var item = '';
		var id = tgId[i].innerText;
		$.ajax({
			url:"/bang/getMemberImage.tr",
			method:"GET",
			data: {MEM_ID : id},
			async: false,
			success: function(data){
				
				mem = data.memImg;
				
				item += '<img style="width: 88px; height: 88px;" src="http://localhost:8080/bang/getProfileFile.tr?filename=' + mem.MEM_IMAGE + '" alt="썸네일 없음">'
				
				addImg[i].innerHTML += item;
			}
		});
	}
});
</script>
</html>