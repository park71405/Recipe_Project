<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
	<title>Home</title>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="include/header.jsp" %>
	
	<%@ include file="include/nav.jsp" %>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p><a href="/member/signup">회원가입</a>
<p><a href="/member/signin">로그인</a>

<p><a href="/rcpBoard/rcpList?num=1">레시피 목록</a>

<p><a href="/reviewBoard/reviewList?num=1">요리후기 목록</a>
<p><a href="/reviewBoard/reviewWrite">요리후기 게시물 작성</a>
<p><a href="/qaBoard/qaList?num=1">QA 목록</a>
<p><a href="/qaBoard/qaWrite">QA 작성</a>


<%@ include file="include/footer.jsp" %>

</body>
</html>
