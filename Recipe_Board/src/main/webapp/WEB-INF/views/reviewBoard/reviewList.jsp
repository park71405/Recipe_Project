<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />	
    
	<title>뭐 먹지</title>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/css/styles.css" rel="stylesheet" />

</head>
<body>

	
	
	<%@ include file="../include/header.jsp" %>
	

	<%@ include file="../include/nav.jsp" %>
	

	<div class="container">
	
		<table class="table table-borderless table-hover justify-content-center">
			<thead>
  				<tr>
   					<th>번호</th>
   					<th>제목</th>
   					<th>작성일</th>
   					<th>작성자</th>
  				</tr>
 			</thead>
 
 			<tbody>
  				<c:forEach items="${reviewList}" var="reviewList">
 					<tr>
  						<td>${reviewList.rv_no}</td>
  						<td>
  							<a href="/reviewBoard/reviewView?rv_no=${reviewList.rv_no}" style="text-decoration:none; color: #476268;">${reviewList.rv_title}</a>	
  						</td>
  						<td><fmt:formatDate value="${reviewList.rv_date}" pattern="yyyy-MM-dd" /></td>
  						<td>${reviewList.user_name}</td>
 					</tr>
				</c:forEach>
 			</tbody>
		</table>
		
		<nav aria-label="Page navigation example">
			<ul class="pagination  justify-content-center">
				<li class="page-item">
					<c:if test="${prev}">
						<a class="page-link"
							href="/reviewBoard/reviewList?num=${reviewStartPageNum - 1}${rv_searchTypeKeyword}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if>
				</li>

				<c:forEach begin="${reviewStartPageNum}" end="${reviewEndPageNum}" var="num">
					<span> 
						<c:if test="${reviewSelect != num}">
							<li class="page-item">
								<a class="page-link" href="/reviewBoard/reviewList?num=${num}${rv_searchTypeKeyword}">${num}</a>
							</li>
						</c:if> 
						<c:if test="${reviewSelect == num}">
							<li class="page-item active" aria-current="page">
								<a class="page-link" href="#">${num}</a>
							</li>
						</c:if>
					</span>
				</c:forEach>

				<li class="page-item"><c:if test="${next}">
						<a class="page-link" href="/reviewBoard/reviewList?num=${reviewEndPageNum + 1}${rv_searchTypeKeyword}" aria-label="Next"> 
							<span aria-hidden="true">&raquo;</span>
						</a>
					</c:if>
				</li>

			</ul>
		</nav>
		
		<div class="container-fluid d-flex w-50 h-50 p-3">
			<select name="reviewSearchType">
				<option value="rv_title" <c:if test="${reviewSearchType eq 'rv_title'}"> selected </c:if>>제목</option>
				<option value="rv_content" <c:if test="${reviewSearchType eq 'rv_content'}"> selected </c:if>>내용</option>
				<option value="rv_title_content" <c:if test="${reviewSearchType eq 'rv_title_content'}"> selected </c:if>>제목+내용</option>
				<option value="user_name" <c:if test="${reviewSearchType eq 'user_name'}"> selected </c:if>>작성자</option>
			</select> 
			
			<input class="form-control me-2" type="text" name="rv_keyword" value="${rv_keyword}" placeholder="검색" aria-label="Search">
			
			<button class="btn btn-outline-success" type="submit"
				id="reviewSearchBtn">검색</button>
		</div>
		
		<script>
			document.getElementById("reviewSearchBtn").onclick = function(){
				let reviewSearchType = document.getElementsByName("reviewSearchType")[0].value;
				let rv_keyword = document.getElementsByName("rv_keyword")[0].value;
				
				location.href = "/reviewBoard/reviewList?num=1" + "&reviewSearchType=" + reviewSearchType + "&rv_keyword=" + rv_keyword;
			};
		</script>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>