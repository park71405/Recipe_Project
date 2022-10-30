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



<%@ include file="../include/header3.jsp"%>


<%@ include file="../include/nav3.jsp"%>

<div class="row text-center pt-4 mt-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h1">NOTICE</h1>
	</div>
</div>


<div class="container my-3 min-vh-30">

	<c:if test="${manager == null}">
		<script>
			swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(
					function() {
						location.href = "../manager/signin";
					});
		</script>
	</c:if>

	<div class="row ">
		<div class="col-1"></div>
		<div class="col-10">
			<table class="table table-hover justify-content-center">
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
						<th class="text-center">작성자</th>
						<th class="text-center"></th>
						<th class="text-center"></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${noList}" var="noList">
						<tr>
							<td class="text-center"><c:out value="${noList.no_no}"></c:out></td>
							<td class="text-center"><a
								href="/noBoard/noView?no_no=${noList.no_no}"
								style="text-decoration: none; color: #476268;"><c:out
										value="${noList.no_title}" /></a></td>
							<td class="text-center"><fmt:formatDate
									value="${noList.no_date}" pattern="yyyy-MM-dd" /></td>
							<td class="text-center"><c:out value="${noList.mana_name}" /></td>
							<td class="text-center"><button type="button"
									class="btn btn-outline-success"
									onclick="location.href='/noBoard/noModify?no_no=${noList.no_no}'">수정</button>
							<button type="button"
									class="btn btn-outline-success"
									onclick="location.href='/noBoard/noDelete?no_no=${noList.no_no}'">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이지 넘김 처리 -->
			<div class="row">
				<div class="col-6">
					<button type="button" id="noWrite" class="btn btn-outline-success">추가</button>
				</div>
				<div class="col-6">
					<ul class="pagination justify-content-end">
						<li class="page-item"><c:if test="${prev}">
								<a
									class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
									href="/manager/noList?num=${noStartPageNum - 1}${no_searchTypeKeyword}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if></li>

						<c:forEach begin="${noStartPageNum}" end="${noEndPageNum}"
							var="num">
							<span> <c:if test="${noSelect != num}">
									<li class="page-item"><a
										class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
										href="/manager/noList?num=${num}${no_searchTypeKeyword}">${num}</a>
									</li>
								</c:if> <c:if test="${noSelect == num}">
									<li class="page-item disabled" aria-current="page"><a
										class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
										href="#">${num}</a></li>
								</c:if>
							</span>
						</c:forEach>

						<li class="page-item"><c:if test="${next}">
								<a
									class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
									href="/manager/noList?num=${noEndPageNum + 1}${no_searchTypeKeyword}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
							</c:if></li>

					</ul>
				</div>

			</div>

		</div>
		<div class="col-1"></div>

		<div class="row align-items-center">
			<div class="col-3"></div>
			<div class="col-1">
				<select class="form-select" name="noSearchType">
					<option value="no_title"
						<c:if test="${noSearchType eq 'no_title'}"> selected </c:if>>제목</option>
					<option value="no_content"
						<c:if test="${noSearchType eq 'no_content'}"> selected </c:if>>내용</option>
					<option value="no_title_content"
						<c:if test="${noSearchType eq 'no_title_content'}"> selected </c:if>>제목+내용</option>
					<option value="mana_name"
						<c:if test="${noSearchType eq 'mana_name'}"> selected </c:if>>작성자</option>
				</select>
			</div>
			<div class="col-4">
				<input class="form-control me-2" type="text" name="no_keyword"
					value="${no_keyword}" placeholder="검색" aria-label="Search">
			</div>
			<div class="col-2">
				<button class="btn btn-outline-success" type="submit"
					id="noSearchBtn">검색</button>
			</div>
			<div class="col-2"></div>
		</div>

		<script>
			document.getElementById("noWrite").onclick = function() {

				location.href = "/noBoard/noWrite";
			};

			document.getElementById("noSearchBtn").onclick = function() {
				let noSearchType = document.getElementsByName("noSearchType")[0].value;
				let no_keyword = document.getElementsByName("no_keyword")[0].value;

				location.href = "/manager/noList?num=1" + "&noSearchType="
						+ noSearchType + "&no_keyword=" + no_keyword;
			};
		</script>

	</div>

</div>
<%@ include file="../include/footer3.jsp"%>
</html>