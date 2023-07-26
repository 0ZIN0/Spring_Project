
var naverLogin = new naver.LoginWithNaverId({
  clientId: "lmZiRViUOnHbdLiKlCPj", 
  callbackUrl: "http://localhost:8090/smg/member/naver_signup", 
  isPopup: false,
  callbackHandle: true
});
naverLogin.init();

window.addEventListener('load', function () {
  naverLogin.getLoginStatus(function (status) {

    if (status) {
      /* console.log(naverLogin.user); */
      var birthday = naverLogin.user.getBirthday();
      var birthyear = naverLogin.user.getBirthyear();
      var email = naverLogin.user.getEmail();
      var name = naverLogin.user.getName();
      var mobile = naverLogin.user.getMobile();
      var gender = naverLogin.user.getGender();
      var id = naverLogin.user.getId();

      var birth = birthyear + '-' + birthday;

      $('#reg_input_id').val(email);
      $('#reg_input_name').val(name);
      $('#reg_input_phone').val(mobile);
      $('#birth_input').val(birth);

      if(gender == 'M') {
        $('#genderChoice1').prop('checked', true);
      } else if(gender == "F") {
        $('#genderChoice2').prop('checked', true);
      } else {
        $('#genderChoice3').prop('checked', true);
      }

      $('#social_key').val(id);

    } else {
      console.log("callback 처리에 실패하였습니다.");
    }

  });
});