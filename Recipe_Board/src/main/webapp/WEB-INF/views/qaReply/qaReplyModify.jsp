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
	

	<nav class="container navbar navbar-expand-lg navbar-light bg-light">
		<%@ include file="../include/nav.jsp" %>
	</nav>

	<div class="container">
	
		<form method="post">

			<label>작성자</label>
			<input type="text" name="user_name" value="${qaa.user_name}" readonly /><br />
	
			<label>내용</label>
			<textarea cols="50" rows="5" name="qaa_content">${qaa.qaa_content}</textarea><br />
			
			<input type="hidden" name="qa_no" value="${qaa.qa_no}">

			<button type="submit">완료</button>

		</form>
	
	</div>

	<%@ include file="../include/footer.jsp" %>
	

</body>
</html>