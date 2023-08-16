// 현재 접속중인 페이지에 따라 다른 CSS 적용
const currentPath = window.location.pathname;

if (currentPath === "/smg/") {
  $("#game-btn-underline").css("backgroundColor", "white");

  $("#notices-btn").on("mouseover", () => {
    $("#notices-btn-underline").css("backgroundColor", "white");
    $("#notices-btn-underline").css("transition", "background-color 0.3s ease");
  });

  $("#notices-btn").on("mouseout", () => {
    $("#notices-btn-underline").css("backgroundColor", "");
    $("#notices-btn-underline").css("transition", "background-color 0.4s ease");
  });

  $("#customer-btn").on("mouseover", () => {
    $("#customer-btn-underline").css("backgroundColor", "white");
    $("#customer-btn-underline").css(
      "transition",
      "background-color 0.3s ease"
    );
  });

  $("#customer-btn").on("mouseout", () => {
    $("#customer-btn-underline").css("backgroundColor", "");
    $("#customer-btn-underline").css(
      "transition",
      "background-color 0.4s ease"
    );
  });
} else if (currentPath === "/smg/customer/notice") {
  $("#notices-btn-underline").css("backgroundColor", "white");

  $("#game-btn").on("mouseover", () => {
    $("#game-btn-underline").css("backgroundColor", "white");
    $("#game-btn-underline").css("transition", "background-color 0.3s ease");
  });

  $("#game-btn").on("mouseout", () => {
    $("#game-btn-underline").css("backgroundColor", "");
    $("#game-btn-underline").css("transition", "background-color 0.4s ease");
  });

  $("#customer-btn").on("mouseover", () => {
    $("#customer-btn-underline").css("backgroundColor", "white");
    $("#customer-btn-underline").css(
      "transition",
      "background-color 0.3s ease"
    );
  });

  $("#customer-btn").on("mouseout", () => {
    $("#customer-btn-underline").css("backgroundColor", "");
    $("#customer-btn-underline").css(
      "transition",
      "background-color 0.4s ease"
    );
  });
} else if (currentPath === "/smg/customer/faq") {
  $("#customer-btn-underline").css("backgroundColor", "white");

  $("#game-btn").on("mouseover", () => {
    $("#game-btn-underline").css("backgroundColor", "white");
    $("#game-btn-underline").css("transition", "background-color 0.3s ease");
  });

  $("#game-btn").on("mouseout", () => {
    $("#game-btn-underline").css("backgroundColor", "");
    $("#game-btn-underline").css("transition", "background-color 0.4s ease");
  });

  $("#notices-btn").on("mouseover", () => {
    $("#notices-btn-underline").css("backgroundColor", "white");
    $("#notices-btn-underline").css("transition", "background-color 0.3s ease");
  });

  $("#notices-btn").on("mouseout", () => {
    $("#notices-btn-underline").css("backgroundColor", "");
    $("#notices-btn-underline").css("transition", "background-color 0.4s ease");
  });
}

// 로그인 호버기능
function changeIconColor(iconId, color) {
  var icon = document.getElementById(iconId);
  icon.style.color = color;
}

// header-bottom list css active
function openOthers(list) {
  var tablinks = $(".sub-ul");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" list-active", "");
  }
  list.addClass("list-active");
  list.css({ display: "grid" });
}

// arrow spin active css
function spinActive(arrow) {
  var tablinks = $(".expand_more");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(
      " expand_more-active",
      ""
    );
  }
  arrow.addClass("expand_more-active");
}

// header-bottom title css active
function clickChangeColor(btn, list, arrow) {
  if (btn.hasClass("title-active")) {
    btn.className = btn.removeClass("title-active");
    var tablinks = $(".expand_more");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(
        " expand_more-active",
        ""
      );
    }
    return;
  } else {
    var tablinks = $(".header-bottom-btn");
    console.log(tablinks);
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(
        " title-active",
        ""
      );
    }
    btn.addClass("title-active");
    openOthers(list);
    spinActive(arrow);
  }
}

