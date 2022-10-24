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

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/nav2.jsp"%>

<div class="container my-5 min-vh-30">

	<c:if test="${member == null}">
		<script>
			swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(
					function() {
						location.href = "../member/signin";
					});
		</script>
	</c:if>

	<div class="row text-center mb-2 mt-5">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">INGREDIENT</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-1"></div>

		<div class="col-10">
			<table class="table table-hover justify-content-center">
				<thead>
					<tr>
						<th class="text-center">재료명</th>
						<th class="text-center">수량</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${ingreList}" var="ingreList">
						<tr>
							<td class="text-center">${ingreList.ingre_name}</td>
							<td class="text-center">${ingreList.ingre_capacity}</td>
							<td class="text-center">
								<button type="button" class="btn btn-outline-success"
									onclick="location.href='/refri/refriModify?ingre_no=${ingreList.ingre_no}'">수정</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="col-1"></div>

		<script>
			//추가 버튼 누를 경우
			document.getElementById("ingreAdd").onclick = function() {

				location.href = "/refri/refriAdd";
			};

			//영수증으로 추가 버튼 누를 경우
			document.getElementById("ingreReciAdd").onclick = function() {
				location.href = "/refri/refriCameAdd";
			};
		</script>

	</div>
	<div class="row">
		<div class="col-1"></div>
		<div class="col-9">
				<button type="button" class="btn btn-outline-success"
					onclick="location.href='/rcpBoard/rcpList?num=1'">Main으로 돌아가기</button>
		</div>
		<div class="col-1"></div>
	</div>

</div>

<%@ include file="../include/footer.jsp"%>

</body>
</html>