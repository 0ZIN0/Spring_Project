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
$(document).ready(function () {
  // header-cart에 마우스를 올렸을 때
  $("#header-cart").mouseenter(function () {
    $("header-cart").addClass("minicart-position");
    $("#minicart").addClass("minicart-active");
  });

  // minicart 영역을 벗어났을 때
  $("#minicart").mouseleave(function () {
    $("header-cart").removeClass("minicart-position");
    $("#minicart").removeClass("minicart-active");
  });
});
