<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/member/login/login.css" var="css1" />
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
<form action="./check" name="logining">
	<div class="main-container">
		<div class="logo-container">
			<div id="login_logo">

				<img src="${member_img}/login_img.png" alt="배너사진" class="login-image">	

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
				<label for="email-input" id="email-label">이메일 주소</label> <input
					type="text" id="email-input" name="user_id"/> <i
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
					type="password" id="pw-input" name="user_pw"/> <i class="fa-solid fa-lock fa-xs"></i>
			</div>
			
			<div id=pw-empty>
				<i class="fa-solid fa-circle-exclamation fa-xs"
					style="color: #ff0000;"></i> <label for="" id="pw-emptyText">
					입력 필요</label>
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
</form>	


	<script>
		const privateBtn = document.getElementById("private-btn");

		privateBtn.addEventListener("click", function(event) {
			event.preventDefault();

			window.open("/smg/introduce/private");
		});
	</script>


	<script>
	 	const emailInput = document.getElementById("email-input");
	    const emailLabel = document.getElementById("email-label");
	    const emailEmpty = document.getElementById("email-empty"); 
	    
	    const pwInput = document.getElementById("pw-input");
	    const pwLabel = document.getElementById("pw-label");
	    const pwEmpty = document.getElementById("pw-empty"); 

	    
	    function applySmallStyle() {
	        emailLabel.classList.add("small");
	        emailLabel.classList.remove("big");
	    }

	    function applyBigStyle() {
	        emailLabel.classList.add("big");
	        emailLabel.classList.remove("small");
	    }
	    
	    function applySmallStylePw() {
	        pwLabel.classList.add("smallPw");
	        pwLabel.classList.remove("bigPw");
	    }

	    function applyBigStylePw() {
	        pwLabel.classList.add("bigPw");
	        pwLabel.classList.remove("smallPw");
	    }
	    
	    

	    
	    
	    function applyValidStyle() {
	        emailInput.style.borderBottom = "2px solid #80bc00";
	    }

	    function applyInvalidStyle() {
	        emailInput.style.borderBottom = "2px solid #CC0011";
	    }

	    
	    
	    
	    
	    
	    function applyValidStylePw() {
	        pwInput.style.borderBottom = "2px solid #80bc00";
	    }
	    
	    function applyInvalidStylePw() {
	        pwInput.style.borderBottom = "2px solid #CC0011";
	    }

	   
	    
	    
	    
	    
	    function showEmailEmpty() {
	        emailEmpty.style.display = "block"; 
	    }

	    function hideEmailEmpty() {
	        emailEmpty.style.display = "none"; 
	    }
	    
	    function showPwEmpty() {
	        pwEmpty.style.display = "block"; 
	    }

	    function hidePwEmpty() {
	        pwEmpty.style.display = "none"; 
	    }

	    
	    
	    
	    emailInput.addEventListener("focus", () => {
	        applySmallStyle();
	    });

	    emailInput.addEventListener("blur", () => {
	        if (emailInput.value === "") {
	            applyBigStyle();
	            showEmailEmpty();
	            applyInvalidStyle();
	        } else {
	            hideEmailEmpty(); 
	        }
	    });
	    
	    
	    
	    pwInput.addEventListener("focus", () => {
	        applySmallStylePw();
	    });

	    pwInput.addEventListener("blur", () => {
	        if (pwInput.value === "") {
	            applyBigStylePw();
	            showPwEmpty();
	            applyInvalidStylePw();
	        } else {
	            hidePwEmpty(); 
	            applyValidStylePw();
	        }
	    });
	    
	    

	    emailInput.addEventListener("input", () => {
	        if (isValidEmail(emailInput.value)) {
	            applyValidStyle();
	            hideEmailGuide();
	        } else {
	            applyInvalidStyle();
	            showEmailGuide();
	        }

	        if (emailInput.value === "") {
	            showEmailEmpty(); 
	            hideEmailGuide();
	        } else {
	            hideEmailEmpty(); 
	        }
	    });
	    
	    
	    
	    pwInput.addEventListener("input", () => {
	        if (isValidPw(pwInput.value)) {
	            applyValidStylePw();
	            hidePwEmpty()
	        } else {
	            showPwEmpty();
	            applyInvalidStylePw();
	        }

	        if (pwInput.value === "") {
	        	showPwEmpty(); 
	        	 applyInvalidStylePw();
	        } else {
	        }
	    });
	    
	    
	    
	    
	    
	    
	    
	    
	    

	    function isValidEmail(email) {
	        const emailRegex = /^[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+@[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+\.[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
	        return emailRegex.test(email);
	    }

	    function showEmailGuide() {
	        const emailGuide = document.getElementById("email-guide");
	        emailGuide.style.display = "block";
	    }

	    function hideEmailGuide() {
	        const emailGuide = document.getElementById("email-guide");
	        emailGuide.style.display = "none";
	    }

	    
	    function isValidPw(pw) {
	    	return true;
	    }
	    
	    
	    
	    
	    
	    
	
	    const loginButton = document.querySelector('.login-btn');
	    loginButton.addEventListener('click', function() {
	        const form = document.forms.logining;
	        form.submit();
	    });
	    
	    
	    
	    
	    
</script>



</body>
</html>