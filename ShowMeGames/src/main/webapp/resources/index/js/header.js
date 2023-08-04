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

function toggleDropdown() {
  var dropdownContent = document.getElementById("dropdown-content");
  if (dropdownContent.style.display === "none") {
    dropdownContent.style.display = "block";
  } else {
    dropdownContent.style.display = "none";
  }
}

// 로그인 아이콘 클릭 시 드랍다운 열기
$('#login-icon2').click(toggleDropdown);

// 다른 곳을 클릭하면 드랍다운 닫기
document.addEventListener("click", function (event) {
  var dropdownContent = document.getElementById("dropdown-content");
  var loginIcon = document.getElementById("login-icon2");
  if (event.target !== loginIcon) {
    dropdownContent.style.display = "none";
  }
});

// minicart Mouse Event
$('#header-cart').on({
    mouseenter: function() {
      $('#header-bottom').addClass('minicart-position');
      $('#minicart').addClass('minicart-active');
      updateMiniCart();
    },
    mouseleave: function() {
      $('#header-bottom').removeClass('minicart-position');
      $('#minicart').removeClass('minicart-active');
    }
});

$('#minicart').on({
  mouseenter: function() {
    $('#minicart').addClass('minicart-active');
  },
  mouseleave: function() {
    $('#header-bottom').removeClass('minicart-position');
    $('#minicart').removeClass('minicart-active');
  }
});


// minicart 내용 업데이트
function updateMiniCart() {
  $.ajax({
    url: "./minicart",
    type: "GET",
    dataType: "json",
    
    success: function (data) {
      console.log("성공")
      var cartList = data.cart_list;
      var cartLen = data.cart_len;
      var totalPrice = data.total_price;
      
      var minicartContent = $("#minicart-content");

      // 로그인 상태에 따라 보여줄 내용 결정
      if (cartList != null && cartLen > 0) {
        // 로그인 상태이고 장바구니에 내용이 있다면 put-minicart-content 내용을 보여주기
        var putMinicartContent = `
        <div class="put-minicart-content">
          <!-- 각 상품 정보에 대한 리스트 생성 -->
          ${cartList.map((game) => {
            `<div class="minicart-list-top">
              <div class="minicart-list-left">
                <img src="${game.banner_img_url}" alt="">
              </div>
              <!--minicart-list-left Part End -->
              <div class="minicart-list-right">
                <div class="minicart-game-name">${game.game_name}</div>
                <div class="minicart-game-price">${ game.discounted_price}</div>
                <div class="minicart-list-delete">
                  <a class="cart-delete" data-gameid="${game.game_id}">
                    <span class="material-symbols-outlined" data-gameid="${game.game_id}">delete</span>
                    <div data-gameid="${game.game_id}">제거</div>
                  </a>
                </div>
                <!--minicart-list-delete Part End -->
              </div>
              <!--minicart-list-right Part End -->
            </div>`
          }).join("")}
            <!--minicart-list-top Part End -->
          
          <div class="minicart-list-bottom">
            <div class="price" id="total-order">
              합계 : ₩ ${totalPrice > 0 ? new Intl.NumberFormat('en').format(totalPrice) : "무료"}
            </div>
            <div class="minicart-list-btns">
              <div class="put-minicart-btn">
                장바구니 보기
              </div>
              <div class="put-minicart-btn">
                결제하기
              </div>
            </div>
            <!-- minicart-list-btns Part End -->
          </div>
          <!-- minicart-list-bottom Part End -->
        </div>
        <!--put-minicart-content Part End -->`;
        
        minicartContent.append(putMinicartContent);
        $(".put-minicart-content").show(); 
        $(".empty-minicart-content").hide();
        
      } else {
        // 로그인 상태이지만 장바구니가 비어있거나 로그인하지 않은 경우 empty-minicart-content 내용을 보여주기
        $(".put-minicart-content").hide(); 
        $(".empty-minicart-content").show(); 
      }
    },
    error: function(xhr, status, error) {
      console.error("AJAX 오류:", status, error);
    },
  });
}

// cart-list delete
$('.cart-delete').click(function (e) {
  $.ajax({
      url: `./cart-delete?game_id=${e.target.dataset.gameid}`,
      method: 'GET',
      success: () => {
          location.href = "./cart";
      }
  })
});
