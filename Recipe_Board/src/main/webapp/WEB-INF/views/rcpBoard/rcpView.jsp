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