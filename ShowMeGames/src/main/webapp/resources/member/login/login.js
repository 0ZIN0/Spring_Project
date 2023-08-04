   
    $(document).ready(function(){
   	window.resizeTo(496, 860);
   	}); 
  
   // 개인정보처리방침 확인하기 버튼 누르면 페이지 이동
    const privateBtn = document.getElementById("private-btn");
   
      privateBtn.addEventListener("click", function(event) {
      event.preventDefault();
   
      window.open("/smg/introduce/private");
      });
      
   
   // 이메일주소/비밀번호 입력 관련 CSS
    const emailInput = document.getElementById("email-input");
    const emailLabel = document.getElementById("email-label");
    const emailEmpty = document.getElementById("email-empty"); 
    
    const pwInput = document.getElementById("pw-input");
    const pwLabel = document.getElementById("pw-label");
    const pwEmpty = document.getElementById("pw-empty"); 

   // 입력칸 글자의 크기/위치 변화
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
    
    // 입력칸 아래 밑줄 변화
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
   
   // 입력칸 아래 '입력필요' 글자
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
   
   // '이메일 주소가 잘못되었습니다!' 글자
    function showEmailGuide() {
        const emailGuide = document.getElementById("email-guide");
        emailGuide.style.display = "block";
    }

    function hideEmailGuide() {
        const emailGuide = document.getElementById("email-guide");
        emailGuide.style.display = "none";
    }
   
   // 입력칸 focus/blur 변화
    emailInput.addEventListener("focus", () => {
        applySmallStyle();
    });

    emailInput.addEventListener("blur", () => {
        if (emailInput.value === "") {
            applyBigStyle();
            showEmailEmpty();
            applyInvalidStyle();
            document.getElementById('login-failed').style.display = 'none';
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
            document.getElementById('login-failed').style.display = 'none';
        } else {
            hidePwEmpty(); 
            applyValidStylePw();
        }
    });
    
    // 이메일 형식이 유효한지 판별
    function isValidEmail(email) {
        const emailRegex = /^[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+@[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+\.[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
        return emailRegex.test(email);
    }
    
   // 비밀번호는 한 글자만 입력해도 유효
    function isValidPw(pw) {
       return pw.length >= 1;
    }
    
    // 입력값이 유효한지에 따른 변화
    emailInput.addEventListener("input", () => {
        if (isValidEmail(emailInput.value)) {
            applyValidStyle();
            hideEmailGuide();
            document.getElementById('login-failed').style.display = 'none';
        } else {
            applyInvalidStyle();
            showEmailGuide();
            document.getElementById('login-failed').style.display = 'none';
        }

        if (emailInput.value === "") {
            showEmailEmpty(); 
            hideEmailGuide();
            document.getElementById('login-failed').style.display = 'none';
        } else {
            hideEmailEmpty(); 
        }
    });
    
    pwInput.addEventListener("input", () => {
        if (isValidPw(pwInput.value)) {
            applyValidStylePw();
            hidePwEmpty()
            document.getElementById('login-failed').style.display = 'none';
        } else {
            showPwEmpty();
            applyInvalidStylePw();
            document.getElementById('login-failed').style.display = 'none';;
        }

        if (pwInput.value === "") {
           showPwEmpty(); 
            applyInvalidStylePw();
            document.getElementById('login-failed').style.display = 'none';
        } 
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // submit 가능한지 확인하는 데 필요
     function canSubmitForm() {
        const emailInput = document.getElementById("email-input").value;
        const pwInput = document.getElementById("pw-input").value;

        const isValidEmailInput = isValidEmail(emailInput);
        const isValidPwInput = isValidPw(pwInput);

        return isValidEmailInput && isValidPwInput;
    }
    
   // 	login-btn div 눌렀을 때 submit
 	 	const loginButton = document.querySelector('.login-btn');
   	 	loginButton.addEventListener('click', function (event) {
        if (!canSubmitForm()) {
            event.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막습니다.
        } else {
            const form = document.forms.logining;
            form.submit(); // 유효성 검사 성공 시 폼을 제출합니다.
        }
    });
   
    // 로그인 실패 시 '이메일주소 또는 비밀번호가 잘못되었습니다.' 글자
    window.onload = function() {
        var queryString = window.location.search;
        if (queryString.includes("loginFailed=true")) {
            document.getElementById('login-failed').style.display = 'block';
        } 
    } 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    