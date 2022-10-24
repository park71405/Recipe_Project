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


<%@ include file="../include/nav.jsp"%>


<div class="container my-5 min-vh-30">

	<c:if test="${member == null}">
		<script>
			swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(
					function() {
						location.href = "../member/signin";
					});
		</script>
	</c:if>

	<div class="row">
		<div class="col-1"></div>

		<div class="col-10">
			<table
				class="table table-borderless table-hover justify-content-center">
				<thead>
					<tr>
						<th class="text-center">재료명</th>
						<th class="text-center">수량</th>
						<th class="text-center">종류</th>
						<th></th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${refriList}" var="refriList">
						<tr>
							<td class="text-center">${refriList.ingre_name}</td>
							<td class="text-center">${refriList.ingre_capacity}</td>
							<td class="text-center">${refriList.ingre_type}</td>
							<td class="text-center">
								<button type="button" class="btn btn-outline-success"
											onclick="location.href='/refri/refriModify?ingre_no=${refriList.ingre_no}'">수정</button>
								<button type="button" class="btn btn-outline-success"
											onclick="location.href='/refri/refriDelete?ingre_no=${refriList.ingre_no}'">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이지 넘김 -->
			<div class="row">
				<div class="col-6">
					<button type="button" id="ingreAdd" class="btn btn-outline-success">추가</button>
					<button type="button" id="ingreReciAdd" class="btn btn-outline-success visually-hidden">영수증으로 추가</button>
				</div>
				<div class="col-6">
				<ul class="pagination justify-content-end">
					<li class="page-item">
						<c:if test="${prev}">
							<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								href="/refri/ingreType?num=${refriStartPageNum - 1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
					</li>
					
					<c:forEach begin="${refriStartPageNum}" end="${refriEndPageNum}" var="num">
						<span> 
							<c:if test="${refriSelect != num}">
								<li class="page-item">
									<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" 
										href="/refri/ingreType?num=${num}">${num}</a>
								</li>
							</c:if> 
							<c:if test="${refriSelect == num}">
								<li class="page-item disabled">
									<a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" 
										href="#" tabindex="-1">${num}</a>
								</li>
							</c:if>
						</span>
					</c:forEach>
					
					<li class="page-item">
						<c:if test="${next}">
							<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"  
								href="/refri/ingreType?num=${refriEndPageNum + 1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</li>
					
				</ul>
				</div>
				
			</div>

		</div>

		<div class="col-1"></div>
	</div>
	
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

<%@ include file="../include/footer.jsp"%>

</body>
</html>