<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p><a href="/login/login">로그인</a>

<p><a href="/recipeBoard/recipeList">레시피 목록</a>
<p><a href="/reviewBoard/reviewList?num=1">요리후기 목록</a>
<p><a href="/reviewBoard/reviewWrite">요리후기 게시물 작성</a>

</body>
</html>
