const conPath = $("#conpath").data("conpath");

// notice sort select css active
var noticeSelectYear = $("#notice-year-select");
noticeSelectYear.on("click", (e) => {
  noticeSelectYear.addClass("select-click");
  noticeSelectYear.removeClass("select-none");
  noticeSelectDate.removeClass("select-click");
  noticeSelectDate.addClass("select-none");
});

var noticeSelectDate = $("#notice-date-select");
noticeSelectDate.on("click", (e) => {
  noticeSelectDate.addClass("select-click");
  noticeSelectDate.removeClass("select-none");
  noticeSelectYear.removeClass("select-click");
  noticeSelectYear.addClass("select-none");
});

$("html").click(function (e) {
  if (!$(e.target).hasClass("select-click")) {
    if (!$(e.target).hasClass("select-year")) {
      noticeSelectYear.addClass("select-none");
      noticeSelectYear.removeClass("select-click");
    }
    if (!$(e.target).hasClass("select-date")) {
      noticeSelectDate.addClass("select-none");
      noticeSelectDate.removeClass("select-click");
    }
  }
});

// select year ajax
$(".selects").click(function (e) {
  $.ajax({
    url: `./select-notice?year=${$("#notice-year-select").val()}&date=${$(
      "#notice-date-select"
    ).val()}`,
    type: "GET",
    dataType: "json", // 받는 데이터의 타입
    success: (notices, state, xhttp) => {
      $("#notice-grid-content").children().removeClass("notice-grid-view");
      $("#notice-grid-content").children().addClass("notice-grid-none");
      if (notices.length != 0) {
        // document.createElement + document.createTextNode()를 생략
        let date = new Date(notices[0].write_date);

        const noticeDate = $(`<div class="notice-date">
                    ${date.getFullYear()}년
                    </div>`);

        $("#notice-grid-content").append(noticeDate); // appendChild()

        notices.forEach((notice) => {
          let detailDate = new Date(notice.write_date);

          const noticeContent = $(
            `<a class="notice-content" id="notice-id" href="./detail?id=${
              notice.notice_id
            }">
						<div class="notice-banner">
							<img class="banner-img" alt=""
								src="${conPath}${notice.banner_url}">
							<div class="notice-detail-banner">
								<div class="banner-date">
									${dateFormat(detailDate)}
								</div>
								<div class="banner-title">${notice.notice_title}</div>
								<div class="banner-content">${notice.short_content}</div>
								<div class="banner-others-btn">
									<div>더 읽어보기</div>
									<div>
										<span class="material-symbols-outlined">arrow_right</span>
									</div>
								</div>
							</div>
						</div>
					</a>`
          );

          $("#notice-grid-content").append(noticeContent);
        });
      }
    },
  });
});

// date format
function dateFormat(date) {
  let month = date.getMonth() + 1;
  let day = date.getDate();

  month = month >= 10 ? month : "0" + month;
  day = day >= 10 ? day : "0" + day;

  return date.getFullYear() + "년 " + month + "월 " + day + "일";
}

// infinity scroll
const options = {
  // null을 설정하거나 무엇도 설정하지 않으면 브라우저 viewport가 기준이 된다.
  root: null,
  // 타겟 요소의 10%가 루트 요소와 겹치면 콜백을 실행한다.
  threshold: 0.1,
};
let index = 2;
const notice_grid = $("#notice-grid-content");
let observer = new IntersectionObserver(function (entries, observer) {
  entries.forEach((entry) => {
    // 타겟 요소와 루트 요소가 교차하면
    if (entry.isIntersecting) {
      $.ajax({
        url: `./notice-ajax?num=${index}`,
        type: "GET",
        dataType: "json", // 받는 데이터의 타입
        success: (notices, state, xhttp) => {
          console.log("success");
          notices.forEach(function (notice) {
            notice_grid.append(
              `<a class="notice-content" id="notice-id" href="./notice/notice_detail?id=${notice.notice_id}">
                          <div class="notice-banner">
                              <img class="banner-img" alt=""
                                  src="/smg/resources/img/customer/notice/${notice.banner_url}">
                              <div class="notice-detail-banner">
                                  <div class="banner-date">
                                      <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${notice.write_date}"/>
                                  </div>
                                  <div class="banner-title">${notice.notice_title}</div>
                                  <div class="banner-content">${notice.short_content}</div>
                                  <div class="banner-others-btn">
                                      <div>더 읽어보기</div>
                                      <div>
                                          <span class="material-symbols-outlined">arrow_right</span>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </a>`
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
observer.observe(document.querySelector("footer"));
