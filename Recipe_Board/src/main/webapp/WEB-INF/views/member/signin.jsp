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
    
    <!-- 경고창 이쁜거 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript">
    window.onload = function(){
    	if(${result == 'f'}){
    		swal('로그인 실패!', "아이디와 비밀번호를 확인해 주세요", 'warning');
    	}
    }
    </script>
    
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<%@ include file="../include/nav.jsp" %>

	<div class="container">
	
		<section class="">
  			<div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    			<div class="container">
      				<div class="row gx-lg-5 align-items-center">
        				<div class="col-lg-6 mb-5 mb-lg-0">
          					<h1 class="my-5 display-3 fw-bold ls-tight">
            					오늘은 모먹지?
          					</h1>
          					<p style="color: hsl(217, 10%, 50.8%)">
            					오늘도 무엇을 먹어야하지는 모르겠는 자취생을 위한<br />
            					맨날 똑같은 메뉴만 만들기 싫은 주부들을 위한<br />
            					<strong>혁신적인 레시피 사이트</strong> 
            					
          					</p>
        				</div>

	        			<div class="col-lg-6 mb-5 mb-lg-0">
          					<div class="card">
            					<div class="card-body py-5 px-md-5">
              						<form role="form" method="post" autocomplete="off">
										<!-- 아이디 입력 -->
                						<div class="form-outline mb-4">
                  							<input type="text" id="user_id" name="user_id" required="required" class="form-control" />
                  							<label class="form-label" for="user_id">ID</label>
                						</div>

                						<!-- 비번 입력 -->
                						<div class="form-outline mb-4">
                  							<input type="password" id="user_pw" name="user_pw" required="required" class="form-control" />
                  							<label class="form-label" for="user_pw">Password</label>
                						</div>
	
	                					<button type="submit" id="signin_btn" name="signin_btn" class="btn btn-outline-success btn-block mb-4">
    	              						로그인
    	            					</button>
    	            				
    	            					<c:if test="${msg == false}">
   											<p style="color:#f00;">로그인에 실패했습니다.</p>
  										</c:if>
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