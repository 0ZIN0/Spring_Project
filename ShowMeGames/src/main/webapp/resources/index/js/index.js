// card scroll
// 스크롤 이동 버튼
let isAnimating = false;
const card_container = $('.card-container');
const next_btn = $('.slider-next-btn');
const prev_btn = $('.slider-prev-btn');
next_btn.on('click', function() {
  if(!isAnimating) {
    $(this).parent().scrollLeft($(this).parent().scrollLeft() + 1600);
  }
});
prev_btn.on('click', function() {
  if(!isAnimating) {
    $(this).parent().scrollLeft($(this).parent().scrollLeft() - 1600);
  }
});

card_container.scroll(function() {
  isAnimating = true;
  var el = this;
	var current = $(el).scrollLeft();
	var width = $(el).prop('scrollWidth') - $(el).prop('clientWidth');

	clearTimeout($.data(this, 'scrollTimer'));
	
	$.data(this, 'scrollTimer', setTimeout(() => {
		if ((width - current) <= 50) {
			$(el).find('.slider-next-btn').addClass('inactive');
      $(el).find('.slider-prev-btn').removeClass('inactive');
		} else if (current <= 30) {
			$(el).find('.slider-prev-btn').addClass('inactive');
      $(el).find('.slider-next-btn').removeClass('inactive');
		} else {
			$(el).find('.slider-next-btn').removeClass('inactive');
			$(el).find('.slider-prev-btn').removeClass('inactive');
		}
    isAnimating = false;
	}, 100));
});

