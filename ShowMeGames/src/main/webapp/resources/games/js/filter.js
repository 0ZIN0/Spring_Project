/*sort_selector*/
const label = $(".label");
const options = $(".option_item");
const text = $(".label_text");
const arrow = $(".arrow");
var sortBy = 3;

// add filter-container
const handleSelect = (item) => {
  label.parent().removeClass("active");
  var itemText = $(item).text();
  text.text(itemText);
  sessionStorage.setItem("sortBy", JSON.stringify(itemText));
};

// click options
options.on("click", function (e) {
  var el = $(this);
  $("label .arrow").removeClass("reverse");
  handleSelect(el);
  sortBy = $(el).val();
  getSearchList();
});

// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.on("click", () => {
  if (label.parent().hasClass("active")) {
    label.parent().removeClass("active");
    label.find(".arrow").removeClass("reverse");
  } else {
    label.parent().addClass("active");
    label.find(".arrow").addClass("reverse");
  }
});

// arrow reverse
label.on("blur", function (e) {
  $(this).parent().removeClass("active"); // 라벨(label) 요소의 부모에서 'active' 클래스를 제거합니다.
  $(this).find(".arrow").removeClass("reverse"); // 라벨(label) 요소 내부에서 .arrow 클래스를 가진 요소의 'reverse' 클래스를 제거합니다.
});

const genreList = [];
const editorList = [];

