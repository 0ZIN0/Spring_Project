var filterArr = new Array();

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
/*sort_selector*/ 
const label = $('.label');
const options = $('.option_item');
const text = $('.label_text');
const arrow = $('.arrow');

const handleSelect = (item) => {
  label.parent().removeClass('active');
  const itemText = $(item).text();
  text.text(itemText);
}

options.on('click', function(e) {
  var el = $(this);
  $('label .arrow').removeClass('reverse');
  handleSelect(el);
});

// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.on('click', () => {
  if(label.parent().hasClass('active')) {
  	label.parent().removeClass('active');
    label.find('.arrow').removeClass('reverse');
  } else {
  	label.parent().addClass('active');
    label.find('.arrow').addClass('reverse');
  }
});

label.on('blur', function(e) {
  $(this).parent().removeClass('active'); // 라벨(label) 요소의 부모에서 'active' 클래스를 제거합니다.
  $(this).find('.arrow').removeClass('reverse'); // 라벨(label) 요소 내부에서 .arrow 클래스를 가진 요소의 'reverse' 클래스를 제거합니다.
});

/*filter logic*/
const filter_item = $('.filter_item');
const tag_container = $('.tag_container');
// checkbox를 선택했을 때
$('input').click(function(e) {
  var checkbox = this;

  // 부모 요소에게 이벤트 전가 x
  e.stopPropagation();

  if($(checkbox).is(':checked') == false) {
    var tag = tag_container.find('.tag_title');
    $.each(tag, function(index,el) {
      if($(el).text() == $(checkbox).val()) {
        $(el).parent().remove();
      }
    })
    filterArr.splice(filterArr.indexOf($(checkbox).val()), 1);
    getSearchList();
  } else {
    tag_container
    .prepend(`<div class="tag">
      <div class="tag_title">${$(this).val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    filterArr.push($(this).val());
    getSearchList();
  }
  console.log(filterArr);
});

// li를 눌렀을 때
filter_item.on('click', function() {
  var el = this;
  var checkbox = $(el).find('input');
  if(checkbox.is(':checked') == true) {
    checkbox.prop('checked', false);
    var tag = tag_container.find('.tag_title');
    $.each(tag, function(index,el) {
      if($(el).text() == checkbox.val()) {
        $(el).parent().remove();
      }
    })
    filterArr.splice(filterArr.indexOf(checkbox.val()), 1);
    getSearchList();
  } else {
    checkbox.prop('checked', true);
    tag_container
    .prepend(`<div class="tag">
      <div class="tag_title">${checkbox.val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    filterArr.push(checkbox.val());
    getSearchList();
  }
  console.log(filterArr);
});

// remove filter
$(document).on('click', '.remove_filter', function() {
  var remove_filter = this;
  var tag = $(remove_filter).parent();
  tag.remove();
  $.each(filter_item, function(index, el){
    var checkbox = $(el).find('input');
    if(checkbox.val() == tag.find('.tag_title').text()){
      checkbox.prop('checked', false);
      filterArr.splice(filterArr.indexOf(checkbox.val()), 1);
      return false;
    }
  })
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

// Search Logic


function getSearchList(){
 $.ajax ({
  url: `./games-filter?${filterArr.join()}`,
  type: 'GET',
  data: {filters: filterArr},
  dataType: 'json',
  success: function(resp) {
    console.log(resp);
  }
 });
}