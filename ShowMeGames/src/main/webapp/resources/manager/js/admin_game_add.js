// 업데이트 하지 않고 나갈 때 확인창
let checkUnload = true;
$(window).on("beforeunload", function(){
    if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
});

// 뒤로가기, 취소버튼 기능
function back_btn() {
    location.href = './admin_game';
}
$('.btn.cancel').click(back_btn);

// 원가격, 할인율 제한 기능
$('#input_game_price').change(function() {
    if($(this).val() < 0) {
        $(this).val(0);
    }
})
$('#input_discount').change(function() {
    if($(this).val() < 0) {
        $(this).val(0);
    } else if($(this).val() > 100) {
        $(this).val(100);
    }
});

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

// 이미지 미리보기 기능
let valid_img = false;
$('#img_file').on('change', function() {
    let file = $(this)[0].files[0];

    if(isImageFile(file)) {
        let name_str = file.name.substring(0, file.name.lastIndexOf('.'));

        $('#img_file_name').val(name_str); 

        let reader = new FileReader(); 
    
        reader.onload = function(e) {
            $("#img_preview").show();
            $("#img_preview").attr("src", e.target.result);
        }
    
        reader.readAsDataURL(file);

        valid_img = true;
    } else {
        valid_img = false;
        alert('파일 확장자를 확인해주세요');
        return;
    }
});

// 이미지 확장자 검사
function isImageFile(file) {
    let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
    return ($.inArray(ext, ["jpg", "jpeg", "png"]) === -1) ? false : true;
}

// 변경 눌렀을 때 동작
$('#game_add_form').submit(function() {
    if(!valid_img) {
        alert('이미지 파일을 확인해주세요');
        return false;
    }

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