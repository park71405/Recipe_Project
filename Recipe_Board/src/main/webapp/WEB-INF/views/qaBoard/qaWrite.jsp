<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<title>뭐 먹지</title>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/common.css" rel="stylesheet" />

</head>
<body>



	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>


	<div class="container">

		<c:if test="${member == null}">
			<script>
				alert("로그인을 하셔야 QA를 작성하실 수 있습니다.");
				location.href = "../member/signin";
			</script>
		</c:if>

		<div class="row col-md-8" style="float: none; margin: 0 auto;">
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

					<div class="mb-3 row">
						<label class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" name="qa_title" class="form-control">
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-2 col-form-label">작성자</label>
						<div class="col-sm-10">
							<input type="text" name="user_name" readonly class="form-control-plaintext" value="${member.user_name}">
						</div>
					</div>

					<div class="mb-3 form-floating">
						<textarea name="qa_content" class="form-control h-25" rows="10" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
						<label for="floatingTextarea2">내용</label>
					</div>

					<div class="input-group mb-3 row">
						<label for="qaImg" class="col-sm-2 col-form-label">이미지</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="qaImg" onchange="readURL(this)" aria-label="Upload" />
						</div>
						<img class="embed-responsive-item" id="preview" />

						<script>
							function readURL(input) {
							  	if (input.files && input.files[0]) {
							    	var reader = new FileReader();
							    	reader.onload = function(e) {
							      		document.getElementById('preview').src = e.target.result;
							    	};
							    	reader.readAsDataURL(input.files[0]);
							  	} else {
							    	document.getElementById('preview').src = "";
							  	}
							}	
						</script>
					</div>

				<div class="mb-3 col-auto" style="float: right">
					<a href="qaList?num=1" role="button" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary" id="btn-save">등록</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>