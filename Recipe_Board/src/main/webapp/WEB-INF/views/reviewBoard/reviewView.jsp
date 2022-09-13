<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<label>제목</label>
		${reviewView.rv_title}<br />

		<label>작성자</label>
		${reviewView.user_name}<br />
	
		<label>내용</label>
		${reviewView.rv_content}<br />

		<div>
			<a href="/reviewBoard/reviewModify?rv_no=${reviewView.rv_no}">수정</a>, <a href="/reviewBoard/reviewDelete?rv_no=${reviewView.rv_no}">삭제</a>
		</div>
		
		<!-- 댓글 -->
		<hr />
		<ul>
			<li>1번 댓글 작성자</li>
			<li>1번 댓글</li>
			<li>2번 댓글 작성자</li>
			<li>2번 댓글</li>
			<li>3번 댓글 작성자</li>
			<li>3번 댓글</li>
		</ul>
		
		<div>
			<p>
				<label>작성자</label>
				<input type="text">
			</p>
			<p>
				<textarea rows="5" cols="50"></textarea>
			</p>
			<p>
				<button type="button">댓글 작성</button>
			</p>
		</div>
	
	</div>

	<footer class="bg-light text-center text-lg-start">
		<%@ include file="../include/footer.jsp" %>
	</footer>

</body>
</html>