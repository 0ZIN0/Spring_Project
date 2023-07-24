
var naverLogin = new naver.LoginWithNaverId({
  clientId: "lmZiRViUOnHbdLiKlCPj", // 본인걸로 수정, 띄어쓰기 금지.
  callbackUrl: "http://localhost:8090/smg/member/naver_signup", // 아무거나 설정
  isPopup: false,
  callbackHandle: true
});
naverLogin.init();

const input_id = $('#reg_input_id');

window.addEventListener('load', function () {
  naverLogin.getLoginStatus(function (status) {

    if (status) {
      /* console.log(naverLogin.user); */
      var birthday = naverLogin.user.getBirthday();
      var birthyear = naverLogin.user.getBirthyear();
      var email = naverLogin.user.getEmail();
      var name = naverLogin.user.getName();
      var mobile = naverLogin.user.getMobile();

      var birth = birthyear + '-' + birthday;

      $('#reg_input_id').val(email);
      $('#reg_input_name').val(name);
      $('#reg_input_phone').val(mobile);
      $('#birth_input').val(birth);

    } else {
      console.log("callback 처리에 실패하였습니다.");
    }

  });
});