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

<div class="container my-5">

	<c:if test="${member == null}">
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
			<form method="post" id="ingre">

				<div class="card shadow-lg border-0 rounded-lg mt-5 mb-5">
					<div class="card-header">
						<h3 class="text-center font-weight-light my-4">재료 추가</h3>
					</div>
					<div class="card-body">

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">재료 이름</label>
							<div class="col-sm-7">
								<input type="text" name="ingre_name" class="form-control-plaintext" placeholder="재료명">
							</div>
						</div>

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">재료 수량</label>
							<div class="col-sm-7">
								<input type="text" name="ingre_capacity" class="form-control-plaintext" placeholder="수량">
							</div>
						</div>

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">종류</label>
							<div class="col-sm-7">
								<select id="ingre_type" name="ingre_type" form="ingre" class="form-select">
									<option value="meat">육류</option>
									<option value="vege">채소</option>
									<option value="can">가공식품</option>
									<option value="fish">어류</option>
									<option value="fruits">과일</option>
									<option value="dairy">유제품</option>
								</select>
							</div>
						</div>
						
						<button type="submit"
								class="btn btn-outline-success btn-block mb-4">추가</button>
					
					</div>
				</div>
			</form>
		</div>

		<div class="col-1"></div>
	</div>


</div>

<%@ include file="../include/footer.jsp"%>

</body>
</html>