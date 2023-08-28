var naverLogin = new naver.LoginWithNaverId({
  clientId: "lmZiRViUOnHbdLiKlCPj",
  callbackUrl: "http://3.39.6.147:8090/smg/member/naver_signup",
  isPopup: false,
  callbackHandle: true,
});
naverLogin.init();

window.addEventListener("load", function () {
  naverLogin.getLoginStatus(function (status) {
    if (status) {
      /* console.log(naverLogin.user); */
      var id = naverLogin.user.getId();

      var xhr = new XMLHttpRequest();

      //요청을 보낼 방식, 주소, 비동기여부 설정
      xhr.open("POST", "./naver_check", true);

      //HTTP 요청 헤더 설정
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

      //요청 전송
      xhr.send("id=" + id);

      //통신후 작업
      xhr.onload = () => {
        //통신 성공
        if (xhr.status == 200) {
          let result = xhr.response;

          if (result == "Y") {
            let answer = confirm(
              "이미 가입된 아이디입니다. 로그인하시겠습니까?"
            );
            if (answer) {
              location.href = "./loginSuccess";
            } else {
              location.href = "./login";
            }
          }
        } else {
          //통신 실패
          console.log("통신 실패");
        }
      };

      var birthday = naverLogin.user.getBirthday();
      var birthyear = naverLogin.user.getBirthyear();
      var email = naverLogin.user.getEmail();
      var name = naverLogin.user.getName();
      var mobile = naverLogin.user.getMobile();
      var gender = naverLogin.user.getGender();

      var birth = birthyear + "-" + birthday;

      $("#reg_input_id").val(email);
      $("#reg_input_name").val(name);
      $("#reg_input_phone").val(mobile);
      $("#birth_input").val(birth);

      if (gender == "M") {
        $("#genderChoice1").prop("checked", true);
      } else if (gender == "F") {
        $("#genderChoice2").prop("checked", true);
      } else {
        $("#genderChoice3").prop("checked", true);
      }

      $("#social_key").val(id);
    } else {
      console.log("callback 처리에 실패하였습니다.");
    }
  });
});
