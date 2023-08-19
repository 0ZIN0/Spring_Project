const game_id = $('main').data('id');

// 뒤로가기 버튼
function back_btn() {
    location.href = `./admin_game_detail?game_id=${game_id}`;
}
$('.btn.cancel').click(back_btn);

// 전달받은 사진이 없으면 해당 index 사진은 감춤.
$('.slide_img').each(function(index, el) {
    let id =  $(el).data('id');
    if(id == 0 || id == undefined || id == null) {
        $(el).hide();
    }
});

// 이미지 확장자 검사
function isImageFile(file) {
    let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
    return ($.inArray(ext, ["jpg", "jpeg", "png", "gif", "webp"]) === -1) ? false : true;
}

// 이미지 미리보기, 파일 이름 표시 기능
function imgPreivew(file_input, file_name, preview_img) {
    let file = file_input[0].files[0];
    
    if(isImageFile(file)) {
        file_name.val(file.name); 
    
        let reader = new FileReader(); 
    
        reader.onload = function(e) {
            preview_img.show();
            preview_img.attr("src", e.target.result);
        }
    
        reader.readAsDataURL(file);
    } else {
        alert('파일 확장자를 확인해주세요');
        file_input.val('');
        return;
    }
}

// 슬라이드 이미지 변경 관련

// 서브배너 변경 관련
$('#sub_img_file').on('change', function() {
    imgPreivew($(this), $('#sub_img_file_name'), $("#sub_img_preview"));

    if($('#form_sub_banner_btn').is(':disabled') == true) {
        $('#form_sub_banner_btn').attr('disabled', false);
    }
});

// 슬라이드 이미지 변경 관련
for(let i = 0; i <= 4; ++i) {
    $(`#slide_file${i}`).on('change', function() {
        imgPreivew($(this), $(`#slide_img_file_name${i}`), $(`#slide_img_preview${i}`));

        if($('#form_slide_btn').is(':disabled') == true) {
            $('#form_slide_btn').attr('disabled', false);
        }
    });
}

// 슬라이드 이미지 제출시
$('#form_slide').submit(function() {
    return confirm('슬라이드 이미지를 변경하시겠습니까?');
});

$('#form_sub_banner').submit(function() {
    return confirm('서브 배너 이미지를 변경하시겠습니까?');
});