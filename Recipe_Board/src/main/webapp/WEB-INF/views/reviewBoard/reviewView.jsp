<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="https://kit.fontawesome.com/77451a1db8.js" crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">

	window.onload = function(){
		document.getElementById("mybtn").onclick = message;
	}
	
	function message(){
		swal('로그인 필요', '댓글을 작성하시려면 로그인이 필요합니다.', 'warning');
	}
	
</script>

</head>
<body>

	<c:if test="${manager == null}">
		<%@ include file="../include/header.jsp" %>
		<%@ include file="../include/nav2.jsp" %>
	</c:if>
	
	<c:if test="${manager != null}">
		<%@ include file="../include/header3.jsp" %>
		<%@ include file="../include/nav3.jsp" %>
	</c:if>

	<div class="container my-1 bg-light pb-5">

		<div class="row">
			<c:if test="${reviewView.rv_img != null }">
				<div class="col-lg-5 mt-5">
					<div class="card mb-3 ratio ratio-1x1">
							<img class="card-img img-fluid"
								src="../../../resources/imgUpload/rv/${reviewView.rv_img}"
								alt="이미지 로드 불가" id="product-detail">
					</div>
				</div>
				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<h1 class="h2 col-9"><c:out value="${reviewView.rv_title}"/></h1>
								<button type="button" class="col-3 btn btn-outline-success" id="alert">신고</button>
							</div>
							
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>글쓴이</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong><c:out value="${reviewView.user_name}"/></strong>
									</p>
								</li>
							</ul>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>작성일</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong> <fmt:formatDate value="${reviewView.rv_date}"
												pattern="yyyy-MM-dd" />
										</strong>
									</p>
								</li>
							</ul>
							<p>${reviewView.rv_content}</p>
							<c:if test="${member.user_name eq reviewView.user_name}">
								<div class="row pb-3">
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/reviewBoard/reviewModify?rv_no=${reviewView.rv_no}'">수정</button>
									</div>
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/reviewBoard/reviewDelete?rv_no=${reviewView.rv_no}'">삭제</button>
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
							<div class="row">
								<h1 class="h2 col-9"><c:out value="${reviewView.rv_title}"/></h1>
								<button id="alert" type="button" class="col-3 btn btn-outline-success">신고</button>
							</div>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>글쓴이</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong><c:out value="${reviewView.user_name}"/></strong>
									</p>
								</li>
							</ul>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>작성일</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong> <fmt:formatDate value="${reviewView.rv_date}"
												pattern="yyyy-MM-dd" />
										</strong>
									</p>
								</li>
							</ul>
							<p>${reviewView.rv_content}</p>
							<c:if test="${member.user_name eq reviewView.user_name}">
								<div class="row pb-3">
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/reviewBoard/reviewModify?rv_no=${reviewView.rv_no}'">수정</button>
									</div>
									<div class="col d-grid">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/reviewBoard/reviewDelete?rv_no=${reviewView.rv_no}'">삭제</button>
									</div>
								</div>
							</c:if>
	
						</div>
					</div>
				</div>
			</c:if>
			
		</div>

		<div class="row">
			<p class="mt-5 text-center"><strong>댓글</strong></p>
		</div>

		<!-- 댓글 -->
		<div class="row">
			<div class="col-lg-6 mt-3">
				<div class="card min-vh-30">
					<div class="row text-center">
						<c:forEach items="${rvReply}" var="rvReply">
							<div class="mb-2 p-4">
								<p>
									<i class="fa-solid fa-quote-left"></i>
									<c:out value="${rvReply.rva_content}"/>
									<i class="fa-solid fa-quote-right"></i>
								</p>
								<h5><c:out value="${rvReply.user_name}"/></h5>
								<h6>
									<fmt:formatDate value="${rvReply.rva_date}" pattern="yyyy-MM-dd" />
								</h6>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mt-3">
				<div class="card">
							<div class="p-2">
								<form method="post" action="/rvReply/rvReplyWrite">
									<p>
										<textarea class="form-control" name="rva_content" rows="4" cols="50"></textarea>
									</p>
									<p>
										<input type="hidden" name="rv_no" value="${reviewView.rv_no}">
										<input type="hidden" name="user_name"
											value="${member.user_name}">
										<c:if test="${member != null}">
											<button class="btn btn-outline-success" type="submit">댓글 작성</button>
										</c:if>
										<c:if test="${member == null}">
											<button class="btn btn-outline-success" type="button" id="mybtn">댓글작성</button>
										</c:if>
									</p>
	
								</form>
							</div>
				</div>
					
			</div>

		</div>


	</div>
	
	<c:if test="${manager != null}">
			<%@ include file="../include/footer3.jsp" %>
	</c:if>
	<c:if test="${manager == null}">
			<%@ include file="../include/footer.jsp" %>
	</c:if>

</body>

<script>
document.getElementById("alert").onclick = function() {
	
	if(${member == null}){
		swal('로그인 필요', '해당 글을 신고하시려면 로그인이 필요합니다.', 'warning');
	}else{
		location.href = "/reviewBoard/alert?rv_no=${reviewView.rv_no}&rv_warning=${reviewView.rv_warning}";
	}

};

</script>

</html>