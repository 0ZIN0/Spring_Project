
var naverLogin = new naver.LoginWithNaverId({
  clientId: "lmZiRViUOnHbdLiKlCPj", 
  callbackUrl: "http://localhost:8090/smg/member/naver_login", 
  isPopup: false,
  callbackHandle: true
});
naverLogin.init();

window.addEventListener('load', function () {
  naverLogin.getLoginStatus(function (status) {

    if (status) {
      /* console.log(naverLogin.user); */
      var id = naverLogin.user.getId();
      var email = naverLogin.user.getEmail();
      
      var xhr = new XMLHttpRequest();

      //요청을 보낼 방식, 주소, 비동기여부 설정
      xhr.open('POST', './naver_check', true);

      //HTTP 요청 헤더 설정
      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

      //요청 전송
      xhr.send("id=" + id + "&&email=" + email);

      //통신후 작업
      xhr.onload = () => {
          //통신 성공
          if (xhr.status == 200) {
              console.log(xhr.response);
              console.log("통신 성공");
          } else {
              //통신 실패
              console.log("통신 실패");
          }
      }

    } else {
      console.log("callback 처리에 실패하였습니다.");
    }

  });
});