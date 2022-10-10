<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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
	

	<%@ include file="../include/nav.jsp" %>
	

	<div class="container">
	
		<c:if test="${member == null}">
			<script>
				alert("로그인을 하셔야 QA를 작성하실 수 있습니다.");
				location.href = "../member/signin";
			</script>
		</c:if>
	
		<form method="post">
		
			<label>제목</label>
			<input type="text" name="qa_title" value="${qaView.qa_title}" /><br />
			
			<label>작성자</label>
			<input type="text" name="user_name" value="${member.user_name}" readonly /><br />
			
			<label>내용</label>
			<textarea cols="50" rows="5" name="qa_content">${qaView.qa_content}</textarea><br />
			
			<button type="submit">완료</button>
			
		</form>
	
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>