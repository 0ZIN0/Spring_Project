let game_id = $('main').data('id');
let prePageInfo = $('main').data('prepageinfo');

let page;
let type;
let key;

// 접근한 목록을 기억하게 하기 위한 함수
let pageinfoArr;
if(String(prePageInfo).indexOf('/') != -1) {
    pageinfoArr = prePageInfo.split('/');
    page = pageinfoArr[0];
    
    if(pageinfoArr.length > 1) {
        type = pageinfoArr[1];
        key = pageinfoArr[2];
    }
} else {
    page = prePageInfo;
}

// 수정 버튼
$('#admin_update_btn').click(function() {
    location.href = `./admin_game_update?game_id=${game_id}`;
});

// 목록 버튼
$('#admin_cancel_btn').click(function() {
    if(type == undefined) {
        location.href = `./admin_game?page=${page}`;
    } else {
        location.href = `./admin_game?page=${page}&&type=${type}&&key=${key}`;
    }
});

$('#game_delete_btn').click(function() {
    let result = confirm('정말 이 게임을 데이터베이스에서 삭제하시겠습니까? \n결정은 되돌릴 수 없습니다.');
    
    if(!result) return;

    location.href = `./admin_game_delete?game_id=${game_id}`;
});

// 상세페이지 설정 버튼
const layout = $('#game_layout_btn').data('layout');
$('#game_layout_btn').click(function() {
    location.href = `./admin_game_layout?game_id=${game_id}&&layout=${layout}`;
});

// 요구사항 등록/수정 버튼
$('#game_req_update_btn').click(function() {
    location.href= `./admin_game_req?game_id=${game_id}`;
});

// 맨 위로 가는 버튼 기능 관련
$(window).scroll(function() {
    let height = $(document).scrollTop();
    let btn = $('#upward_btn');
    if(height > 900) {
        btn.show();
        btn.css('opacity', 1);
    } else if(height > 600) {
        btn.show();
        btn.css('opacity', (height - 600) / 300);
    }else {
        btn.hide();
    }
});

$('#upward_btn').click(function() {
    $(document).scrollTop(0);
});

// 이미지 슬라이드 관련
$('#admin_slide_update_btn').click(function() {
    location.href=`./admin_game_slide?game_id=${game_id}`;
});

// slide show 
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = $(".imgSlides");
  let dots = $(".demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    $(slides[i]).hide();
  }
  for (i = 0; i < dots.length; i++) {
    $(dots[i]).removeClass('active');
  }

  $(slides[slideIndex-1]).show();
  $(dots[slideIndex-1]).addClass('active');
}

$('#prev-btn').click(() => {
    plusSlides(-1);
});
$('#next-btn').click(() => {
    plusSlides(1);
});