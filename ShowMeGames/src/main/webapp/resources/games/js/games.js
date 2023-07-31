
// filter_toggle
$('.filter_toggle').on('click', function() {
  var el = this;
  if ($(el).parent().hasClass('active')) {
    $(el).parent().removeClass('active');
    $(el).find('.arrow').removeClass('reverse');
  } else {
    $(el).parent().addClass('active');
    $(el).find('.arrow').addClass('reverse');
  }
});



//filter scroll
const secondary = $('.secondary');
const filter = $('.filter');
const header = $('header');
$(window).scroll(function() {

  var filterHeight = filter.height(); // 필터의 높이
  var viewportHeight = $(window).height(); // 뷰포트의 높이
  var scrollValue = $(document).scrollTop(); // 현재 스크롤 값(스크롤 바의 top)

  var filterBottom = filter.offset().top + filter.outerHeight(); // 필터div 하단의 위치
  var secondaryBottom = secondary.offset().top + secondary.outerHeight(); // 필터div의 부모 하단의 위치(컨테이너)

  var headerHeight = header.outerHeight(); // 헤더의 높이

  if(scrollValue > secondary.offset().top && scrollValue + viewportHeight < secondaryBottom){
    // 현재 스크롤이 컨테이너 안에 있는가?
    filter.removeClass('fixed-bottom');
    if(filterHeight <= viewportHeight - headerHeight) {
      // 필터의 높이가 현재 화면의 높이보다 긴가?
      filter.removeClass('fixed');
      filter.addClass('sticky');
    } else {
      filter.removeClass('sticky');
      filter.addClass('fixed');
    }
  } else {
    if(filterBottom >= secondaryBottom) {
      // 필터 하단이 컨테이너 하단을 벗어나려 하는가?
      filter.addClass('fixed-bottom');
      filter.removeClass('sticky');
    } else {
      filter.removeClass('fixed');
    }
  }
});

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

