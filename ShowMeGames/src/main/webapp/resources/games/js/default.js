$('#checkoutBtn').click(function (e) {
    const user = $('#game_detail_btn_div').data('session');
    const user_num = $('#game_detail_btn_div').data('user');
    const cart = $('#game_detail_btn_div').data('cart');
    if (user != "") {
        var result = {
            "user_num" : user_num,
            "cart_content" : cart
        }

        $.ajax({
            url : './add-cart',
			type : 'PUT',
            data : JSON.stringify(result, ['user_num', 'cart_content']),
            contentType : 'application/json;charset=utf-8',
            dataType : 'json',
            success : function(res) {
                if (res == 1) {
                    location.href = "./cart";
                } else {
                    console.log("Insert Fail!!!");
                }
            }
        });
    } else {
        openLoginPopup();
    }
});

var loginPopup = null; // 전역 변수로 팝업 창을 저장하는 변수 선언

function openLoginPopup() {
  if (loginPopup && !loginPopup.closed) {
    // 이미 팝업이 열려있으면 해당 팝업에 포커스를 줌
    loginPopup.focus();
  } else {
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;
    var popupWidth = 480;
    var popupHeight = 800;

    var left = (screenWidth - popupWidth) / 2;
    var top = (screenHeight - popupHeight) / 2;

    var popupFeatures =
      "width=" +
      popupWidth +
      ",height=" +
      popupHeight +
      ",left=" +
      left +
      ",top=" +
      top;

    // 새로운 팝업을 열고, loginPopup 변수에 할당하여 저장
    loginPopup = window.open("/smg/member/login", "_blank", popupFeatures);
  }
}