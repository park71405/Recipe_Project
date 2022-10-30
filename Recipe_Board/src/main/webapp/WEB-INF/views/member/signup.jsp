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

    <link rel="shortcut icon" type="image/x-icon" href="../../resources/img/favicon.png">

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
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     
</head>
<body>

	<%@ include file="../include/header.jsp" %>
	
	<%@ include file="../include/nav.jsp" %>

	<div class="container">
	
		<section id="content">
  			<div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    			<div class="container">
      				<div class="row gx-lg-5 align-items-center">
        				<div class="col-lg-6 mb-5 mb-lg-0">
          					<h1 class="my-5 display-3 fw-bold ls-tight">
            					CookCook
          					</h1>
          					<p style="color: hsl(217, 10%, 50.8%)">
            					오늘도 무엇을 먹어야하지는 모르겠는 자취생을 위한!<br />
            					맨날 똑같은 메뉴만 만들기 싫은 주부들을 위한!<br />
            					<strong>혁신적인 레시피 사이트</strong> 
            					
          					</p>
        				</div>

	        			<div class="col-lg-6 mb-5 mb-lg-0">
          					<div class="card">
            					<div class="card-body py-5 px-md-5">
              						<form role="form" method="post" autocomplete="off">
              							
										<!-- 아이디 입력 -->
                						<div class="form-outline mb-4 input_area">
                  							<input type="text" id="user_id" name="user_id" required="required" class="form-control" />
                  							<label class="form-label" for="user_id">ID</label>
                						</div>
                						     
                						<!-- 비번 입력 -->
                						<div class="form-outline mb-4">
                  							<input type="password" id="user_pw" name="user_pw" required="required" class="form-control" />
                  							<label class="form-label" for="user_pw">Password</label>
                						</div>     
  				
  										<!-- 닉네임 입력 -->
                						<div class="form-outline mb-4">
                  							<input type="text" id="user_name" name="user_name" placeholder="닉네임을 입력해주세요" required="required" class="form-control" />
                  							<label class="form-label" for="user_name">닉네임</label>
                						</div>
                						
                						<!-- 연락처 입력 -->
                						<div class="form-outline mb-4">
                  							<input type="tel" id="user_phone" name="user_phone" placeholder="연락처를 입력해주세요" required="required" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" class="form-control" />
                  							<label class="form-label" for="user_phone">연락처</label>
                						</div>
                									
                						<!-- 이메일 입력 -->
                						<div class="form-outline mb-4">
                  							<input type="email" id="user_email" name="user_email" placeholder="이메일을 입력해주세요" required="required" class="form-control" />
                  							<label class="form-label" for="user_email">E-Mail</label>
                						</div>
                						
	                					<button type="submit" id="signup_btn" name="signup_btn" class="btn btn-outline-success btn-block mb-4">
    	              						회원가입
    	            					</button>
    	            				
        		      				</form>
            					</div>
          					</div>
        				</div>
      				</div>
    			</div>
    		</div>
		</section>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>