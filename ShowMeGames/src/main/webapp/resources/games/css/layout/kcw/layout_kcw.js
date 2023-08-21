var ovf, slider;

$(function () {
  slider = $(".content_div")[0]; // jQuery 객체에서 DOM 요소를 가져옴
  ovf = $(".overflow")[0]; // jQuery 객체에서 DOM 요소를 가져옴
  winResize();
  $(window).on("resize", winResize);
  $(window).on("scroll", winScroll);
});

function winResize() {
  ovf.style.top = slider.offsetHeight + "px";
}

function winScroll() {
  var op = 1 - window.pageYOffset / slider.offsetHeight;
  slider.style.opacity = op;
}
