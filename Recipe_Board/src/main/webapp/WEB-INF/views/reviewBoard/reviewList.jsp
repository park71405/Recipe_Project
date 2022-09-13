<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>뭐 먹지</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
</head>
<body>

	
	
	<header class="container blog-header py-3 bg-light">
		<%@ include file="../include/header.jsp" %>
	</header>

	<nav class="container navbar navbar-expand-lg navbar-light bg-light">
		<%@ include file="../include/nav.jsp" %>
	</nav>

	<div class="container">
	
		<table>
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
  							<a href="/reviewBoard/reviewView?rv_no=${reviewList.rv_no}">${reviewList.rv_title}</a>	
  						</td>
  						<td><fmt:formatDate value="${reviewList.rv_date}" pattern="yyyy-MM-dd" /></td>
  						<td>${reviewList.user_name}</td>
 					</tr>
				</c:forEach>
 			</tbody>
		</table>
		
		<div>
			<c:if test="${prev}">
				<span>[ <a href="/reviewBoard/reviewList?num=${reviewStartPageNum - 1}${rv_searchTypeKeyword}">이전</a> ] </span>
			</c:if>
			
 			<c:forEach begin="${reviewStartPageNum}" end="${reviewEndPageNum}" var="num" >
    			<span>
     				
     				<c:if test="${reviewSelect != num}">
     					<a href="/reviewBoard/reviewList?num=${num}${rv_searchTypeKeyword}">${num}</a>
     				</c:if>
     				
     				<c:if test="${reviewSelect == num}">
     					<b>${num}</b>
     				</c:if>
     				
  				</span>
 			</c:forEach>
 			
 			<c:if test="${next}">
				<span>[ <a href="/reviewBoard/reviewList?num=${reviewEndPageNum + 1}${rv_searchTypeKeyword}">다음</a> ] </span>
			</c:if>
		</div>
		
		<div>
			<select name="reviewSearchType">
				<option value="rv_title" <c:if test="${reviewSearchType eq 'rv_title'}"> selected </c:if>>제목</option>
				<option value="rv_content" <c:if test="${reviewSearchType eq 'rv_content'}"> selected </c:if>>내용</option>
				<option value="rv_title_content" <c:if test="${reviewSearchType eq 'rv_title_content'}"> selected </c:if>>제목+내용</option>
				<option value="user_name" <c:if test="${reviewSearchType eq 'user_name'}"> selected </c:if>>작성자</option>
			</select>
			
			<input type="text" name="rv_keyword" value="${rv_keyword}" />
			
			<button type="button" id="reviewSearchBtn">검색</button>
		</div>
		
		<script>
			document.getElementById("reviewSearchBtn").onclick = function(){
				let reviewSearchType = document.getElementsByName("reviewSearchType")[0].value;
				let rv_keyword = document.getElementsByName("rv_keyword")[0].value;
				
				location.href = "/reviewBoard/reviewList?num=1" + "&reviewSearchType=" + reviewSearchType + "&rv_keyword=" + rv_keyword;
			};
		</script>
	
	</div>

	<footer class="bg-light text-center text-lg-start">
		<%@ include file="../include/footer.jsp" %>
	</footer>

</body>
</html>