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
						<c:forEach items="${qaList}" var="qaList">
							<tr>
								<td class="text-center">${qaList.qa_no}</td>
								<td class="text-center"><a
									href="/qaBoard/qaView?qa_no=${qaList.qa_no}"
									style="text-decoration: none; color: #476268;">${qaList.qa_title}</a>
								</td>
								<td class="text-center"><fmt:formatDate
										value="${qaList.qa_date}" pattern="yyyy-MM-dd" /></td>
								<td class="text-center">${qaList.user_name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 페이지 넘김 처리 -->
				<div class="row">
					<ul class="pagination pagination-lg justify-content-end">
						<li class="page-item rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"><c:if test="${prev}">
								<a class="page-link"
									href="/qaBoard/qaList?num=${qaStartPageNum - 1}${qa_searchTypeKeyword}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if></li>

						<c:forEach begin="${qaStartPageNum}" end="${qaEndPageNum}"
							var="num">
							<span> <c:if test="${qaSelect != num}">
									<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
										href="/qaBoard/qaList?num=${num}${qa_searchTypeKeyword}">${num}</a>
									</li>
								</c:if> <c:if test="${qaSelect == num}">
									<li class="page-item disabled" aria-current="page"><a
										class="page-link page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#">${num}</a></li>
								</c:if>
							</span>
						</c:forEach>

						<li class="page-item"><c:if test="${next}">
								<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
									href="/qaBoard/qaList?num=${qaEndPageNum + 1}${qa_searchTypeKeyword}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
							</c:if></li>

					</ul>
				</div>

			</div>

			<div class="col-1"></div>

		</div>

		<div class="container-fluid d-flex w-50 h-50 p-3">
			<select name="qa_SearchType">
				<option value="qa_title"
					<c:if test="${qa_SearchType eq 'qa_title'}"> selected </c:if>>제목</option>
				<option value="qa_content"
					<c:if test="${qa_SearchType eq 'qa_content'}"> selected </c:if>>내용</option>
				<option value="qa_title_content"
					<c:if test="${qa_SearchType eq 'qa_title_content'}"> selected </c:if>>제목+내용</option>
				<option value="user_name"
					<c:if test="${qa_SearchType eq 'user_name'}"> selected </c:if>>작성자</option>
			</select> <input class="form-control me-2" type="text" name="qa_keyword"
				value="${qa_keyword}" placeholder="검색" aria-label="Search">

			<button class="btn btn-outline-success" type="submit"
				id="qaSearchBtn">검색</button>
		</div>

		<script>
			document.getElementById("qaSearchBtn").onclick = function() {
				let qa_SearchType = document.getElementsByName("qa_SearchType")[0].value;
				let qa_keyword = document.getElementsByName("qa_keyword")[0].value;

				location.href = "/qaBoard/qaList?num=1" + "&qa_SearchType="
						+ qa_SearchType + "&qa_keyword=" + qa_keyword;
			};
		</script>

	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>