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
	<%@ include file="../include/nav.jsp"%>

	<div class="container py-5">

		<c:if test="${member == null}">
			<script>
				swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(
						function() {
							location.href = "../member/signin";
						});
			</script>
		</c:if>
		<div class="row">

			<div class="col-md-3 mt-5">
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#"> MyPage
							<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
						</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a href="/myPage/userInfo" class="text-decoration-none">회원 정보</a></li>
							<li><a href="#" class="text-decoration-none">찜 목록</a></li>
							<li><a href="#" class="text-decoration-none">내 요리 후기</a></li>
						</ul>
					</li>
				</ul>
			</div>


			<div class="col-md-9">
				<div class="card shadow-lg border-0 rounded-lg mt-5 mb-5">
					<div class="card-header">
						<h3 class="text-center font-weight-light my-4">회원정보</h3>
					</div>
					<div class="card-body">

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">아이디</label>
							<div class="col-sm-7">
								<input type="text" readonly class="form-control-plaintext"
									value="${userInfo.user_id}">
							</div>
						</div>

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">닉네임</label>
							<div class="col-sm-7">
								<input type="text" readonly class="form-control-plaintext"
									value="${userInfo.user_name}">
							</div>
						</div>

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">전화번호</label>
							<div class="col-sm-7">
								<input type="text" readonly class="form-control-plaintext"
									value="${userInfo.user_phone}">
							</div>
						</div>

						<div class="mb-3 row">
							<label class="col-sm-5 col-form-label">이메일</label>
							<div class="col-sm-7">
								<input type="text" readonly class="form-control-plaintext"
									value="${userInfo.user_email}">
							</div>
						</div>

						<button type="button" class="btn btn-outline-success btn-block mb-4"
							 onclick="location.href='userInfoModify' ">
    	              		정보수정
    	            	</button>

					</div>
				</div>
			</div>

		</div>

	</div>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>