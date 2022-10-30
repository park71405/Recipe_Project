<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<nav class="navbar navbar-expand-lg navbar-light shadow mb-1">
		<div class="container d-flex justify-content-between align-items-center">
			<a class="navbar-brand text-success logo h1 align-self-center" href="/rcpBoard/rcpList?num=1">
                CookCook
            </a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            	<div class="flex-fill">
            		<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
            		
            			<li class="nav-item">
                        	<a class="nav-link" aria-current="page" href="/manager/memberList?num=1">
                        		회원
                        	</a>
                        </li>
                        
                        <li class="nav-item">
                        	<a class="nav-link" aria-current="page" href="/manager/rcpList?num=1">
                        		레시피
                        	</a>
                        </li>
                        
                        <li class="nav-item">
                        	<a class="nav-link" aria-current="page" href="/manager/reviewList?num=1">
                        		요리후기
                        	</a>
                        </li>
                        
                        <li class="nav-item">
                        	<a class="nav-link" aria-current="page" href="/manager/noList?num=1">
                        		공지사항
                        	</a>
                        </li>
                        <li class="nav-item">
                        	<a class="nav-link" aria-current="page" href="/manager/qaList?num=1">
                        		Q/A
                        	</a>
                        </li>
            		</ul>
            	</div>
            </div>
		</div>
	</nav>
