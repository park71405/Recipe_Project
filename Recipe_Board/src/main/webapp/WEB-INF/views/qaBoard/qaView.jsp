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
		
		<label>제목</label>
		${qaView.qa_title}<br />
			
		<label>작성자</label>
		${member.user_name}<br />
			
		<label>내용</label>
		${qaView.qa_content}<br />
	
		<c:if test="${member.user_name eq qaView.user_name}">
			<div>
				<a href="/qaBoard/qaModify?qa_no=${qaView.qa_no}">QA 수정</a>,
				<a href="/qaBoard/qaDelete?qa_no=${qaView.qa_no}">QA 삭제</a>
			</div>
		</c:if>
	
		<!-- 댓글 시작 -->
		
		<hr />
		<ul>
			<c:forEach items="${qaReply}" var="qaReply">
				<li>
					<div>
						<p>${qaReply.user_name} / <fmt:formatDate value="${qaReply.qaa_date}" pattern="yyyy-MM-dd" /></p>
						<p>${qaReply.qaa_content}</p>
						
						<c:if test="${member.user_name eq qaReply.user_name}">
							<p>
								<a href="/qaReply/qaReplyModify?qaa_no=${qaReply.qaa_no}">수정</a>, 
								<a href="/qaReply/qaReplyDelete?qaa_no=${qaReply.qaa_no}&qa_no=${qaReply.qa_no}">삭제</a>
							</p>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ul>
		
		<c:if test="${member != null}">
		<div>
			<form method="post" action="/qaReply/qaReplyWrite">
				<p>
					<textarea name="qaa_content" rows="5" cols="50"></textarea>
				</p>
				<p>
					<input type="hidden" name="qa_no" value="${qaView.qa_no}"> 
					<input type="hidden" name="user_name" value="${member.user_name}">
					<button type="submit">댓글 작성</button>
				</p>
		
			</form>
		</div>
		
		</c:if>
		
		
		<!-- 댓글 끝 -->
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>