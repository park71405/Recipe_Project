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
</head>
<body>



	<%@ include file="../include/header.jsp"%>


	<%@ include file="../include/nav.jsp"%>


	<div class="container my-5">

		<div class="row ">
			<div class="col-1"></div>
			<div class="col-10">
				<table
					class="table table-borderless table-hover justify-content-center">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">작성일</th>
							<th class="text-center">작성자</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${reviewList}" var="reviewList">
							<tr>
								<td class="text-center">${reviewList.rv_no}</td>
								<td class="text-center"><a
									href="/reviewBoard/reviewView?rv_no=${reviewList.rv_no}"
									style="text-decoration: none; color: #476268;">${reviewList.rv_title}</a>
								</td>
								<td class="text-center"><fmt:formatDate value="${reviewList.rv_date}"
										pattern="yyyy-MM-dd" /></td>
								<td class="text-center">${reviewList.user_name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- 페이지 넘김 처리 -->
				<div class="row">
					<div class="col-6"></div>
					<div class="col-6"></div>
					<ul class="pagination pagination-lg justify-content-end">
						<li class="page-item"><c:if test="${prev}">
								<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
									href="/reviewBoard/reviewList?num=${reviewStartPageNum - 1}${rv_searchTypeKeyword}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if></li>

						<c:forEach begin="${reviewStartPageNum}" end="${reviewEndPageNum}"
							var="num">
							<span> <c:if test="${reviewSelect != num}">
									<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
										href="/reviewBoard/reviewList?num=${num}${rv_searchTypeKeyword}">${num}</a>
									</li>
								</c:if> <c:if test="${reviewSelect == num}">
									<li class="page-item disabled" aria-current="page"><a
										class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#">${num}</a></li>
								</c:if>
							</span>
						</c:forEach>

						<li class="page-item"><c:if test="${next}">
								<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
									href="/reviewBoard/reviewList?num=${reviewEndPageNum + 1}${rv_searchTypeKeyword}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
							</c:if></li>

					</ul>
				</div>

			</div>
			<div class="col-1"></div>
		</div>


		<div class="container-fluid d-flex w-50 h-50 p-3">
			<select name="reviewSearchType">
				<option value="rv_title"
					<c:if test="${reviewSearchType eq 'rv_title'}"> selected </c:if>>제목</option>
				<option value="rv_content"
					<c:if test="${reviewSearchType eq 'rv_content'}"> selected </c:if>>내용</option>
				<option value="rv_title_content"
					<c:if test="${reviewSearchType eq 'rv_title_content'}"> selected </c:if>>제목+내용</option>
				<option value="user_name"
					<c:if test="${reviewSearchType eq 'user_name'}"> selected </c:if>>작성자</option>
			</select> <input class="form-control me-2" type="text" name="rv_keyword"
				value="${rv_keyword}" placeholder="검색" aria-label="Search">

			<button class="btn btn-outline-success" type="submit"
				id="reviewSearchBtn">검색</button>
		</div>

		<script>
			document.getElementById("reviewSearchBtn").onclick = function() {
				let reviewSearchType = document
						.getElementsByName("reviewSearchType")[0].value;
				let rv_keyword = document.getElementsByName("rv_keyword")[0].value;

				location.href = "/reviewBoard/reviewList?num=1"
						+ "&reviewSearchType=" + reviewSearchType
						+ "&rv_keyword=" + rv_keyword;
			};
		</script>

	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>