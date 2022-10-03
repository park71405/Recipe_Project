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
   					<th>메뉴명</th>
   					<th>조리방법</th>
   					<th>요리종류</th>
   					<th>이미지</th>
  				</tr>
 			</thead>
 
 			<tbody>
  				<c:forEach items="${rcpList}" var = "rcpList">
 					<tr>
 						<td>${rcpList.rcp_seq}</td>
 						<td>
 							<a href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}">${rcpList.rcp_nm}</a>
 						</td>
 						<td>${rcpList.rcp_way2}</td>
 						<td>${rcpList.rcp_pat2}</td>
 						<td><img src="${rcpList.att_file_no_main}"  width="200" height="200" /></td>
 					</tr>
 				</c:forEach>
 			</tbody>

		</table>
		
		<div>
			<c:if test="${prev}">
				<span>[ <a href="/rcpBoard/rcpList?num=${rcpStartPageNum - 1}${rcpSearchTypeKeyword}">이전</a> ] </span>
			</c:if>
			
 			<c:forEach begin="${rcpStartPageNum}" end="${rcpEndPageNum}" var="num" >
    			<span>
     				
     				<c:if test="${rcpSelect != num}">
     					<a href="/rcpBoard/rcpList?num=${num}${rcpSearchTypeKeyword}">${num}</a>
     				</c:if>
     				
     				<c:if test="${rcpSelect == num}">
     					<b>${num}</b>
     				</c:if>
     				
  				</span>
 			</c:forEach>
 			
 			<c:if test="${next}">
				<span>[ <a href="/rcpBoard/rcpList?num=${rcpEndPageNum + 1}${rcpSearchTypeKeyword}">다음</a> ] </span>
			</c:if>
		</div>
		
		<div>
			<select name="rcpSearchType">
				<option value="rcpTitle" <c:if test="${rcpSearchType eq 'rcpTitle'}"> selected </c:if>>제목</option>
			</select>
			
			<input type="text" name="rcpKeyword" value="${rcpKeyword}" />
			
			<button type="button" id="rcpSearchBtn">검색</button>
		</div>
		
		<script>
			document.getElementById("rcpSearchBtn").onclick = function(){
				let rcpSearchType = document.getElementsByName("rcpSearchType")[0].value;
				let rcpKeyword = document.getElementsByName("rcpKeyword")[0].value;
				
				location.href = "/rcpBoard/rcpList?num=1" + "&rcpSearchType=" + rcpSearchType + "&rcpKeyword=" + rcpKeyword;
			};
		</script>
	
	</div>

	<%@ include file="../include/footer.jsp" %>
	

</body>
</html>