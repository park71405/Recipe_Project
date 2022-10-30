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

<link rel="shortcut icon" type="image/x-icon"
	href="../../resources/img/favicon.png">

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
</head>
<body>



	<%@ include file="../include/header3.jsp"%>

	<%@ include file="../include/nav3.jsp"%>

	<div class="row text-center pt-4 mt-3">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">회원관리</h1>
		</div>
	</div>


	<div class="container my-3">

		<c:if test="${manager == null}">
			<script>
				swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(
						function() {
							location.href = "../member/signin";
						});
			</script>
		</c:if>

		<div class="row ">
			<div class="col-1"></div>

			<div class="col-10">
				<table class="table table-hover justify-content-center">
					<thead>
						<tr>
							<th class="text-center">NO</th>
							<th class="text-center">아이디</th>
							<th class="text-center">닉네임</th>
							<th class="text-center">PHONE</th>
							<th class="text-center">EMAIL</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${memberList}" var="memberList">
							<tr>
								<td class="text-center"><c:out
										value="${memberList.user_no}"></c:out></td>
								<td class="text-center"><c:out
										value="${memberList.user_id}" /></td>
								<td class="text-center"><c:out
										value="${memberList.user_name}" /></td>
								<td class="text-center"><c:out
										value="${memberList.user_phone}" /></td>
								<td class="text-center"><c:out
										value="${memberList.user_email}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 페이지 넘김 처리 -->
				<div class="row">
					<div class="col-6 mx-4"></div>
					<div class="col-5">
						<ul class="pagination justify-content-end">
							<li
								class="page-item rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"><c:if
									test="${prev}">
									<a class="page-link"
										href="/manager/memberList?num=${StartPageNum - 1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
								</c:if></li>

							<c:forEach begin="${StartPageNum}" end="${EndPageNum}" var="num">
								<span> <c:if test="${Select != num}">
										<li class="page-item"><a
											class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
											href="/manager/memberList?num=${num}">${num}</a></li>
									</c:if> <c:if test="${Select == num}">
										<li class="page-item disabled" aria-current="page"><a
											class="page-link page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
											href="#">${num}</a></li>
									</c:if>
								</span>
							</c:forEach>

							<li class="page-item"><c:if test="${next}">
									<a
										class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
										href="/manager/memberList?num=${EndPageNum + 1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</c:if></li>

						</ul>
					</div>

				</div>

			</div>

			<div class="col-1"></div>


		</div>

	</div>

	<%@ include file="../include/footer3.jsp"%>

</body>
</html>