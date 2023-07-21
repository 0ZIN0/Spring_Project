<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/index/css/login.css" var="css1" />
<c:url value="/resources/img/index" var="img" />
<c:url value="/resources/img/member" var="member_img" />
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
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
				<img src="${member_img}/temp_login_image.png" alt="대체사진"
					class="login-image">

			</div>
		</div>

		<section class="loginAndSignUp-container">
			<h2>
				<span id="IdLoginText">로그인</span> <a class="title-link"
					href="./signup">계정 생성하기</a>
			</h2>
		</section>

		<div class="infor-container">
			<div id="email">
				<label for="email-input" id="email-font">이메일 주소</label> <input
					type="text" id="email-input" /> <i
					class="fa-regular fa-envelope fa-xs"></i>
			</div>
			<div id="pw">
				<label for=""></label> <input type="password" id="pw-input" /> <i
					class="fa-solid fa-lock fa-xs"></i>
			</div>

		</div>



		<div id="remember-and-forget">
			<div>
				<input type="checkbox" id="rememberCheckbox" /> <label
					for="rememberCheckbox" id="rememberLabel">저장</label>
			</div>
			<div>
				<a role="button" href="null" id="forgetBtn"> 비밀번호를 잊으셨나요?</a>
			</div>

		</div>

		<div class="login-btn" id="loginBtn">로그인</div>

		<div class="easyLogin">간편 로그인</div>

		<div class="private-div">
			<a href="" id="private-btn">개인정보처리방침 확인하기</a>
		</div>

	</div>

	<script>
		const privateBtn = document.getElementById("private-btn");

		privateBtn.addEventListener("click", function(event) {
			event.preventDefault();

			window.open("/smg/introduce/private");
		});
	</script>
	
	<script>
    // email-input 요소를 찾습니다.
    const emailInput = document.getElementById("email-input");

    // 커서가 깜빡일 때에 대한 이벤트 리스너를 추가합니다.
    emailInput.addEventListener("focus", () => {
        const emailFont = document.getElementById("email-font");
        // Blink 클래스를 적용합니다.
        emailFont.classList.add("blink");
        // No-blink 클래스를 제거합니다.
        emailFont.classList.remove("no-blink");
    });

    // 커서가 깜빡이지 않을 때에 대한 이벤트 리스너를 추가합니다.
    emailInput.addEventListener("blur", () => {
        const emailFont = document.getElementById("email-font");
        // No-blink 클래스를 적용합니다.
        emailFont.classList.add("no-blink");
        // Blink 클래스를 제거합니다.
        emailFont.classList.remove("blink");
    });
</script>


</body>
</html>