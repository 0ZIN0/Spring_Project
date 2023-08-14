// 업데이트 하지 않고 나갈 때 확인창
let checkUnload = true;
$(window).on("beforeunload", function(){
    if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
});

// 뒤로가기, 취소버튼 기능
const game_id = $('main').data('id');

function back_btn() {
    location.href = `./admin_game_detail?game_id=${game_id}`;
}
$('.btn.cancel').click(back_btn);

// 할인된 가격 계산
const price_div = $('#input_game_price');
const discount_div = $('#input_discount');
const dis_price_div = $('#discounted_price_span');

function calDiscount() {
    let price = $(price_div).val();
    let discount = $(discount_div).val();

    if(discount == 0) return price; 
		
    let discountPrice = discount / 100.0 * price;  
    
    return Math.floor((price - discountPrice) / 10) * 10;
}

$(dis_price_div).val(calDiscount);

$(price_div).change(function() {
    $(dis_price_div).val(calDiscount);
});

$(discount_div).change(function() {
    $(dis_price_div).val(calDiscount);
});

// radio 자동체크 함수
function autoCheck(check_data, target_arr) {
    $(target_arr).each(function(index, item) {
        if($(item).val() == check_data) {
            $(item).attr('checked', true);
            return false;
        }
    })  
}

// 체크박스 자동체크 함수
function autoCheckbox(check_data, target_arr) {
    $(target_arr).each(function(index, item) {
        if(String(check_data).indexOf($(item).val()) != -1) {
                $(item).attr('checked', true);
        };
    });
}

// 한국어 지원유무 체크 
const game_korean = $('#input_korean_wrapper').data('korean');
let input_korean_arr = $('input[name=korean]');
autoCheck(game_korean, input_korean_arr);

// 게임 모드 체크
const game_mode = $('#input_game_mode_wrapper').data('mode');
let input_mode_arr = $('input[name=game_mode]');
autoCheck(game_mode, input_mode_arr);

// 에디터 체크
const editor = $('#input_editor_wrapper').data('editor');
let input_editor_arr = $('input[name=editor]');
if(!editor) {
    $('#input_editor8').attr('checked', true);
} else {
    autoCheck(editor, input_editor_arr);
}

// 레이아웃 체크
const layout = $('#input_layout_wrapper').data('layout');
let input_layout_arr = $('input[name=layout]');
if(!layout) {
    $('#input_layout1').attr('checked', true);
} else {
    autoCheck(layout, input_layout_arr);
}

// 플랫폼 체크박스 
const platform = $('#input_platform_wrapper').data('platform');
let input_platform_arr = $('input[name=platform_piece]');
autoCheckbox(platform, input_platform_arr);

// 장르 체크박스
const genre = $('#input_genre_wrapper').data('genre');
let input_genre_arr = $('input[name=game_genre_piece]');
autoCheckbox(genre, input_genre_arr);

// 게임등급 체크박스
const rated = $('#input_rated_wrapper').data('rated');
let input_rated_arr = $('input[name=rated_piece]');
autoCheckbox(rated, input_rated_arr);

// 평점 관련 부분
const star_span = $('#starpoint');
let game_grade = $('#input_game_grade').val();

// 별점 표시 바꾸는 함수
function starCal(game_grade) {
    $(star_span).css('width', `${100 * game_grade/5}%`);    
}
starCal(game_grade);

// 평점이 바뀔 때
$('#input_game_grade').change(function() {
    let val = $(this).val();

    if(val > 5) {
        val = 5;
        $(this).val(val);
    }
    if(val < 0) {
        val = 0;
        $(this).val(val);
    }

    starCal(val);
});

// checkbox 값을 모아서 배열로 만들어주는 함수
function checkboxToArray(checkbox_arr) {
    let arr = [];

    $(checkbox_arr).each(function(index, item) {
        arr.push($(item).val());
    });

    return arr;
}

// 변경 눌렀을 때 동작
$('#game_update_form').submit(function() {
    checkUnload = false;

    let platform_piece_arr = $('input[name=platform_piece]:checked');
    let platform_arr = checkboxToArray(platform_piece_arr);
    let platform_str = platform_arr.join(" ");
    if(!platform_str) {
        platform_str = "미분류";
    }
    $('#hidden_platform').val(platform_str);

    let gerne_piece_arr = $('input[name=game_genre_piece]:checked');
    let gerne_arr = checkboxToArray(gerne_piece_arr);
    let genre_str = gerne_arr.join(" ");
    if(!genre_str) {
        genre_str = "PC";
    }
    $('#hidden_genre').val(genre_str);

    let rated_piece_arr = $('input[name=rated_piece]:checked');
    let rated_arr = checkboxToArray(rated_piece_arr);
    let rated_str = rated_arr.join("/");
    if(!rated_str) {
        rated_str = "ageNone";
    }
    $('#hidden_rated').val(rated_str);

});
    
