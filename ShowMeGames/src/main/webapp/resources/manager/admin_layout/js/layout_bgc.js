// preview 관련 기능
$('#input_warn_content').change(function() {
    let text = $(this).val();
    $('#warn_content').text(text);
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
    return ($.inArray(ext, ["mp4", "mkv", "x-m4v", "webm"]) === -1) ? false : true;
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
    img_preview(this, '#game_img1');
});
$('#input_game_img_2').on('change', function() {
    img_preview(this, '#game_img2');
});
$('#input_game_img_3').on('change', function() {
    img_preview(this, '#game_img3');
});
$('#input_game_img_4').on('change', function() {
    img_preview(this, '#game_img4');
});
// 동영상 적용
$('#input_game_detail_video_1').on('change', function() {
    video_preview(this, '#game_video1');
});
$('#input_game_detail_video_2').on('change', function() {
    video_preview(this, '#game_video2');
});
$('#input_game_detail_video_3').on('change', function() {
    video_preview(this, '#game_video3');
});
$('#input_game_detail_video_4').on('change', function() {
    video_preview(this, '#game_video4');
});
$(document).ready(function() {
 
    imgLenCheck('#game_img_div_1', '#game_img1');
    videoLenCheck('#game_video_div_1', '#game_video1');
    imgLenCheck('#game_img_div_2', '#game_img2');
    videoLenCheck('#game_video_div_2', '#game_video2');
    imgLenCheck('#game_img_div_3', '#game_img3');
    videoLenCheck('#game_video_div_3', '#game_video3');
    imgLenCheck('#game_img_div_4', '#game_img4');
    videoLenCheck('#game_video_div_4', '#game_video4');
	
});