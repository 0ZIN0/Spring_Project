
var naverLogin = new naver.LoginWithNaverId(
    {
        clientId: "lmZiRViUOnHbdLiKlCPj",
        // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
        callbackUrl: "http://localhost:8090/smg/member/naver_signup",
        // 본인의 callBack url로 수정하세요.
        isPopup: false,
        loginButton: {color: "green", type: 3, height: 30}
        // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
    }
);
naverLogin.init();

$(document).on("click", "#replaceNaverBtn", function(){
    var naverLogin = document.getElementById("naverIdLogin").firstChild;
    naverLogin.click();
});

