<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand">
            	<img alt="Brand" src="../../../resources/img/logo_t.png" class="img-responsive" style="height: 150px; width: auto;">
			</a>
			
			<form class="d-flex">
				<div>
        			<c:if test="${member == null}">
  						<button type="button" class="btn btn-outline-success" onclick="location.href='../member/signup'">회원가입</button>
  						<button type="button" class="btn btn-outline-success" onclick="location.href='../member/signin'">로그인</button>
  					</c:if>
  					<c:if test="${member != null}">
  						<li>${member.user_name}님</li>
  						<button type="button" class="btn btn-outline-success" onclick="location.href='../member/signout'">로그아웃</button>
  					</c:if>
  				</div>
        	</form>
			
		</div>
        
	</nav>
