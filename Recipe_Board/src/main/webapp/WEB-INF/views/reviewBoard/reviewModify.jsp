<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
		<form method="post">

			<label>제목</label>
			<input type="text" name="rv_title" value="${reviewView.rv_title}" /><br />

			<label>작성자</label>
			<input type="text" name="user_name" value="${reviewView.user_name}" readonly /><br />
	
			<label>내용</label>
			<textarea cols="50" rows="5" name="rv_content">${reviewView.rv_content}</textarea><br />

			<button type="submit">완료</button>

		</form>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>