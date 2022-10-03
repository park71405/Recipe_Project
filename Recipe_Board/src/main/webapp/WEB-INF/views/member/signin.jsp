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