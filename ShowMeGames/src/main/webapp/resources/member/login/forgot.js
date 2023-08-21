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













var doubleSubmitFlag = false;
function doubleSubmitCheck(){
      if(doubleSubmitFlag){
          return doubleSubmitFlag;
      }else{
          doubleSubmitFlag = true;
          return false;
      }
}

console.log('도착도착도착');

$('#submit-btn').click(function(e) {
    if(doubleSubmitCheck()) return;
    
    const user_id = $('#email-input').val();

    console.log("input: " + user_id);

    if (user_id.trim() !== '') {
        $.ajax({
            url : './temp_pw_send',
            type : 'POST',
            data : user_id,
            contentType : 'application/json;charset=utf-8',
            dataType : 'json',
            success : function(res) {
                if (res == 1) {
                    console.log('완료 후')
                     closeWindow();
                } else {
                    alert('가입되지 않은 이메일입니다.');
                }
            }
        });
    } else {
        alert('이메일 주소를 입력하세요.');
    }
});