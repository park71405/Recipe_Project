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
	
		<section id="content">
 			<form role="form" method="post" autocomplete="off">
  				<div class="input_area">
   					<label for="user_id">아이디</label>
   					<input type="text" id="user_id" name="user_id" required="required" />      
  				</div>
  
  				<div class="input_area">
   					<label for="user_pw">패스워드</label>
   					<input type="password" id="user_pw" name="user_pw" required="required" />      
  				</div>
  
  				<div class="input_area">
   					<label for="user_name">닉네임</label>
   					<input type="text" id="user_name" name="user_name" placeholder="닉네임을 입력해주세요" required="required" />      
  				</div>
  
  				<div class="input_area">
   					<label for="user_phone">연락처</label>
   					<input type="tel" id="user_phone" name="user_phone" placeholder="연락처를 입력해주세요" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" />      
  				</div>
  				
  				<div class="input_area">
   					<label for="user_email">이메일</label>
   					<input type="email" id="user_email" name="user_email" placeholder="이메일 입력해주세요" required="required" />      
  				</div>
  
  				<button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
  
 			</form>   
		</section>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>