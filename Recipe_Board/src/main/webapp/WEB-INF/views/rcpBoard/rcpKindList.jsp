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
</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<%@ include file="../include/nav.jsp"%>
	
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="h2 pb-4">요리 종류</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
							밥
						</a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
							후식
						</a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
							반찬
						</a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
							국+찌개
						</a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
							일품
						</a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
							기타
						</a>
					</li>
				</ul>
			</div>
			
			<div class="col-lg-9">
				<div class="row">
					<c:forEach items="${rcpList}" var="rcpList">
						<div class="col-md-4">
							<div class="card mb-4 product-wap rounded-0">
								<div class="card rounded-0">
									<img class="card-img rounded-0 img-fluid" src="${rcpList.att_file_no_main}">
									<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
										<ul class="list-unstyled">
											<li><a class="btn btn-success text-white" href="#"><i class="far fa-heart"></i></a></li>
											<li><a class="btn btn-success text-white mt-2" href="/rcpBoard/rcpView?rcp_seq=${rcpList.rcp_seq}"><i class="far fa-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="card-body">
									<a href="shop-single.html" class="h3 text-decoration-none">${rcpList.rcp_nm}</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 페이지 넘김 -->
				<div class="row">
                    <ul class="pagination pagination-lg justify-content-end">
                    	<li class="page-item"><c:if test="${prev_m}">
                    		<a class="page-link"
								href="/rcpBoard/rcpKindList?num=${rcpStartPageNum - 1}${rcpSearchTypeKeyword}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
                    	</c:if></li>
                    	<c:forEach begin="${rcpStartPageNum}" end="${rcpEndPageNum}" var="num">
                    		<span>
                    			<c:if test="${rcpSelect != num}">
                        			<li class="page-item">
                            			<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" 
                            				href="/rcpBoard/rcpKindList?num=${num}${rcpSearchTypeKeyword}">${num}</a>
                        			</li>
                        		</c:if>
                        		<c:if test="${rcpSelect == num}">
                        			<li class="page-item disabled">
                        				<a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" 
                        					href="#" tabindex="-1">${num}</a>
                        			</li>
                        		</c:if>
                        	</span>
                        </c:forEach>
                        <li class="page-item">
                        	<c:if test="${next_m}">
								<a class="page-link" href="/rcpBoard/rcpKindList?num=${rcpEndPageNum + 1}${rcpSearchTypeKeyword}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
							</c:if>
						</li>
                    </ul>
                </div>
                
			</div>
			
		<div class="container-fluid d-flex w-50 h-50 p-3">
				<select name="rcpSearchType">
					<option value="rcpTitle" <c:if test="${rcpSearchType eq 'rcpTitle'}"> selected </c:if>>제목</option>
				</select> 
				<input class="form-control me-2" type="text" name="rcpKeyword" value="${rcpKeyword}" placeholder="검색" aria-label="Search">
				<button class="btn btn-outline-success" type="submit" id="rcpSearchBtn">검색</button>
			</div>

			<script>
				document.getElementById("rcpSearchBtn").onclick = function() {
					let rcpSearchType = document.getElementsByName("rcpSearchType")[0].value;
					let rcpKeyword = document.getElementsByName("rcpKeyword")[0].value;

					location.href = "/rcpBoard/rcpKindList?num=1&rcpSearchType=" + rcpSearchType + "&rcpKeyword=" + rcpKeyword;
				};
			</script>
			
		</div>
		
	</div>
	
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>