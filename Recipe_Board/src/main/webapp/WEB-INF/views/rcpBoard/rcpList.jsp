<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>모먹지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="../../resources/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="../../resources/img/favicon.ico">

<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/templatemo.css">
<link rel="stylesheet" href="../../resources/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../../resources/css/fontawesome.min.css">

<script src="../../resources/js/jquery-1.11.0.min.js"></script>
<script src="../../resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/templatemo.js"></script>
<script src="../../resources/js/custom.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
		window.onload = function(){
			if(${result == 'first'}){
				swal({
					title: '냉장고로 이동',
					text: '냉장고에 식재료를 입력하지 않으면, 일부 기능이 제한될 수 있습니다. 이동하시겠습니까?',
					icon : 'info',
					closeOnClickOutside: false,
					buttons : {
						cancle : {
							text : '네',
							value : false
						},
						confirm : {
							text : '아니오',
							value : true
						}
					}
				}).then((result) => {
					if(result){
						location.href='/rcpBoard/rcpList?num=1';
					}else {
						location.href='/refri/refriTypeList';
					}
				});	
			}
		};
</script>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>

	<div id="template-mo-zay-hero-carousel" class="carousel slide"
		data-bs-ride="carousel">

		<c:if test="${list.size == 0}">
			<script>
				swal('조회된 레시피가 없습니다', 'info').then(
						function() {
							location.href = "/rcpBoard/rcpList?num=1";
						});
			</script>
		</c:if>

		<ol class="carousel-indicators">
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="1"></li>
			<li data-bs-target="#template-mo-zay-hero-carousel"
				data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<div class="col-8 align-items-center">
								<img class="img-fluid img-thumbnail"
									src="${rcpImg1.att_file_no_main}" alt="">
							</div>
						</div>
						<div class="col-md-4 col-lg-6 mb-0 d-flex align-items-center">
							<div class="text-align-left align-self-center">
								<h1 class="h1 text-success">
									<strong>${rcpImg1.rcp_nm}</strong>
								</h1>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<div class="col-8 align-items-center">
								<img class="img-fluid img-thumbnail"
									src="${rcpImg2.att_file_no_main}" alt="">
							</div>
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
							<div class="text-align-left">
								<h1 class="h1 text-success">
									<strong>${rcpImg2.rcp_nm}</strong>
								</h1>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="container">
					<div class="row p-5">
						<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
							<div class="col-8 align-items-center">
								<img class="img-fluid img-thumbnail "
									src="${rcpImg3.att_file_no_main}" alt="">
							</div>
						</div>
						<div class="col-lg-6 mb-0 d-flex align-items-center">
							<div class="text-align-left">
								<h1 class="h1 text-success">
									<strong>${rcpImg3.rcp_nm}</strong>
								</h1>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
		</a>
	</div>

	<section class="container py-3">
		<div class="row text-center pt-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">Categories</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-3 p-3 mt-3">
				<a href="/rcpBoard/nowRcpList?num=1&count=2"><img
					src="${rcpImg4.att_file_no_main}"
					class="img-thumbnail img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">바로조리 가능</h2>
				<p class="text-center">
					<a class="btn btn-success"
						href="/rcpBoard/nowRcpList?num=1&count=2">Go!</a>
				</p>
			</div>

			<div class="col-12 col-md-3 p-3 mt-3">
				<a href="/rcpBoard/rcpKindTypeList?num=1&rcpType=밥"><img
					src="${rcpImg1.att_file_no_main}"
					class="img-thumbnail img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">요리 종류</h2>
				<p class="text-center">
					<a class="btn btn-success"
						href="/rcpBoard/rcpKindTypeList?num=1&rcpType=밥">Go!</a>
				</p>
			</div>

			<div class="col-12 col-md-3 p-3 mt-3">
				<a href="/rcpBoard/rcpKindTypeList?num=1&rcpCookM=볶기"><img
					src="${rcpImg2.att_file_no_main}"
					class="img-thumbnail img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">조리 방법</h2>
				<p class="text-center">
					<a class="btn btn-success"
						href="/rcpBoard/rcpKindTypeList?num=1&rcpCookM=볶기">Go!</a>
				</p>
			</div>

			<div class="col-12 col-md-3 p-3 mt-3">
				<a href="/rcpBoard/rcpAllList?num=1"><img
					src="${rcpImg3.att_file_no_main}"
					class="img-thumbnail img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">전체 보기</h2>
				<p class="text-center">
					<a class="btn btn-success" href="/rcpBoard/rcpAllList?num=1">Go!</a>
				</p>
			</div>
		</div>
	</section>

	<div class="container">
		<!-- Section-->
		<hr>
		<section class="py-5">
			<div class="row text-center pt-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">RECIPE</h1>
				</div>
			</div>

			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

					<c:forEach items="${rcpList}" var="rcpList">

						<div class="col mb-5">
							<div class="card h-100">
								<!-- 레시피 image-->
								<a href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}"> <img
									class="card-img-top" src="${rcpList.att_file_no_main}" />
								</a>

								<!-- 레시피 details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- 레시피 name-->
										<h5 class="fw-bolder">
											<a href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}"
												style="text-decoration: none; color: #476268;">${rcpList.rcp_nm}</a>
										</h5>
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}"> 살펴보기
										</a>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>

			<div class="row">
				<ul class="pagination pagination-lg justify-content-end">
					<li class="page-item"><c:if test="${prev_m}">
							<a
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								href="/rcpBoard/rcpList?num=${rcpStartPageNum - 1}${rcpSearchTypeKeyword}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if></li>

					<c:forEach begin="${rcpStartPageNum}" end="${rcpEndPageNum}"
						var="num">
						<span> <c:if test="${rcpSelect != num}">
								<li class="page-item"><a
									class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
									href="/rcpBoard/rcpList?num=${num}${rcpSearchTypeKeyword}">${num}</a>
								</li>
							</c:if> <c:if test="${rcpSelect == num}">
								<li class="page-item disabled" aria-current="page"><a
									class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
									href="#">${num}</a></li>
							</c:if>
						</span>
					</c:forEach>

					<li class="page-item"><c:if test="${next_m}">
							<a
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								href="/rcpBoard/rcpList?num=${rcpEndPageNum + 1}${rcpSearchTypeKeyword}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if></li>

				</ul>
			</div></div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>