// comment 기능
console.log("hi");
const gab = $("#game_detail_comment_div").data("gab") + "";
console.log(gab);
if (gab.includes("/")) {
  const gabStr = $("#game_detail_comment_div").data("gab").split("/");
  const statusStr = $("#game_detail_comment_div").data("status").split("/");

  let i = 0;
  gabStr.forEach(function (gab) {
    if (statusStr[i] == "G") {
      $(`.good-${gab}`).addClass("good_select");
    } else if (statusStr[i] == "B") {
      $(`.bad-${gab}`).addClass("good_select");
    }
    ++i;
  });
} else {
  const status = $("#game_detail_comment_div").data("status");
  if (status == "G") {
    $(`.good-${gab}`).addClass("good_select");
  } else if (status == "B") {
    $(`.bad-${gab}`).addClass("good_select");
  }
}

// comment btn
const upBtn = $(".up_btn");
const downBtn = $(".down_btn");

upBtn.click(function (e) {
  const targetDiv = $(e.target);
  const comment_id = $(e.target).data("id");
  $.ajax({
    url: `./comment-good`,
    type: "PUT",
    data: JSON.stringify(comment_id),
    contentType: "application/json;charset=utf-8",
    dataType: "json",
    success: function (res) {
      console.log(res);
      if (res[0] == 1) {
        console.log("1번도착");
        $(`.good-${comment_id}`).addClass("good_select");
        $(`.g-${comment_id}`).text(res[1]);
      } else if (res[0] == 2) {
        console.log("2번도착");
        $(`.good-${comment_id}`).removeClass("good_select");
        $(`.g-${comment_id}`).text(res[1]);
      } else if (res[0] == 3) {
        console.log("3번도착");
        alert("'싫어요'한 리뷰입니다.\n취소 후 수정해주세요.");
      } else {
        console.log("0번도착");
        openLoginPopup();
      }
    },
  });
});

downBtn.click(function (e) {
  const targetDiv = $(e.target);
  const comment_id = $(e.target).data("id");
  $.ajax({
    url: `./comment-bad`,
    type: "PUT",
    data: JSON.stringify(comment_id),
    contentType: "application/json;charset=utf-8",
    dataType: "json",
    success: function (res) {
      if (res[0] == 1) {
        $(`.bad-${comment_id}`).addClass("good_select");
        $(`.b-${comment_id}`).text(res[1]);
      } else if (res[0] == 2) {
        $(`.bad-${comment_id}`).removeClass("good_select");
        $(`.b-${comment_id}`).text(res[1]);
      } else if (res[0] == 3) {
        alert("'좋아요'한 리뷰입니다.\n취소 후 수정해주세요.");
      } else {
        openLoginPopup();
      }
    },
  });
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
const currUrl = new URL(location.search);
const game = currUrl.get("game");

// infinity scroll
const options = {
  // null을 설정하거나 무엇도 설정하지 않으면 브라우저 viewport가 기준이 된다.
  root: null,
  // 타겟 요소의 10%가 루트 요소와 겹치면 콜백을 실행한다.
  threshold: 0.1,
};
let index = 2;
const comment_grid = $("#comment_grid");
let observer = new IntersectionObserver(function (entries, observer) {
  entries.forEach((entry) => {
    // 타겟 요소와 루트 요소가 교차하면
    if (entry.isIntersecting) {
      $.ajax({
        url: `./detail/review_all_ajax?game=${game}&page=${index}`,
        type: "GET",
        dataType: "json", // 받는 데이터의 타입
        success: (comments, state, xhttp) => {
          console.log("success");
          comments.forEach(function (comment) {
            comment_grid.append(createCommentDiv(comment)); // body나 다른 요소에 추가
          });
          // AJAX 호출이 성공적으로 끝난 후에 index를 증가시킵니다.
          index++;
        },
        error: function (xhr, status, error) {
          console.error("AJAX 오류:", status, error);
        },
      });
    }
  });
}, options);

// list의 끝부분을 알려주는 p 타겟 요소를 관찰
observer.observe(document.querySelector("footer"));

function createCommentDiv(comment) {
  // 프로필 이미지
  var profileImg = $("<img>")
    .addClass("comment_user_profile")
    .attr("alt", "유저의 프로필")
    .attr("src", "/smg" + comment.profile_url);

  // 등급 이미지 설정
  var gradeImgSrc;
  switch (comment.user_grade) {
    case "S":
      gradeImgSrc = comment.member_img + "/grade/diamond_icon.png";
      break;
    case "A":
      gradeImgSrc = comment.member_img + "/grade/platinum_icon.png";
      break;
    case "B":
      gradeImgSrc = comment.member_img + "/grade/gold_icon.png";
      break;
    case "C":
      gradeImgSrc = comment.member_img + "/grade/silver_icon.png";
      break;
    case "D":
    default:
      gradeImgSrc = comment.member_img + "/grade/bronze_icon.png";
      break;
  }
  var gradeImg = $("<img>")
    .addClass("comment-grade-image")
    .attr("src", gradeImgSrc);

  // Nickname과 날짜
  var nickName = $("<div>")
    .addClass("comment_user_nick")
    .text(comment.nick_name);
  var writeDate = $("<div>")
    .addClass("comment_write_date")
    .text(
      "게시 일시: " + new Date(comment.write_date).toLocaleDateString("ko-KR")
    );

  // Comment 내용
  var commentContent = $("<div>")
    .addClass("comment_content")
    .text(comment.comment_content);

  // Up & Down buttons
  var upBtn = $("<span>")
    .attr("id", "thumb_up")
    .addClass("material-symbols-outlined up_down_btn")
    .text("thumb_up");
  var downBtn = $("<span>")
    .attr("id", "thumb_down")
    .addClass("material-symbols-outlined up_down_btn")
    .text("thumb_down");

  // 댓글 DIV 생성 및 요소 추가
  var commentDiv = $("<div>").addClass("comment_div");
  commentDiv
    .append(
      $("<div>").addClass("comment_div_left").append(profileImg, nickName)
    )
    .append(
      $("<div>").addClass("comment_div_right").append(writeDate, commentContent)
    )
    .append($("<div>").addClass("up_down_div").append(upBtn, downBtn));

  return commentDiv;
}