// header-bottom 버튼 기능 구현
$("#category").on("click", (e) => {
  e.preventDefault();
  var category = $("#category-li");
  var categoryBtn = $("#category");
  var categoryArrow = $("#category-arrow");

  $("#category-li").toggle();
  $("#genre-li").hide();
  $("#editor-pink-li").hide();

  clickChangeColor(categoryBtn, category, categoryArrow);
});

$("#header-genre").on("click", (e) => {
  e.preventDefault();
  var genre = $("#genre-li");
  var genreBtn = $("#header-genre");
  var genreArrow = $("#genre-arrow");

  $("#category-li").hide();
  $("#genre-li").toggle();
  $("#editor-pink-li").hide();

  clickChangeColor(genreBtn, genre, genreArrow);
});

$("#editor").on("click", (e) => {
  e.preventDefault();
  var editor = $("#editor-pink-li");
  var editorBtn = $("#editor");
  var editorArrow = $("#editor-arrow");

  $("#category-li").hide();
  $("#genre-li").hide();
  $("#editor-pink-li").toggle();

  clickChangeColor(editorBtn, editor, editorArrow);
});

$("html").click(function (e) {
  if (
    $(e.target).hasClass("sub-ul") ||
    $(e.target).hasClass("title-div") ||
    $(e.target).hasClass("bottom-btns") ||
    $(e.target).hasClass("material-symbols-outlined")
  ) {
    return;
  } else {
    $("#category-li").hide();
    $("#genre-li").hide();
    $("#editor-pink-li").hide();

    var tablinks = $(".header-bottom-btn");
    var tablinks2 = $(".sub-ul");
    var tablinks3 = $(".expand_more");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(
        " title-active",
        ""
      );
      tablinks2[i].className = tablinks2[i].className.replace(" active", "");
      tablinks3[i].className = tablinks3[i].className.replace(
        " expand_more-active",
        ""
      );
    }
  }
});

// header scroll 기능 구현
$(window).scroll(function () {
  if ($(document).scrollTop() >= 200) {
    $("#header-top").css({ height: "1px", transition: "0.3s" });
    $("#header-bottom").css({ top: "0", transition: "0.3s" });
  } else {
    $("#header-top").css({ height: "54px", transition: "0.3s" });
    $("#header-bottom").css({ top: "54px", transition: "0.3s" });
  }
});

