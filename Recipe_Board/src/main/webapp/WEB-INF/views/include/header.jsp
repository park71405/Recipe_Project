<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

	<nav class="navbar navbar-expand-lg bg-dark navbar-light d-lg-block" id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
				
				</div>
				<div>
					<form>
						<div>
        					<c:if test="${member == null}">
        						<button type="button" class="navbar-sm-brand btn btn-dark text-light text-decoration-none" onclick="location.href='../member/signup'">회원가입</button>
        						<button type="button" class="navbar-sm-brand btn btn-dark text-light text-decoration-none" onclick="location.href='../member/signin'">로그인</button>
  							</c:if>
  							<c:if test="${member != null}">
  								<button type="button" class="navbar-sm-brand btn btn-dark text-light text-decoration-none" onclick="#'">${member.user_name}님</button>
        						<button type="button" class="navbar-sm-brand btn btn-dark text-light text-decoration-none" onclick="location.href='../member/signout'">로그아웃</button>
  							</c:if>
  						</div>
        			</form>
				</div>
			
			</div>
		</div>
	</nav>
