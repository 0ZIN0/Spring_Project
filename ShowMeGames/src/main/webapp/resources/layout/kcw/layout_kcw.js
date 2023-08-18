function isElementInViewport(el) {
  var rect = el.getBoundingClientRect();

  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <=
      (window.innerHeight || document.documentElement.clientHeight) &&
    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
  );
}

// 사용 예제
$(window).on("scroll", function () {
  $(".detail_text").each(function () {
    if (isElementInViewport(this)) {
      console.log("요소가 화면 안에 있습니다.");
      $(this).css("opacity", 1.0);
    } else {
      console.log("요소가 화면 밖에 있습니다.");
    }
  });
});
