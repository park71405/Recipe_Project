<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>모먹지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="../../resources/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="../../resources/img/favicon.ico">

<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/templatemo.css">
<link rel="stylesheet" href="../../resources/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../../resources/css/fontawesome.min.css">

<script src="../../resources/js/jquery-1.11.0.min.js"></script>
<script src="../../resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/templatemo.js"></script>
<script src="../../resources/js/custom.js"></script>
</head>
<body>



	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>


	<div class="container">

		<div class="row">
			<div class="col-md-10" style="float: none; margin: 0 auto;">
				<table class="table table-condensed center">
					<thead>
						<tr align="center">
							<th width="10%">제목</th>
							<th width="60%">${qaView.qa_title}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>작성일</td>
							<td><fmt:formatDate value="${qaView.qa_date}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${qaView.user_name}</td>
						</tr>
						<tr>
							<td colspan="2">
								<p>${qaView.qa_content}</p> 
								<c:if test="${reviewView.rv_img != null }">
									<img class="img-fluid"
										src="../../../resources/imgUpload/qa/${qaView.qaImg}"
										alt="잘못된 형식" />
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${member.user_name eq qaView.user_name}">
					<table class="table table-condensed">
						<thead>
							<tr>
								<td><span style="float: right">
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/qaBoard/qaModify?qa_no=${qaView.qa_no}'">수정</button>
										<button type="button" class="btn btn-outline-success"
											onclick="location.href='/qaBoard/qaDelete?qa_no=${qaView.qa_no}'">삭제</button>
								</span></td>
							</tr>
						</thead>
					</table>
				</c:if>
			</div>
		</div>


		<!-- 댓글 시작 -->

		<hr />

		<ul>
			<c:forEach items="${qaReply}" var="qaReply">
				<li>
					<div>
						<p>${qaReply.user_name}
							/
							<fmt:formatDate value="${qaReply.qaa_date}" pattern="yyyy-MM-dd" />
						</p>
						<p>${qaReply.qaa_content}</p>

						<c:if test="${member.user_name eq qaReply.user_name}">
							<p>
								<button type="button" class="btn btn-outline-success"
									onclick="location.href='/qaReply/qaReplyModify?qaa_no=${qaReply.qaa_no}'">수정</button>
								<button type="button" class="btn btn-outline-success"
									onclick="location.href='/qaReply/qaReplyDelete?qaa_no=${qaReply.qaa_no}&qa_no=${qaReply.qa_no}'">삭제</button>
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

	<%@ include file="../include/footer.jsp"%>

</body>
</html>