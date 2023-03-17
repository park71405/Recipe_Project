<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>모먹지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="../../resources/img/favicon.png">

    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/css/templatemo.css">
    <link rel="stylesheet" href="../../resources/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="../../resources/css/fontawesome.min.css">
    
   	<script src="../../resources/js/jquery-1.11.0.min.js"></script>
    <script src="../../resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="../../resources/js/bootstrap.bundle.min.js"></script>
    <script src="../../resources/js/templatemo.js"></script>
    <script src="../../resources/js/custom.js"></script>
    
    
<script src="https://kit.fontawesome.com/77451a1db8.js" crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

	<c:if test="${manager == null}">
		<%@ include file="../include/header.jsp" %>
		<%@ include file="../include/nav.jsp" %>
	</c:if>
	
	<c:if test="${manager != null}">
		<%@ include file="../include/header3.jsp" %>
		<%@ include file="../include/nav3.jsp" %>
	</c:if>
	

	<div class="container my-1 bg-light pb-5">
		<div class="row">
			<c:if test="${noView.no_img != null }">
				<div class="col-lg-5 mt-5">
					<div class="card mb-3 ratio ratio-1x1">
							<img class="card-img img-fluid"
								src="../../../resources/imgUpload/no/${noView.no_img}"
								alt="이미지 로드 불가" id="product-detail">
					</div>
				</div>
				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2"><c:out value="${noView.no_title}" /></h1>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>글쓴이</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong><c:out value="${noView.mana_name}" /></strong>
									</p>
								</li>
							</ul>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>작성일</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong> <fmt:formatDate value="${noView.no_date}"
												pattern="yyyy-MM-dd" />
										</strong>
									</p>
								</li>
							</ul>
							<p><c:out value="${noView.no_content}" /></p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${reviewView.rv_img == null }">
				<div class="col-lg-12 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2"><c:out value="${noView.no_title}"></c:out></h1>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>글쓴이</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong><c:out value="${noView.mana_name}" /></strong>
									</p>
								</li>
							</ul>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>작성일</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong> <fmt:formatDate value="${noView.no_date}"
												pattern="yyyy-MM-dd" />
										</strong>
									</p>
								</li>
							</ul>
							<p><c:out value="${noView.no_content}" /></p>
						</div>
					</div>
				</div>
			</c:if>
		</div>
			
	</div>
	
	<c:if test="${manager != null}">
			<%@ include file="../include/footer3.jsp" %>
	</c:if>
	<c:if test="${manager == null}">
			<%@ include file="../include/footer.jsp" %>
	</c:if>
</body>
</html>