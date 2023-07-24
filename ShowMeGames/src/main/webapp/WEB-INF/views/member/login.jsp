<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/index/css/login.css" var="css1" />
<c:url value="/resources/img/index" var="img" />
<c:url value="/resources/img/member" var="member_img" />
<script src="https://kit.fontawesome.com/c48a5ad62b.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${css1}">
	<title>로그인</title>
</head>
<body>
	
	<div class="main-container">
		<div class="logo-container">
			<div id="login_logo">
				<img src="${member_img}/login_img.png" alt="배너사진" class="login-image">	
			</div>
		</div>
		
		<section class="loginAndSignUp-container">
				<h2>
					<span id="IdLoginText">로그인</span>
					<a class="title-link" href="./signup">회원가입</a>
				</h2>
		</section>
		
		<div class="infor-container">
			<div id="email">
				<label for="email-input">이메일 주소</label>
				<input type="text" id="email-input" />
				<i class="fa-regular fa-envelope fa-xs"></i>
			</div>
			<div id="pw">
				<label for=""></label>
				<input type="password" id="pw-input" />
				<i class="fa-solid fa-lock fa-xs"></i>
			</div>
		
		</div>
	</div>
	
	
</body>
</html>