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

// toDetailBtn에 동적으로 이벤트 할당
$(document).on('click', '.toDetailBtn', function() {
	let id = $(this).data('id');
	location.href = './detail?game=' + id;
});

// toGenreBtn에 동적으로 이벤트 할당
$(document).on('click', '.toGenreBtn', function() {
	let id = $($(this)).data('id');
	location.href = './genre?game_genre=' + id;
});

// 장르 이동 버튼
let genre_imgurl = $('#genre-container').data('imgurl');
let genres = [
	{
		'text': '캐주얼',
		'img' : genre_imgurl + '/genre1.png'
	},
	{
		'text': '전략/시뮬',
		'img' : genre_imgurl + '/genre2.png'
	},
	{
		'text': 'RPG',
		'img' : genre_imgurl + '/genre3.png'
	},
	{
		'text': '퍼즐',
		'img' : genre_imgurl + '/genre4.png'
	},
	{
		'text': '액션/어드벤처',
		'img' : genre_imgurl + '/genre5.png'
	},
	{
		'text': '슈팅/FPS',
		'img' : genre_imgurl + '/genre6.png'
	},
	{
		'text': '멀티/협동',
		'img' : genre_imgurl + '/genre7.png'
	},
	{
		'text': '레이싱',
		'img' : genre_imgurl + '/genre8.png'
	},
	{
		'text': '스포츠',
		'img' : genre_imgurl + '/genre9.png'
	},
];
let lastIndex = genres.length - 1;
let preBtnIndex = lastIndex;
let nextBtnIndex = 4;
const preBtn = $('#genre-div > .btn:first-child > i');
const nextBtn = $('#genre-div > .btn:last-child > i');

// 이전버튼
$(preBtn).click(function() {
	$('#genre-container').prepend(
		'<div class="genres toGenreBtn" data-id="' + genres[preBtnIndex].text +
			'" style="background-image: url(' + genres[preBtnIndex].img + '">' +
			'<span>' + genres[preBtnIndex].text + '</span>' +
		'</div>'
	);
	$('#genre-container > div:last-child').remove();
	--preBtnIndex;
	--nextBtnIndex;

	if(preBtnIndex == -1) preBtnIndex = lastIndex;
	if(nextBtnIndex == -1) nextBtnIndex = lastIndex;
	if(preBtnIndex == 9) preBtnIndex = 0;
	if(nextBtnIndex == 9) nextBtnIndex = 0;
});

// 다음버튼
$(nextBtn).click(function() {
	$('#genre-container').append(
		'<div class="genres toGenreBtn" data-id="' + genres[nextBtnIndex].text +
			'" style="background-image: url(' + genres[nextBtnIndex].img + '">' +
			'<span>' + genres[nextBtnIndex].text + '</span>' +
		'</div>'
	);
	$('#genre-container > div:first-child').remove();
	++preBtnIndex;
	++nextBtnIndex;

	if(preBtnIndex == -1) preBtnIndex = lastIndex;
	if(nextBtnIndex == -1) nextBtnIndex = lastIndex;
	if(preBtnIndex == 9) preBtnIndex = 0;
	if(nextBtnIndex == 9) nextBtnIndex = 0;
});