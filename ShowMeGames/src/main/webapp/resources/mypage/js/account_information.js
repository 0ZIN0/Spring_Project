let chkNick = /^[가-힣a-zA-Z0-9_-]{3,15}$/

// 닉네임 변경 관련
function cancel() {
    $('#nickname_update_modal').hide();
    $('body').css('overflow', 'auto');
}

$('#nick_update_icon').click(function() {
    $('#nickname_update_modal').show();
    $('body').css('overflow', 'hidden')
});

$('#modal_close').click(function() {
    cancel();
});
$('#modal_close_btn').click(function() {
    cancel();
});

// 변경 버튼 누를 시 
$('#form_nickname_update').submit(function() {

    if(!chkNick.test($('#username').val())) {
        alert('닉네임이 규정에 맞지 않습니다');
        $('#username').focus();
        return false;
    }

});

// 프로필 사진 변경 관련
$('#profile_update_icon').click(function() {
    $('#img_update_modal').show();
    $('body').css('overflow', 'hidden')
});

function cancel_profile() {
    $(location).prop("href", location.href);       
}

$('#img_modal_close').click(function() {
    cancel_profile();
});
$("#img_modal_close_btn").click(function() {
    cancel_profile();
})

let valid_img = false;
$('#img_file').on('change', function() {
    let file = $(this)[0].files[0];

    if(isImageFile(file)) {
        $('#img_file_name').val(file.name); 
    
        let reader = new FileReader(); 
    
        reader.onload = function(e) {
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

// 이미지 변경 버튼 누를 시 
$('#form_img_update').submit(function() {

    if(!valid_img) {
        alert('이미지 파일을 선택해주세요');
        return false;
    }

});

