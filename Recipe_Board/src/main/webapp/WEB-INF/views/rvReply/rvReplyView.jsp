<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<ul>
			<c:forEach items="${rvReply}" var="rvReply">
				<li>
					<div>
						<p>${rvReply.user_name} / <fmt:formatDate value="${rvReply.rva_date}" pattern="yyyy-MM-dd" /></p>
						<p>${rvReply.rva_content}</p>
						
						<c:if test="${member.user_name eq rvReply.user_name}">
							<p>
								<a href="/reviewBoard/rvReplyModify?rva_no=${rvReply.rva_no}">수정</a>, 
								<a href="/reviewBoard/rvReplyDelete?rva_no=${rvReply.rva_no}">삭제</a>
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