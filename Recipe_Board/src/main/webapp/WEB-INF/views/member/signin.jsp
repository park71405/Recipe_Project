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
		
		<form role="form" method="post" autocomplete="off">
  			<div class="input_area">
   				<label for="user_id">아이디</label>
   				<input type="text" id="user_id" name="user_id" required="required" />      
  			</div>
  
  			<div class="input_area">
   				<label for="user_pw">패스워드</label>
   				<input type="password" id="user_pw" name="user_pw" required="required" />  
	
			</div>
	 
	 		<button type="submit" id="signin_btn" name="signin_btn">로그인</button>

  			<c:if test="${msg == false}">
   				<p style="color:#f00;">로그인에 실패했습니다.</p>
  			</c:if>
  
 		</form>   
 		
 	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>