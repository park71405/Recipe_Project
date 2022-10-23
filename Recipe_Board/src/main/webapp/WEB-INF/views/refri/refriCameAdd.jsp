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

<!-- 경고창 이쁜거 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- tesseract.js CDN -->
<script src='https://unpkg.com/tesseract.js@2.1.4/dist/tesseract.min.js'></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tesseract.js/2.1.5/tesseract.min.js"
	integrity="sha512-QMGuBW4cKAKmxjxukfPlQqFL8Tc2yYWTBhg9o8fKx06BGZrNXMmafjtnmXthGasytcaIILHRrg5N5Hw0yOuSjw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

	let txt;
	let $translatorArea = ${"#translatroArea"};
	
	const recognize = async ({ target: {files} }) => {
		//추춯할 언어 선택
		let $langsel = $("#langsel").val();
		
		await $("#extractOn").hide();
		await $("#Loading").show();

		const {
			data: {text}
		} = await Tesseract.recognize(
			files[0],
			$langsel,
			{
				corePath: 'https://unpkg.com/tesseract.js-core@v2.0.0/tesseract-core.wasm.js',
			}
		);
		
		// 텍스트 추출이 끝나면 로딩 이미지 감추기
        $("#Loading").hide();
		
     	// 텍스트 추출이 끝나면 텍스트 영역 보이도록 만들기
        $("#extractOn").show();
     	
        // 추출된 내용을 extractTxt 에 넣어둠
        $("#extractTxt").val(text);
        txt = text;
        
     	// 페이지 로딩 시 실행
        $(function (){
        	// 처음에는 텍스트 창 안보이게 && 로딩창도 안보이게
            $("#extractOn").hide();
            $("#Loading").hide();
            
            const $img = $("#upload")
            
         	// 이미지가 바뀔 때마다 recognize 함수가 실행됨 -> 사진에서 텍스트 가져오기
            $img.on("change", recognize);
        })
	}

</script>

</head>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/nav2.jsp"%>

<div class="container my-5">

	<c:if test="${member == null}">
		<script>
			swal('로그인 필요!', '로그인이 필요한 기능입니다. 로그인해주세요.', 'warning').then(
					function() {
						location.href = "../member/signin";
					});
		</script>
	</c:if>

	<div class="row ">
		<div class="col-1"></div>

		<div class="col-10">
		
				
		</div>

		<div class="col-1"></div>
	</div>


</div>

<%@ include file="../include/footer.jsp"%>

</body>
</html>