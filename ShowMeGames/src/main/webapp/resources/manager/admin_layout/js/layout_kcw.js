// preview 관련 기능
$("#input_warn_content").change(function () {
  let text = $(this).val();
  $("#warn_content").text(text);
});

$("#input_game_main_title").change(function () {
  let text = $(this).val();
  $("#game_main_title").text(text);
});

$("#input_game_main_text").change(function () {
  let text = $(this).val();
  $("#game_main_text").text(text);
});

$("#input_game_sub_title").change(function () {
  let text = $(this).val();
  $("#game_sub_title").text(text);
});

$("#input_game_sub_text").change(function () {
  let text = $(this).val();
  $("#game_sub_text").text(text);
});

$("#input_game_story_title").change(function () {
  let text = $(this).val();
  $("#game_story_title").text(text);
});

$("#input_game_story_text").change(function () {
  let text = $(this).val();
  $("#game_story_text").text(text);
});

// 사진 미리보기 기능
function img_preview(input, target) {
  let file = $(input)[0].files[0];

  if (isImageFile(file)) {
    let reader = new FileReader();

    reader.onload = function (e) {
      $(target).show();
      $(target).attr("src", e.target.result);
    };

    reader.readAsDataURL(file);
  } else {
    $(input).val("");
    alert("파일 확장자를 확인해주세요");
    return;
  }
}

// 이미지 확장자 검사
function isImageFile(file) {
  let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
  return $.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1 ? false : true;
}

function imgLenCheck(divStr, imgStr) {
  let img_url = $(divStr).data("img");
  if (img_url.length > 1) {
    $(imgStr).show();
  }
}

// 사진 적용
$("#input_game_img_1").on("change", function () {
  img_preview(this, "#game_img_1");
});
$("#input_game_img_2").on("change", function () {
  img_preview(this, "#game_img_2");
});
$("#input_game_img_3").on("change", function () {
  img_preview(this, "#game_img_3");
});
$("#input_game_img_4").on("change", function () {
  img_preview(this, "#game_img_4");
});
$("#input_game_img_5").on("change", function () {
  img_preview(this, "#game_img_5");
});

$(document).ready(function () {
  imgLenCheck("#game_img_div_1", "#game_img_1");
  imgLenCheck("#game_img_div_2", "#game_img_2");
  imgLenCheck("#game_img_div_3", "#game_img_3");
  imgLenCheck("#game_img_div_4", "#game_img_4");
  imgLenCheck("#game_img_div_5", "#game_img_5");
});
