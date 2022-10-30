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

<link rel="shortcut icon" type="image/x-icon"
	href="../../resources/img/favicon.png">

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

<script src="https://unpkg.com/tesseract.js@2.1.4/dist/tesseract.min.js"></script>

<script>
        function progressUpdate(packet){
            var log = document.getElementById('log');
        
            if(log.firstChild && log.firstChild.status === packet.status){
                if('progress' in packet){
                    var progress = log.firstChild.querySelector('progress')
                    progress.value = packet.progress
                }
            }else{
                var line = document.createElement('div');
                line.status = packet.status;
                var status = document.createElement('div')
                status.className = 'status'
                status.appendChild(document.createTextNode(packet.status))
                line.appendChild(status)
        
                if('progress' in packet){
                    var progress = document.createElement('progress')
                    progress.value = packet.progress
                    progress.max = 1
                    line.appendChild(progress)
                }
        
        
                if(packet.status == 'done'){ //text 출력
                    var pre = document.createElement('pre')
                    pre.appendChild(document.createTextNode(packet.data.data.text))
                    line.innerHTML = ''
                    line.appendChild(pre)
        
                }
        
                log.insertBefore(line, log.firstChild)
            }
        }
        
        async function recognizeFile(file) {
            document.querySelector("#log").innerHTML = ''
          	const corePath = window.navigator.userAgent.indexOf("Edge") > -1
            	? 'https://unpkg.com/tesseract.js-core@v2.0.0/tesseract-core.wasm.js'
            		: 'https://unpkg.com/tesseract.js-core@v2.0.0/tesseract-core.wasm.js';
        
          	const lang = document.querySelector('#langsel').value
          	const data = await Tesseract.recognize(file, lang, {corePath, logger: progressUpdate});
          	progressUpdate({ status: 'done', data });
        }
        </script>


</head>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/nav2.jsp"%>

<div class="row text-center pt-3 mt-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h2">사진으로 추가</h1>
	</div>
</div>


<div class="container mt-3">

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

			<div class="row">
				<div class="col-2"></div>
				<div class="col-3">
					<select class="form-select" id="langsel"
						onchange="window.lastFile && recognizeFile(window.lastFile)">
						<option selected="selected" value="kor">Korean</option>
						<option value="eng">English</option>
					</select>
				</div>
				<div class="col-5">
					<input class="form-control" type="file"
						onchange="recognizeFile(window.lastFile=this.files[0])">

				</div>
				<div class="col-2"></div>
			</div>

			<div class="row">

				<div class="col-5">
					<div id="log"></div>
				</div>

				<div class="col-7">
				
				</div>

			</div>

			<div id="log"></div>


		</div>

		<div class="col-1"></div>
	</div>


</div>

<%@ include file="../include/footer.jsp"%>

</body>
</html>