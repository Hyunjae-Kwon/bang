<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<!--  ************************* Page Title Starts Here ************************** -->
	<div class="page-nav no-margin row">
		<div class="container">
			<div class="row">
				<h2>여행지 추천</h2>
				<ul>
					<li><a href="recommendWriteForm.tr"><i class="fas fa-blog"></i>글쓰기</a></li>
					<li><i class="fas fa-angle-double-right"></i> Gallery</li>
				</ul>
			</div>
		</div>
	</div>
	<!--  ************************* 관광지 추천 Gallery Starts Here ************************** -->
	<section class="ftco-section">

		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
				</div>
			</div>
		</div>
		<form action="recommendList.tr" method="GET">
			<div class="container">
				<div class="row">
					<div class="container" align="center">
						<div class="row">
							<c:forEach var="recommend" items="${recommendList}">
								<div class="col-md-6 col-lg-3 ftco-animate"
									style="float: left; width: 33%; padding: 10px;">
									<div class="recommend">
										<a href="/bang/recommendDetail.tr?RC_NUM=${recommend.RC_NUM}"
											class="img-prod"><img class="img-fluid"
											src="resources/images/gallery/${recommend.RC_IMAGE}"
											style="height: 250px;"></a>
										<div class="text py-3 pb-4 px-3 text-center">
											<h5>
												<a href="/bang/recommendDetail.tr?RC_NUM=${recommend.RC_NUM}">${recommend.RC_TITLE}</a>
											</h5>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>