let lastScroll = 0;
$(window).on("scroll", function () {
  let scrollTop = $(this).scrollTop();

  if (scrollTop <= 200) {
    return;
  }

  var logo = $("#header-bottom-logo");
  var headerBottom = $("#header-bottom");
  if (scrollTop > lastScroll) {
    //down
    $("#header-top").css({ height: "1px", transition: "0.3s" });
    $("#header-bottom").css({ top: "0", transition: "0.3s" });
    logo.css("display", "block");
    headerBottom.addClass("header-bottom-drop");
    headerBottom.removeClass("header-bottom-up");
  } else {
    // up
    $("#header-top").css({ height: "54px", transition: "0.3s" });
    $("#header-bottom").css({ top: "54px", transition: "0.3s" });
    logo.css("display", "none");
    headerBottom.addClass("header-bottom-up");
    headerBottom.removeClass("header-bottom-drop");
  }
  lastScroll = scrollTop;
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

// #login-icon2의 원래 색상 정의
const loginIconOriginalColor = "#a1a1a1";

// 드랍다운 토글 함수
function toggleDropdown() {
  var dropdownContent = document.getElementById("dropdown-content");
  var loginIcon = document.getElementById("login-icon2");
  if (dropdownContent.style.display === "none") {
    dropdownContent.style.display = "block";
    loginIcon.style.transition = "color 0.5s ease"; // 드랍다운이 열릴 때 0.5초로 트랜지션 적용
    loginIcon.style.color = "white"; // 색상을 흰색으로 변경
    // 장바구니 창 닫기
    $("header-cart").removeClass("minicart-position");
    $("#minicart").removeClass("minicart-active");
  } else {
    dropdownContent.style.display = "none";
    loginIcon.style.transition = ""; // 드랍다운이 닫힐 때 트랜지션 제거
    loginIcon.style.color = loginIconOriginalColor; // 원래 색상으로 변경
  }
}

$(document).ready(function () {
  // 페이지가 로드될 때 login2 버튼을 자동으로 클릭(최초 두번눌러야하는 버그...)
  $("#login-icon2").trigger("click");
});

// 로그인 아이콘 클릭 시 드랍다운 열기 또는 닫기
$("#login-icon2").on("click", function (event) {
  event.stopPropagation(); // 이벤트 버블링을 막음
  toggleDropdown();
});
// document.getElementById("login-icon2").addEventListener("click", function(event) {
//   event.stopPropagation(); // 이벤트 버블링을 막음
//   toggleDropdown();
// });

// 다른 곳을 클릭하면 드랍다운 닫기
$(document).on("click", function (event) {
  var dropdownContent = $("#dropdown-content");
  var loginIcon = $("#login-icon2");
  if (!$(event.target).is(loginIcon)) {
    dropdownContent.hide();
    loginIcon.css("transition", ""); // 드랍다운이 닫힐 때 트랜지션 제거
    loginIcon.css("color", loginIconOriginalColor); // 원래 색상으로 변경
  }
});

// 스크롤 시 드랍다운 닫기
$(window).scroll(function () {
  var dropdownContent = document.getElementById("dropdown-content");
  var loginIcon = document.getElementById("login-icon2");
  if (dropdownContent.style.display === "block") {
    dropdownContent.style.display = "none";
    loginIcon.style.transition = ""; // 드랍다운이 닫힐 때 트랜지션 제거
    loginIcon.style.color = loginIconOriginalColor; // 원래 색상으로 변경
  }
});

$(window).scroll(function () {
  $("#header-top").css("left", 0 - $(this).scrollLeft());
  $("#header-bottom").css("left", 0 - $(this).scrollLeft());
});

// minicart Mouse Event
$('#header-cart').mouseenter(function () {
  $('#header-bottom').addClass('minicart-position');
  $('#minicart').addClass('minicart-active');
})
$('#header-cart').mouseleave(function () {
  $('#header-bottom').removeClass('minicart-position');
  $('#minicart').removeClass('minicart-active');
})

$('#minicart').mouseenter(function () {
  $('#minicart').addClass('minicart-active');
})
$('#minicart').mouseleave(function () {
  $('#header-bottom').removeClass('minicart-position');
  $('#minicart').removeClass('minicart-active');
})

// minicart 내용 업데이트
function updateMiniCart() {
  $.ajax({
    url: "./minicart",
    type: "GET",
    dataType: "json",

    success: function (data) {
      console.log("성공");
      console.log(data);
      var cartList = data.cart_list;
      var cartLen = data.cart_len;
      var totalPrice = data.total_price;
      console.log(cartList);
      console.log(cartLen);
      console.log(totalPrice);

      var minicartContent = $("#minicart-content");
      var minicartEmptyContent = $(".empty-minicart-content");

      // 미니카트 내용을 초기화하고 다시 추가
      minicartContent.empty();

      // 로그인 상태에 따라 보여줄 내용 결정
      if (cartList != null && cartLen > 0) {
        // 로그인 상태이고 장바구니에 내용이 있다면 put-minicart-content 내용을 보여주기
        var putMinicartContent = `
        <div id="put-minicart-content">
          <!-- 각 상품 정보에 대한 리스트 생성 -->
          <div id="minicart-list-top">
          ${cartList.map((game) => {
          return `
            <div class="minicart-game-list">
              <div class="minicart-list-left">
                <img src="${game.banner_img_url}" alt="">
              </div>
              <!--minicart-list-left Part End -->
              <div class="minicart-list-right">
                <div class="minicart-list-details">
                  <div class="minicart-game-name">${game.game_name}</div>
                  <div class="pricing">
                    ${(game.discount !== null && game.discount > 0)
              ?
              `<div id="sales-price">
                          <div class="price-percentage-wrapper">
                            <div class="price-percentage">-${game.discount}%</div>
                          </div>
                          <div class="price-wrapper">
                            <div class="discount-price">₩ ${new Intl.NumberFormat('ko-KR').format(game.discounted_price)}</div>
                            <div class="sales-product-price">₩ ${new Intl.NumberFormat('ko-KR').format(game.game_price)}</div>
                          </div> 
                        </div> <!-- sales-price Part End -->`
              :
              `<div id="standard-price">
                          <div class="product-price">${game.game_price > 0 ? '₩ ' + new Intl.NumberFormat('ko-KR').format(game.game_price) : "무료"}</div>
                        </div> 
                      <!-- 할인 없는 게임의 기본 가격-->`
            }  
                  </div> 
                  <!-- pricing Part End -->
                </div>
                <!--micart-list-details Part End-->
              </div>
                <!--minicart-list-right Part End -->

              <div class="minicart-list-delete">
                <div id="minicart-delete" class="cart-delete" data-gameid="${game.game_id}">
                  <span class="material-symbols-outlined" data-gameid="${game.game_id}">delete</span>
                </div>  
              </div>
              <!--minicart-list-delete Part End -->
            </div>
            <!-- minicart-game-list End -->
            `;
        }).join("")}
          </div>
          <!--minicart-list-top Part End -->   

        <div id="minicart-list-bottom">
        <!-- minicart Sub Total -->
          <div class="minicart-sub-total" id="total-order">
              <div class="sub-left">
                <span class="sub-total-title">total price : </span>
              </div>
              <div class="sub-right">
                <span class="sub-total-price">${totalPrice > 0 ? '₩ ' + new Intl.NumberFormat('ko-KR').format(totalPrice) : "무료"}</span>
                <span class="sub-total-notice">※ 부가세 포함</span>
              </div>
          </div>
          <div id="minicart-list-btns">
            <div id="move-to-cart-btn" class="SMN_effect-76 button-wrapper">
                <span class="minicart-btn-text">장바구니 보기</span>
            </div>
            <div id="minicart-checkout-btn" class="SMN_effect-77 button-wrapper">
                <span class="minicart-btn-text">결제하기</span>
            </div>
          </div>
          <!-- minicart-list-btns Part End -->
        </div>
        <!-- minicart-list-bottom Part End -->
  </div>
  <!--put-minicart-content Part End --> `;

        minicartContent.append(putMinicartContent);
        $("#put-minicart-content").show();
        $(".empty-minicart-content").hide();

      } else {
        // 로그인 상태이지만 장바구니가 비어있거나 로그인하지 않은 경우 empty-minicart-content 내용을 보여주기
        // else if => 
        minicartContent.append(`<div class="empty-minicart-content minicart-common">
        <div class="empty-minicart-message minicart-common">장바구니가
          비어있습니다.</div>
        <div class="empty-minicart-image minicart-common">
          <img alt="Empty Minicart" src="resources/img/cart/SMG_EmptyMarket_img.jpg">
        </div>
      </div>`);
        console.log("EmptyCart Success");
      }
    },
    error: function (xhr, status, error) {
      console.error("AJAX 오류:", status, error);
    },
  });
}

// cart-list delete
$(document).on("click", "#minicart-delete", function (e) {
  $.ajax({
    url: `./cart-delete?game_id=${e.target.dataset.gameid}`,
    type: "GET",
    success: () => {
      updateMiniCart();
    },
    error: () => {
      console.log("MiniCart List Delete Error");
    }
  })
});

// Move to Cart Button
$(document).on("click", "#move-to-cart-btn", function () {
  $.ajax({
    url: "./cart",
    type: "GET",
    success: () => {
      console.log("Move to Cart Success");
      location.href = "./cart";
    },
    error: () => {
      console.log("Move to Cart Btn Error");
    }
  })
});

// Minicart checkout Button
$(document).on("click", "#minicart-checkout-btn", function () {
  $.ajax({
    url: "./cart",
    type: "GET",
    success: () => {
      console.log("Checkout Success");
      location.href = "./cart";
    },
    error: () => {
      console.log("Minicart Chk Btn Error");
    }
  })
});

$(document).ready(function () {
  // 페이지가 로드될 때 updateMiniCart() 실행
  updateMiniCart();

});

