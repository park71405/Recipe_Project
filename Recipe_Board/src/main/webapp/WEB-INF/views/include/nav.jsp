<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<nav class="navbar navbar-expand-lg navbar-light mb-1">
		<div class="container d-flex justify-content-between align-items-center">
			<a class="navbar-brand text-success logo h1 align-self-center" href="/rcpBoard/rcpList?num=1">
                Just Eat!
            </a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            	<div class="flex-fill">
            		<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
            		
            			<li class="nav-item">
                        	<a class="nav-link" aria-current="page" href="/rcpBoard/nowRcpList?num=1&count=2">
                        		바로조리
                        	</a>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            	냉장고
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/refri/refriTypeList">분류</a></li>
                                <li><a class="dropdown-item" href="/refri/refriList?num=1">전체보기</a></li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">메뉴조회</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/rcpBoard/rcpKindTypeList?num=1&rcpType=밥">요리 종류</a></li>
                                <li><a class="dropdown-item" href="/rcpBoard/rcpKindTypeList?num=1&rcpCookM=볶기">조리 방법</a></li>
                                <li><a class="dropdown-item" href="/rcpBoard/rcpAllList?num=1">전체 보기</a></li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="../reviewBoard/reviewList?num=1">요리 후기</a></li>
                                <li><a class="dropdown-item" href="/noBoard/noList?num=1">공지 사항</a></li>
                                <li><a class="dropdown-item" href="../qaBoard/qaList?num=1">QA</a></li>
                            </ul>
                        </li>
            		</ul>
            	</div>
            	
            	<div class="navbar align-self-center d-flex">
            		<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
            		</div>
            		<a class="nav-icon position-relative text-decoration-none" href="/myPage/userInfo">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>MYPAGE
                    </a>
            	</div>
            </div>
		</div>
	</nav>
