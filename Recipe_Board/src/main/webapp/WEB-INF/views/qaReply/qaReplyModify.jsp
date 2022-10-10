<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>모먹지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="../../resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="../../resources/img/favicon.ico">

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