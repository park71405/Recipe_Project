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
	
		<!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${rcpView.att_file_no_main}" alt="..." /></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder" >${rcpView.rcp_nm}</h1>
                        <dl class="row">
                        	<dt class="col-sm-3">조리방법</dt>
  							<dd class="col-sm-9">${rcpView.rcp_way2}</dd>
  								
  							<dt class="col-sm-3">요리종류</dt>
  							<dd class="col-sm-9">${rcpView.rcp_pat2}</dd>
  								
  							<dt class="col-sm-3">열량</dt>
  							<dd class="col-sm-9">${rcpView.info_eng}</dd>
  								
  							<dt class="col-sm-3">재료</dt>
  							<dd class="col-sm-9"></dd>
                        		
                       	</dl>
                    </div>
                </div>
            </div>
        </section>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>