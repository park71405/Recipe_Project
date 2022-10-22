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
    
    <!-- 경고창 이쁜거 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</head>
<body>



	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>


	<div class="container my-5">
		
		<c:if test="${member == null}">
			<script>
				swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(function(){
					location.href = "../member/signin";
				});
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
						<label class="col-sm-2 col-form-label">이미지</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" name="files" onchange="readURL(this)" aria-label="Upload" multiple="multiple"/>
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