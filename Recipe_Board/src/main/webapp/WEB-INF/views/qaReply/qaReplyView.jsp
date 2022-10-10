<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<ul>
			<c:forEach items="${qaReply}" var="qaReply">
				<li>
					<div>
						<p>${qaReply.user_name} / <fmt:formatDate value="${qaReply.qaa_date}" pattern="yyyy-MM-dd" /></p>
						<p>${qaReply.qaa_content}</p>
						
						<c:if test="${member.user_name eq qaReply.user_name}">
							<p>
								<a href="/qaBoard/qaReplyModify?qaa_no=${qaReply.qaa_no}">수정</a>, 
								<a href="/qaBoard/qaReplyDelete?qaa_no=${qaReply.qaa_no}">삭제</a>
							</p>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ul>
	
	</div>

	<%@ include file="../include/footer.jsp" %>	

</body>
</html>