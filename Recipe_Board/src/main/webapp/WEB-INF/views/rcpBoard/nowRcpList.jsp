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


<!-- 경고창 이쁜거 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav2.jsp"%>

	<div class="container">
		<!-- Section-->
		<section class="py-5">

			<c:if test="${isUser == 'not'}">
				<script>
					swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning')
							.then(function() {
								location.href = "../member/signin";
							});
				</script>
			</c:if>
			
			<div class="row text-center pt-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">RECIPE</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col-1"></div>
				
				<div class="col-10">
					<div class="container px-4 px-lg-5 mt-5">
						<div
							class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		
							<c:forEach items="${rcpList}" var="rcpList">
		
								<div class="col mb-5">
									<div class="card h-100">
										<!-- 레시피 image-->
										<img class="card-img-top" src="${rcpList.att_file_no_main}" />
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
													href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}">
													살펴보기 </a>
											</div>
										</div>
									</div>
								</div>
		
							</c:forEach>
		
						</div>
					</div>
					
					<!-- 페이지 처리 -->
					<div class="row">
						<div class="col-6">
							<form class="row g-2">
								<div class="col-auto">
									<input type="number" id="num" name="num" value=1 class="visually-hidden">
									<input class="form-control" type="number" id="count" name="count" min="1" max="5" value="${count}">
								</div>
								<div class="col-auto">
									<button type="submit" id="ingreAdd" class="btn btn-outline-success">포함할 재료 개수</button>
								</div>
							</form>
  						</div>
						<div class="col-6">
							<ul class="pagination justify-content-end">
								<li class="page-item"><c:if test="${prev_m}">
										<a
											class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
											href="/rcpBoard/nowRcpList?count=${count}&num=${rcpStartPageNum - 1}${rcpSearchTypeKeyword}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a>
									</c:if></li>
			
								<c:forEach begin="${rcpStartPageNum}" end="${rcpEndPageNum}"
									var="num">
									<span> <c:if test="${rcpSelect != num}">
											<li class="page-item"><a
												class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
												href="/rcpBoard/nowRcpList?count=${count}&num=${num}${rcpSearchTypeKeyword}">${num}</a>
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
											href="/rcpBoard/nowRcpList?count=${count}&num=${rcpEndPageNum + 1}${rcpSearchTypeKeyword}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a>
									</c:if></li>
			
							</ul>
						</div>
						
					</div>
					
					<div class="col-1"></div>
					
					<div class="row align-items-center">
						<div class="col-2"></div>
						<div class="col-2">
							<select class="form-select" name="rcpSearchType">
								<option value="rcpTitle"
									<c:if test="${rcpSearchType eq 'rcpTitle'}"> selected </c:if>>제목</option>
							</select>
						</div>
						<div class="col-4">
							<input class="form-control me-2" type="text" name="rcpKeyword"
								value="${rcpKeyword}" placeholder="검색" aria-label="Search">
						</div>
						<div class="col-2">
							<button class="btn btn-outline-success" type="submit"
								id="rcpSearchBtn">검색</button>
						</div>
						<div class="col-2"></div>
					</div>
					
				</div>
			</div>
		</section>

		<script>
			document.getElementById("rcpSearchBtn").onclick = function() {
				let rcpSearchType = document.getElementsByName("rcpSearchType")[0].value;
				let rcpKeyword = document.getElementsByName("rcpKeyword")[0].value;

				location.href = "/rcpBoard/nowRcpList?num=1&count=2&rcpSearchType="
						+ rcpSearchType + "&rcpKeyword=" + rcpKeyword;
			};
		</script>
	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>