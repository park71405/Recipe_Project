<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>뭐 먹지</title>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/styles.css" rel="stylesheet" />

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>

	<div class="container">
		<!-- Section-->
		<section class="py-5">
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
											<a href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}" style="text-decoration:none; color: #476268;">${rcpList.rcp_nm}</a>
										</h5>
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto" href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}">
											살펴보기
										</a>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</section>

		<nav aria-label="Page navigation example">
			<ul class="pagination  justify-content-center">
				<li class="page-item"><c:if test="${prev}">
						<a class="page-link"
							href="/rcpBoard/rcpList?num=${rcpStartPageNum - 1}${rcpSearchTypeKeyword}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>

				<c:forEach begin="${rcpStartPageNum}" end="${rcpEndPageNum}"
					var="num">
					<span> <c:if test="${rcpSelect != num}">
							<li class="page-item"><a class="page-link"
								href="/rcpBoard/rcpList?num=${num}${rcpSearchTypeKeyword}">${num}</a>
							</li>
						</c:if> <c:if test="${rcpSelect == num}">
							<li class="page-item active" aria-current="page"><a
								class="page-link" href="#">${num}</a></li>
						</c:if>
					</span>
				</c:forEach>

				<li class="page-item"><c:if test="${next}">
						<a class="page-link"
							href="/rcpBoard/rcpList?num=${rcpEndPageNum + 1}${rcpSearchTypeKeyword}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</c:if></li>

			</ul>
		</nav>


		<div class="container-fluid d-flex w-50 h-50 p-3">
			<select name="rcpSearchType">
				<option value="rcpTitle"
					<c:if test="${rcpSearchType eq 'rcpTitle'}"> selected </c:if>>제목</option>
			</select> <input class="form-control me-2" type="text" name="rcpKeyword"
				value="${rcpKeyword}" placeholder="검색" aria-label="Search">
			<button class="btn btn-outline-success" type="submit"
				id="rcpSearchBtn">검색</button>
		</div>

		<script>
			document.getElementById("rcpSearchBtn").onclick = function() {
				let rcpSearchType = document.getElementsByName("rcpSearchType")[0].value;
				let rcpKeyword = document.getElementsByName("rcpKeyword")[0].value;

				location.href = "/rcpBoard/rcpList?num=1&rcpSearchType="
						+ rcpSearchType + "&rcpKeyword=" + rcpKeyword;
			};
		</script>

		<%@ include file="../include/footer.jsp"%>

	</div>
</body>
</html>