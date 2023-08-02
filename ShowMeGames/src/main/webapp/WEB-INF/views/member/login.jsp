<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/member/login" var="resource" />
<c:url value="/resources/member/login/login.css" var="css1" />
<c:url value="/resources/img/index" var="img" />
<c:url value="/resources/img/member" var="member_img" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${css1}">
	<title>로그인</title>
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/c48a5ad62b.js" crossorigin="anonymous"></script>
    <!-- naver sdk -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
	<form action="./check" name="logining">
		<div class="main-container">
			<div class="logo-container">
				<div id="login_logo">
					<img src="${member_img}/login_img.png" alt="배너사진" class="login-image">
				</div>
			</div>
			<section class="loginAndSignUp-container">
				<h2>
					<span id="IdLoginText">로그인</span> <a class="title-link" href="./signup">계정 생성하기</a>
				</h2>
			</section>

			<div class="infor-container">
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

				<div id="pw">
					<label for="pw-input" id="pw-label">비밀번호</label> <input
						type="password" id="pw-input" name="user_pw" /> <i
						class="fa-solid fa-lock fa-xs"></i>
				</div>

				<div id=pw-empty>
					<i class="fa-solid fa-circle-exclamation fa-xs"
						style="color: #ff0000;"></i> <label for="" id="pw-emptyText">
						입력 필요</label>
				</div>

				<div id="login-failed" style="padding: 6px; display: none;">
					<i class="fa-solid fa-circle-exclamation fa-xs"
						style="color: #ff0000;"></i> <label for="" id="login-failedText">이메일주소
						또는 비밀번호가 잘못되었습니다.</label>
				</div>

			</div>

			<div id="remember-and-forget">

				<!-- <div>
					<input type="checkbox" id="rememberCheckbox" /> <label
						for="rememberCheckbox" id="rememberLabel">저장</label>
				</div> -->
				<div>
					<a role="button" href="./pw_find" id="forgetBtn" > 비밀번호를 잊으셨나요?</a>
				</div>

			</div>

			<div class="login-btn" id="loginBtn">로그인</div>

			<div class="easyLogin">간편 로그인</div>

			<div id="naverIdLogin" style="display: none;"></div>
			<div class="naver-login-btn" id="naverLoginBtn">네이버 로그인</div>

			<div class="private-div">
				<a href="" id="private-btn">개인정보처리방침 확인하기</a>
			</div>
			
		</div>
		
	</form>

	<script src="${resource}/login.js"></script>
	<script src="${resource}/naverLogin.js"></script>
</body>
</html>