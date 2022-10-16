<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%@ include file="include/header.jsp" %>
	
	<%@ include file="include/nav.jsp" %>
	
	
	
	

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p><a href="/member/signup">회원가입</a>
<p><a href="/member/signin">로그인</a>

<p><a href="/rcpBoard/rcpList?num=1">레시피 목록</a>
<p><a href="/rcpBoard/rcpAllList?num=1">레시피 목록 전체 보기</a>
<p><a href="/rcpBoard/rcpKindTypeList?num=1">레시피 요리 종류별 보기</a>

<p><a href="/reviewBoard/reviewList?num=1">요리후기 목록</a>
<p><a href="/reviewBoard/reviewWrite">요리후기 게시물 작성</a>
<p><a href="/qaBoard/qaList?num=1">QA 목록</a>
<p><a href="/qaBoard/qaWrite">QA 작성</a>


<%@ include file="include/footer.jsp" %>

</body>
</html>