/*initialize filter*/
$(document).ready(function () {
  // Local Storage에서 상태 가져오기
  var savedGenreList = JSON.parse(sessionStorage.getItem("genreList")) || [];
  var savedEditorList = JSON.parse(sessionStorage.getItem("editorList")) || [];
  var savedSortBy = JSON.parse(sessionStorage.getItem("sortBy"));
  // 정렬 보기의 텍스트를 저장된 텍스트로 수정
  if (savedSortBy == null) {
    text.text("정렬보기");
  } else {
    text.text(savedSortBy);
  }

  // list에 저장된 list 추가
  Array.prototype.push.apply(genreList, savedGenreList);
  Array.prototype.push.apply(editorList, savedEditorList);
  // 상태에 따라 체크박스 설정
  savedGenreList.forEach(function (genre) {
    var checkbox = $(".genre").find('input[value="' + genre + '"]');
    checkbox.prop("checked", true);
    tag_container.prepend(`<div class="tag">
      <div class="tag_title">${genre}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
  });
  savedEditorList.forEach(function (editor) {
    var checkbox = $(".editor").find('input[value="' + editor + '"]');
    checkbox.prop("checked", true);
    tag_container.prepend(`<div class="tag">
      <div class="tag_title">${editor}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
  });
});

/*filter logic*/
// genre
const genre_ul = $(".genre-list");
const genre_filter = $(".genre");
const tag_container = $(".tag_container");
const filter_item = $(".filter_item");
// checkbox를 선택했을 때
genre_ul.find($("input")).click(function (e) {
  var checkbox = this;

  // 부모 요소에게 이벤트 전가 x
  e.stopPropagation();

  if ($(checkbox).is(":checked") == false) {
    var tag = tag_container.find(".tag_title");
    $.each(tag, function (index, el) {
      if ($(el).text() == $(checkbox).val()) {
        $(el).parent().remove();
      }
    });
    genreList.splice(genreList.indexOf($(checkbox).val()), 1);
    getSearchList();
  } else {
    tag_container.prepend(`<div class="tag">
      <div class="tag_title">${$(this).val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    genreList.push($(this).val());
    getSearchList();
  }
  console.log("genreList: " + genreList);
});

// li를 눌렀을 때
$(".genre").on("click", function () {
  var el = this;
  var checkbox = $(el).find("input");
  if (checkbox.is(":checked") == true) {
    checkbox.prop("checked", false);
    var tag = tag_container.find(".tag_title");
    $.each(tag, function (index, el) {
      if ($(el).text() == checkbox.val()) {
        $(el).parent().remove();
      }
    });
    genreList.splice(genreList.indexOf(checkbox.val()), 1);
    getSearchList();
  } else {
    checkbox.prop("checked", true);
    tag_container.prepend(`<div class="tag">
      <div class="tag_title">${checkbox.val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    genreList.push(checkbox.val());
    getSearchList();
  }
});

// editor
const editer_ul = $(".editor-list");
const editer_filter = $("editor");
// checkbox를 선택했을 때
editer_ul.find($("input")).click(function (e) {
  var checkbox = this;

  // 부모 요소에게 이벤트 전가 x
  e.stopPropagation();

  if ($(checkbox).is(":checked") == false) {
    var tag = tag_container.find(".tag_title");
    $.each(tag, function (index, el) {
      if ($(el).text() == $(checkbox).val()) {
        $(el).parent().remove();
      }
    });
    editorList.splice(editorList.indexOf($(checkbox).val()), 1);
    getSearchList();
  } else {
    tag_container.prepend(`<div class="tag">
      <div class="tag_title">${$(this).val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    editorList.push($(this).val());
    getSearchList();
  }
  console.log("editorList: " + editorList);
});

// li를 눌렀을 때
$(".editor").on("click", function () {
  var el = this;
  var checkbox = $(el).find("input");
  if (checkbox.is(":checked") == true) {
    checkbox.prop("checked", false);
    var tag = tag_container.find(".tag_title");
    $.each(tag, function (index, el) {
      if ($(el).text() == checkbox.val()) {
        $(el).parent().remove();
      }
    });
    editorList.splice(editorList.indexOf(checkbox.val()), 1);
    getSearchList();
  } else {
    checkbox.prop("checked", true);
    tag_container.prepend(`<div class="tag">
      <div class="tag_title">${checkbox.val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    editorList.push(checkbox.val());
    console.log("editorList: " + editorList);
    getSearchList();
  }
  console.log(editorList);
});

// remove filter
$(document).on("click", ".remove_filter", function () {
  var remove_filter = this;
  var tag = $(remove_filter).parent();
  var tag_title = tag.find(".tag_title").text();
  tag.remove();

  $.each(filter_item, function (index, el) {
    var checkbox = $(el).find("input");
    if (checkbox.val() == tag_title) {
      console.log(checkbox.val());

      var genreIndex = genreList.indexOf(checkbox.val());
      var editorIndex = editorList.indexOf(checkbox.val());

      if (genreIndex != -1) {
        checkbox.prop("checked", false);
        genreList.splice(genreIndex, 1);
        getSearchList();
        return false;
      } else if (editorIndex != -1) {
        checkbox.prop("checked", false);
        editorList.splice(editorIndex, 1);
        getSearchList();
        return false;
      }
    }
  });
});

// Search Logic
function getSearchList() {
  sessionStorage.setItem("genreList", JSON.stringify(genreList));
  sessionStorage.setItem("editorList", JSON.stringify(editorList));
  var genre_toString = genreList.join("|");
  var editor_toString = editorList.join(",");
  location.href =
    "./games?genre=" +
    genre_toString +
    "&editor=" +
    editor_toString +
    "&sortBy=" +
    sortBy +
    "#game_list";
  history.scrollRestoration = "auto";
}

$(document).ready(function () {
  if (window.location.pathname !== "/games") {
    // '/games'가 아닐 경우 로컬 스토리지 항목 삭제
    sessionStorage.removeItem("genreList");
    sessionStorage.removeItem("editorList");
  }
});

// 페이지가 로드될 때 스크롤 위치를 복원합니다.
// window.onload = function () {
//   var scrollPos;
//   if (sessionStorage.getItem("scrollPos") !== null) {
//     scrollPos = sessionStorage.getItem("scrollPos");
//     window.scrollTo(0, scrollPos);
//   }
// };

// 페이지가 언로드될 때 스크롤 위치를 저장합니다.
// window.onbeforeunload = function () {
//   sessionStorage.setItem(
//     "scrollPos",
//     document.documentElement.scrollTop || document.body.scrollTop
//   );
// };
