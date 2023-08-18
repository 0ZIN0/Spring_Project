var ovf, slider;
$(window).on("scroll", function () {
  var contentTop = $(".content_div").offset().top;
  var windowScrollTop = $(window).scrollTop();

  if (windowScrollTop - 200 >= contentTop) {
    slider = $(".content_div")[0];
    winResize();
    $(window).on("resize", winResize);
    adjustOpacityForAll(windowScrollTop, contentTop);
  }
});

function adjustOpacityForAll(scrollTop, contentTop) {
  var opacityDiff = (scrollTop - contentTop) / 1000; // 1000은 원하는 값으로 조정 가능
  var newOpacity = 1 - opacityDiff;

  newOpacity = Math.max(0, Math.min(1, newOpacity));

  // 모든 .overflow 요소에 대해 투명도 조절
  $(".overflow").each(function () {
    $(this).css("opacity", newOpacity);
  });
}

function winResize() {
  $(".overflow").each(function () {
    var currentOverflow = $(this);
    var correspondingSlider = currentOverflow.prev(".content_div");
    currentOverflow.css("top", correspondingSlider.height() + "px");
  });
}
