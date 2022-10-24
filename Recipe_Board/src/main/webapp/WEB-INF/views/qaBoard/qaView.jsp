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

<script src="https://kit.fontawesome.com/77451a1db8.js"
	crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	window.onload = function() {
		document.getElementById("mybtn").onclick = message;
	}

	function message() {
		swal('로그인 필요', '댓글을 작성하시려면 로그인이 필요합니다.', 'warning');
	}
</script>


</head>
<body>



	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>


	<div class="container  my-1 bg-light pb-5">

		<div class="row">
			<c:if test="${reviewView.rv_img != null }">
				<div class="col-lg-5 mt-5">
					<div class="card mb-3 ratio ratio-1x1">
						<img class="card-img img-fluid"
							src="../../../resources/imgUpload/qa/${qaView.qaImg}"
							alt="이미지 로드 불가" id="product-detail">
					</div>
				</div>
				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2">${qaView.qa_title}</h1>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>글쓴이</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong>${qaView.user_name}</strong>
									</p>
								</li>
							</ul>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>작성일</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong> <fmt:formatDate value="${qaView.qa_date}"
												pattern="yyyy-MM-dd" />
										</strong>
									</p>
								</li>
							</ul>
							<p>${qaView.qa_content}</p>
							<c:if test="${reviewView.rv_img != null }">
								<div class="row pb-3">
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/qaBoard/qaModify?qa_no=${qaView.qa_no}'">수정</button>
									</div>
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/qaBoard/qaDelete?qa_no=${qaView.qa_no}'">삭제</button>
									</div>
								</div>
							</c:if>

						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${reviewView.rv_img == null }">
				<div class="col-lg-12 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2">${qaView.qa_title}</h1>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>글쓴이</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong>${qaView.user_name}</strong>
									</p>
								</li>
							</ul>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>작성일</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong> <fmt:formatDate value="${qaView.qa_date}"
												pattern="yyyy-MM-dd" />
										</strong>
									</p>
								</li>
							</ul>
							<p>${qaView.qa_content}</p>
							<c:if test="${member.user_name eq qaView.user_name}">
								<div class="row pb-3">
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/qaBoard/qaModify?qa_no=${qaView.qa_no}'">수정</button>
									</div>
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/qaBoard/qaDelete?qa_no=${qaView.qa_no}'">삭제</button>
									</div>
								</div>
							</c:if>

						</div>
					</div>
				</div>
			</c:if>
		</div>


		<!-- 댓글 시작 -->

		<div class="row">
			<p class="mt-5 text-center">
				<strong>댓글</strong>
			</p>
		</div>

		<div class="row">
			<div class="col-lg-6 mt-3">
				<div class="card min-vh-30">
					<div class="row text-center">
						<c:forEach items="${qaReply}" var="qaReply">
							<div class="mb-2 p-4">
								<p>
									<i class="fa-solid fa-quote-left"></i> ${qaReply.qaa_content} <i
										class="fa-solid fa-quote-right"></i>
								</p>
								<h5>${qaReply.user_name}</h5>
								<h6>
									<fmt:formatDate value="${qaReply.qaa_date}"
										pattern="yyyy-MM-dd" />
								</h6>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mt-3">
				<div class="card">
					<div class="p-2">
						<form method="post" action="/qaReply/qaReplyWrite">
							<p>
								<textarea class="form-control" name="qaa_content" rows="4"
									cols="50"></textarea>
							</p>
							<p>
								<input type="hidden" name="qa_no" value="${qaView.qa_no}">
								<input type="hidden" name="user_name" value="${member.user_name}">
								<c:if test="${member != null}">
									<button class="btn btn-outline-success" type="submit">댓글
										작성</button>
								</c:if>
								<c:if test="${member == null}">
									<button class="btn btn-outline-success" type="button"
										id="mybtn">댓글작성</button>
								</c:if>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 끝 -->

	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>