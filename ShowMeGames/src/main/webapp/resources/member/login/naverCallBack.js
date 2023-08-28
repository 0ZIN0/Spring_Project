var naverLogin = new naver.LoginWithNaverId({
  clientId: "lmZiRViUOnHbdLiKlCPj",
  callbackUrl: "http://3.39.6.147/:8090/smg/member/naver_login",
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
            location.href = "./loginSuccess";
          }

          if (result == "N") {
            alert("회원정보가 없습니다. 회원가입 페이지로 이동합니다.");
            location.href = "./naver_signup";
          }
        } else {
          //통신 실패
          console.log("통신 실패");
        }
      };
    } else {
      console.log("callback 처리에 실패하였습니다.");
    }
  });
});
