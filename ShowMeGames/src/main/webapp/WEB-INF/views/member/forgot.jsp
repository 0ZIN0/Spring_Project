<!-- 비밀번호 재설정 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/member/login" var="resource" />
<c:url value="/resources/member/login/forgot.css" var="css1" />
<c:url value="/resources/img/index" var="img" />
<c:url value="/resources/img/member" var="member_img" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${css1}">
<meta charset="UTF-8">
<title>비밀번호 재설정 페이지</title>
</head>
<body>
	<div class="main-container">
		<div class="logo-container">
			<div id="login_logo">
				<img src="${member_img}/login_img.png" alt="배너사진"
					class="login-image">
			</div>
		</div>

		<section class="content">
			<h2>비밀번호를 잊으셨나요?</h2>
		</section>

		<div id="content-id">
			<form action="" id="resetPasswordForm">
				<p>아래 이메일 주소를 입력하면 새로운 암호를 설정할 수 있는 링크를 보내드리겠습니다.</p>
				
				
				
				
				<div id="email">
					<label for="email-input" id="email-label">이메일 주소</label> <input
						type="text" id="email-input" name="user_id" /> <i
						class="fa-regular fa-envelope fa-xs"></i>
				</div>

				<div id=email-guide>
					<i class="fa-solid fa-circle-exclamation fa-xs"
						style="color: #ff0000;"></i> <label for="" id="email-guideText">이메일
						주소가 잘못되었습니다!</label>
				</div>

				<div id=email-empty>
					<i class="fa-solid fa-circle-exclamation fa-xs"
						style="color: #ff0000;"></i> <label for="" id="email-emptyText">
						입력 필요</label>
				</div>
				
				
				
				
				<button type="submit" class="submit-button">제출</button>
				
				<button type="button" class="cancel-button" onclick="closeWindow()">취소</button>
				
			</form>
		</div>
	</div>

	<script src="https://www.gstatic.com/firebasejs/7.14.4/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.14.4/firebase-auth.js"></script>
	
    <script src="${resource}/forgot.js"></script>
</body>
</html>