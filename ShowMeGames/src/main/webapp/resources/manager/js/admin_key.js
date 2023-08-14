const row_content = $(".row-content");
const key_id = $(".key-id");
const nick_name = $(".nick_name");

key_id.on("click", function () {
  $(this).removeAttr("readonly");
});

nick_name.on("click", function () {
  $(this).removeAttr("readonly");
});

row_content.on("blur", function () {
  console.log("blur!");
  let thisKeyId = $(this).find(".key-id");
  let thisNickName = $(this).find(".nick_name");
  const originKeyId = thisKeyId.data("originKey");
  const originNickName = thisNickName.data("originName");
  thisKeyId.val(originKeyId);
  thisNickName.val(originNickName);
});

$("#key_modify").on("submit", function (e) {
  console.log("제출");
  const isConfirmed = confirm("정말로 수정하시겠습니까?");

  if (!isConfirmed) {
    e.preventDefault(); // 폼 제출을 중지합니다.
  }
});

const searchParams = new URLSearchParams(location.search);
const search = searchParams.get("search");
const search_tag = searchParams.get("search_tag");
const options = {
  // null을 설정하거나 무엇도 설정하지 않으면 브라우저 viewport가 기준이 된다.
  root: null,
  // 타겟 요소의 10%가 루트 요소와 겹치면 콜백을 실행한다.
  threshold: 0.1,
};
let index = 2;
const content_div = $("#row-content");
let observer = new IntersectionObserver(function (entries, observer) {
  entries.forEach((entry) => {
    // 타겟 요소와 루트 요소가 교차하면
    if (entry.isIntersecting) {
      $.ajax({
        url: `./admin_key_ajax?search=${search}&search_tag=${search_tag}&num=${index}`,
        type: "GET",
        dataType: "json", // 받는 데이터의 타입
        success: (gameKeys, state, xhttp) => {
          console.log("success");
          gameKeys.forEach(function (key) {
            let nick_name = key.nick_name;
            if (nick_name == null) {
              nick_name = "";
            }
            console.log(key);
            content_div.append(
              `<form id="key_modify ${key.key_num}" action="./key_modify" method="POST">
              <div class="row-content" data-key="key-${key.key_num}">
                <input class="key_num" name="key_num" value="${key.key_num}" readonly/>
                <div class="game-title">${key.game_id}</div>
                <input type="text" name="key_id" class="key-id" data-originKey="${key.key_id}"
                value="${key.key_id}" readonly></input>
                <input type="text" name="nick_name" class="nick_name" data-originName="${key.nick_name}"
                value="${nick_name}" readonly></input>
                <div>
                  <button type="submit" class="btn key-btn"
                    data-key="key-${key.key_num}">키 수정</button>
                </div>
              </div>
            </form>`
            );
          });
          // AJAX 호출이 성공적으로 끝난 후에 index를 증가시킵니다.
          index++;
        },
      });
    }
  });
}, options);

// list의 끝부분을 알려주는 p 타겟 요소를 관찰
observer.observe(document.querySelector(".end"));
