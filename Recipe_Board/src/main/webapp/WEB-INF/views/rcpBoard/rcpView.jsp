<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    
    <script>
    	function listView(rcp_seq) {
        	let f = document.createElement('form';)
        	let obj;
        	obj = document.createElement('input');
        	obj.setAttribute('type', 'hidden');
        	obj.setAttribute('name', 'rcp_seq');
        	obj.setAttribute('value', rcp_seq);
        	
        	f.appendChile(obj);
        	f.setAttribute('method', 'post');
        	document.body.appendChild(f);
        	f.submit();
    	}
    </script>
    
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	

	<%@ include file="../include/nav.jsp" %>
	
	
	

	<div class="container">
	
		<!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    	<img class="card-img-top mb-5 mb-md-0" src="${rcpView.att_file_no_main}" alt="..." />
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder" >${rcpView.rcp_nm}</h1>
                        <div class="row">
                        	<p class="col-sm-3"><strong>조리방법</strong></p>
  							<p class="col-sm-9">${rcpView.rcp_way2}</p>
  								
  							<p class="col-sm-3">요리종류</p>
  							<p class="col-sm-9">${rcpView.rcp_pat2}</p>
  								
  							<p class="col-sm-3">열량</p>
  							<p class="col-sm-9">${rcpView.info_eng}</p>
                        	<c:if test="${member != null}">
                        		<c:if test="${count != 0}"> 
                        			<p class="col-sm-3">
                        				<form method="post">
                        					<input type="text" name="rcp_seq" value="rcp_seq" hidden>
                        					<button type="submit" class="btn btn-outline-secondary"><i class="bi bi-heart-fill"></i></button>
                        				</form>
                        			</p>
                        		</c:if>
                        		<c:if test="${count == 0}"> 
                        			<p class="col-sm-3">
                        				<form method="post">
                        					<input type="text" name="rcp_seq" value="rcp_seq" hidden>
                        					<button type="submit" class="btn btn-outline-secondary"><i class="bi bi-heart"></i></button>
                        				</form>
                        			</p>
                        		</c:if>
                        	</c:if>	
                       	</div>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<div class="col-3">
                		<p class=""><hr>재료</p>
                	</div>
                	<div class="col-9"></div>
                </div>
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<c:forEach items="${partsView}" var="partsView">
  						<div class="col-6">
                			<p class="col-sm-9">${partsView.rcp_pat_nm} : ${partsView.rcp_pat_vl}</p>
                		</div>
  					</c:forEach>
                </div>
                
                <!-- 조리순서 시작 -->
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<div class="col-3">
                		<p class=""><hr>조리순서</p>
                	</div>
                	<div class="col-9"></div>
                </div>
                <div class="row gx-4 gx-lg-5 align-items-center mb-1">
                	<div class="col-7">
                		<p>${proView.manual01}</p>
                	</div>
                	<div class="col-5">
                		<img src="${proView.manual_img01}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                	</div>
                </div>
                
                <c:if test="${proView.manual02 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual02}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img02}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				
  				<c:if test="${proView.manual03 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual03}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img03}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				
  				<c:if test="${proView.manual04 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual04}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img04}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				
  				<c:if test="${proView.manual05 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual05}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img05}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				
  				<c:if test="${proView.manual06 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual06}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img06}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual07 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual07}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img07}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual08 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual08}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img08}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual09 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual09}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img09}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual10 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual10}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img10}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual11 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual11}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img11}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual12 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual12}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img12}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual13 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual13}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img13}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual14 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual14}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img14}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual15 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual15}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img15}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual16 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual16}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img16}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual17 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual17}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img17}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual18 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual18}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img18}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual19 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual19}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img19}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
  				<c:if test="${proView.manual20 != ''}">
   					<div class="row gx-4 gx-lg-5 align-items-center mb-1">
                		<div class="col-7">
                			<p>${proView.manual20}</p>
                		</div>
                		<div class="col-5">
                			<img src="${proView.manual_img20}" class="img-fluid" alt="이미지를 로딩할 수 없습니다." />
                		</div>
                	</div>						
  				</c:if>
                
            </div>
        </section>
	
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>