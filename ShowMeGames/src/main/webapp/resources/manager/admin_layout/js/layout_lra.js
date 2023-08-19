// preview 관련 기능
$('#input_warn_content').change(function() {
    let text = $(this).val();
    $('#warn_content').text(text);
});

$('#input_game_main_title_1').change(function() {
    let text = $(this).val();
    $('#game_main_title_1').text(text);
});

$('#input_game_sub_title_1').change(function() {
    let text = $(this).val();
    $('#game_sub_title_1').text(text);
});

$('#input_game_main_title_2').change(function() {
    let text = $(this).val();
    $('#game_main_title_2').text(text);
});

$('#input_game_sub_title_2').change(function() {
    let text = $(this).val();
    $('#game_sub_title_2').text(text);
});

$('#input_game_detail_title_1').change(function() {
    let text = $(this).val();
    $('#game_detail_title_1').text(text);
});

$('#input_game_detail_content_1').change(function() {
    let text = $(this).val();
    $('#game_detail_content_1').text(text);
});

$('#input_game_detail_title_2').change(function() {
    let text = $(this).val();
    $('#game_detail_title_2').text(text);
});

$('#input_game_detail_content_2').change(function() {
    let text = $(this).val();
    $('#game_detail_content_2').text(text);
});

// 사진 미리보기 기능
function img_preview(input, target) {
    let file = $(input)[0].files[0];

    if(isImageFile(file)) {
        let reader = new FileReader(); 
    
        reader.onload = function(e) {
            $(target).show();
            $(target).attr("src", e.target.result);
        }
    
        reader.readAsDataURL(file);
    } else {
        $(input).val('');
        alert('파일 확장자를 확인해주세요');
        return;
    }
}

// 동영상 미리보기 기능
function video_preview(input, target) {
    let file = $(input)[0].files[0];

    if(isVideoFile(file)) {
        let reader = new FileReader(); 
    
        reader.onload = function(e) {
            $(target).show();
            $(target).attr("src", e.target.result);
        }
        
        reader.readAsDataURL(file);
    } else {
        $(input).val('');
        alert('파일 확장자를 확인해주세요');
        return;
    }
}

// 이미지 확장자 검사
function isImageFile(file) {
    let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
    return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
}

function isVideoFile(file) {
    let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
    return ($.inArray(ext, ["mp4", "mkv", "x-m4v"]) === -1) ? false : true;
}

function imgLenCheck(divStr, imgStr)  {
    let img_url = $(divStr).data('img');
    if(img_url.length > 1) {
        $(imgStr).show();
    }
}

function videoLenCheck(divStr, videoStr)  {
    let video_url = $(divStr).data('video');
    if(video_url.length > 1) {
        $(videoStr).show();
    }
}

// 사진 적용
$('#input_game_img_1').on('change', function() {
    img_preview(this, '#game_img_1');
});
$('#input_game_img_2').on('change', function() {
    img_preview(this, '#game_img_2');
});

// 동영상 적용
$('#input_game_detail_video_1').on('change', function() {
    video_preview(this, '#game_detail_video_1');
});
$('#input_game_detail_video_2').on('change', function() {
    video_preview(this, '#game_detail_video_2');
});

$(document).ready(function() {
    imgLenCheck('#game_img_div_1', '#game_img_1');
    imgLenCheck('#game_img_div_2', '#game_img_2');
    videoLenCheck('#game_video_div_1', '#game_detail_video_1');
    videoLenCheck('#game_video_div_2', '#game_detail_video_2');

});