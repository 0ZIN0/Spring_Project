
// preview 관련 기능
$('#input_warn_content').change(function() {
    let text = $(this).val();
    $('#war_content').text(text);
});

$('#input_game_info_title').change(function() {
    let text = $(this).val();
    $('#game_info_title_1').text(text);
});

$('#input_game_info_content').change(function() {
    let text = $(this).val();
    $('#game_info_content_1').text(text);
});

$('#input_game_story').change(function() {
    let text = $(this).val();
    $('#game_story_1').text(text);
});

$('#input_img_url').on('change', function() {
    let file = $(this)[0].files[0];

    if(isImageFile(file)) {
        let reader = new FileReader(); 
    
        reader.onload = function(e) {
            $("#game_info_img").show();
            $("#game_info_img").attr("src", e.target.result);
        }
    
        reader.readAsDataURL(file);
    } else {
        $(this).val('');
        alert('파일 확장자를 확인해주세요');
        return;
    }
});

// 이미지 확장자 검사
function isImageFile(file) {
    let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
    return ($.inArray(ext, ["jpg", "jpeg", "png"]) === -1) ? false : true;
}

$(document).ready(function() {
    let img_url = $('#game_info_img_1').data('img');

    if(img_url.length > 1) {
        $('#game_info_img').show();
    }

    $('#war_content').text($('#input_warn_content').val());
    $('#game_info_title_1').text($('#input_game_info_title').val());
    $('#game_info_content_1').text($('#input_game_info_content').val());
    $('#game_story_1').text($('#input_game_story').val());
});