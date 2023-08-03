// 이메일주소/비밀번호 입력 관련 CSS
const emailInput = document.getElementById("email-input");
const emailLabel = document.getElementById("email-label");
const emailEmpty = document.getElementById("email-empty"); 

// 입력칸 글자의 크기/위치 변화
function applySmallStyle() {
    emailLabel.classList.add("small");
    emailLabel.classList.remove("big");
}

function applyBigStyle() {
    emailLabel.classList.add("big");
    emailLabel.classList.remove("small");
}


// 입력칸 아래 밑줄 변화
function applyValidStyle() {
    emailInput.style.borderBottom = "2px solid #80bc00";
}

function applyInvalidStyle() {
    emailInput.style.borderBottom = "2px solid #CC0011";
}


// 입력칸 아래 '입력필요' 글자
function showEmailEmpty() {
    emailEmpty.style.display = "block"; 
}

function hideEmailEmpty() {
    emailEmpty.style.display = "none"; 
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
    } else {
        hideEmailEmpty(); 
    }
});



// 이메일 형식이 유효한지 판별
function isValidEmail(email) {
    const emailRegex = /^[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+@[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+\.[^\s@ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
    return emailRegex.test(email);
}


// 입력값이 유효한지에 따른 변화
emailInput.addEventListener("input", () => {
    if (emailInput.value === "") {
        showEmailEmpty(); 
        hideEmailGuide();
        applyInvalidStyle();
    } else {
        hideEmailEmpty();
        if (isValidEmail(emailInput.value)) {
            applyValidStyle();
            hideEmailGuide();
        } else {
            applyInvalidStyle();
            showEmailGuide();
        }
    }
});




function closeWindow() {
    window.close(); // 현재 창을 닫음
  }

















// Firebase 설정 객체
        var firebaseConfig = {
        		  apiKey: "AIzaSyA40rDPXNm993eKTGoYqPISBToH2Txyc3Q",
        		  authDomain: "forgotpw-d6b61.firebaseapp.com",
        		  projectId: "forgotpw-d6b61",
        		  storageBucket: "forgotpw-d6b61.appspot.com",
        		  messagingSenderId: "80515834348",
        		  appId: "1:80515834348:web:7a0e69a8453e91e8c1e0c9",
        		  measurementId: "G-YWJMHLGCNN"
        };
        // Firebase 초기화
        firebase.initializeApp(firebaseConfig);

        // 여기서부터 비밀번호 재설정 로직
        var resetPasswordForm = document.getElementById('resetPasswordForm');
        resetPasswordForm.addEventListener('submit', function(event) {
            event.preventDefault();
            var email = document.getElementById('email-input').value;
            
            // Firebase에서 해당 이메일 주소에 대한 계정 정보를 가져옵니다.
            firebase.auth().fetchSignInMethodsForEmail(email)
            .then(function(signInMethods) {
                if (signInMethods.length === 0) {
                    // 계정이 없는 경우 새로 생성하고, 비밀번호 재설정 이메일 보내기
                    firebase.auth().createUserWithEmailAndPassword(email, "temporaryPassword")
                    .then(function() {
                        // 비밀번호 재설정 이메일 보내기
                        firebase.auth().sendPasswordResetEmail(email)
                            .then(function() {
                            	
                                alert('비밀번호 재설정 이메일이 전송되었습니다!');
                            })
                            .catch(function(error) {
                                var errorMessage = error.message;
                                alert('비밀번호 재설정 이메일 보내기 오류: ' + errorMessage);
                            });
                    })
                    .catch(function(error) {
                        var errorCode = error.code;
                        var errorMessage = error.message;
                        alert('사용자 계정 생성 오류: ' + errorMessage);
                    });
                } else {
                    // 이미 계정이 있는 경우 비밀번호 재설정 이메일 보내기
                    firebase.auth().sendPasswordResetEmail(email)
                        .then(function() {
                            alert('비밀번호 재설정 이메일이 전송되었습니다!');
                        })
                        .catch(function(error) {
                            var errorMessage = error.message;
                            alert('비밀번호 재설정 이메일 보내기 오류: ' + errorMessage);
                        });
                }
            })
            .catch(function(error) {
                var errorCode = error.code;
                var errorMessage = error.message;
                alert('사용자 계정 조회 오류: ' + errorMessage);
            });
        });



