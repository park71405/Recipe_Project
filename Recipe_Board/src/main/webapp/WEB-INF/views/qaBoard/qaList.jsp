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
	
		<table>
			<thead>
  				<tr>
   					<th>번호</th>
   					<th>제목</th>
   					<th>작성일</th>
   					<th>작성자</th>
  				</tr>
 			</thead>
 
 			<tbody>
  				<c:forEach items="${qaList}" var="qaList">
 					<tr>
  						<td>${qaList.qa_no}</td>
  						<td>
  							<a href="/qaBoard/qaView?qa_no=${qaList.qa_no}">${qaList.qa_title}</a>	
  						</td>
  						<td><fmt:formatDate value="${qaList.qa_date}" pattern="yyyy-MM-dd" /></td>
  						<td>${qaList.user_name}</td>
 					</tr>
				</c:forEach>
 			</tbody>
		</table>
		
		<div>
			<c:if test="${prev}">
				<span>[ <a href="/qaBoard/qaList?num=${qaStartPageNum - 1}${qa_searchTypeKeyword}">이전</a> ] </span>
			</c:if>
			
 			<c:forEach begin="${qaStartPageNum}" end="${qaEndPageNum}" var="num" >
    			<span>
     				
     				<c:if test="${qaSelect != num}">
     					<a href="/qaBoard/qaList?num=${num}${qa_searchTypeKeyword}">${num}</a>
     				</c:if>
     				
     				<c:if test="${qaSelect == num}">
     					<b>${num}</b>
     				</c:if>
     				
  				</span>
 			</c:forEach>
 			
 			<c:if test="${next}">
				<span>[ <a href="/qaBoard/qaList?num=${qaEndPageNum + 1}${qa_searchTypeKeyword}">다음</a> ] </span>
			</c:if>
		</div>
		
		<div>
			<select name="qa_SearchType">
				<option value="qa_title" <c:if test="${qa_SearchType eq 'qa_title'}"> selected </c:if>>제목</option>
				<option value="qa_content" <c:if test="${qa_SearchType eq 'qa_content'}"> selected </c:if>>내용</option>
				<option value="qa_title_content" <c:if test="${qa_SearchType eq 'qa_title_content'}"> selected </c:if>>제목+내용</option>
				<option value="user_name" <c:if test="${qa_SearchType eq 'user_name'}"> selected </c:if>>작성자</option>
			</select>
			
			<input type="text" name="qa_keyword" value="${qa_keyword}" />
			
			<button type="button" id="qaSearchBtn">검색</button>
		</div>
		
		<script>
			document.getElementById("qaSearchBtn").onclick = function(){
				let qa_SearchType = document.getElementsByName("qa_SearchType")[0].value;
				let qa_keyword = document.getElementsByName("qa_keyword")[0].value;
				
				location.href = "/qaBoard/qaList?num=1" + "&qa_SearchType=" + qa_SearchType + "&qa_keyword=" + qa_keyword;
			};
		</script>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>