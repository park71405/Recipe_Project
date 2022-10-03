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
	
		<label>레시피 번호</label>
		${rcpView.rcp_seq}<br />
		
		<label>레시피 이름</label>
		${rcpView.rcp_nm}<br />
		
		<label>조리방법</label>
		${rcpView.rcp_way2}<br />
	
		<label>요리종류</label>
		${rcpView.rcp_pat2}<br />
		
		<label>열량</label>
		${rcpView.info_eng}<br />
		
		<label>재료 정보</label>
		<br />
	
		<img src="${rcpView.att_file_no_mk}" />
		<br />
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>