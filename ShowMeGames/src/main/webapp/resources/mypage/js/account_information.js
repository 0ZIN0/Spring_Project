let chkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let chkName = /^[가-힣]{2,13}$/;
let chkPhone = /^010-\d{4}-\d{4}$/;
let chkNick = /^[가-힣a-zA-Z0-9_-]{3,15}$/;

let chkKorean = /^.*[가-힣].*$/;
let koreanRegex = /^[가-힣]$/;

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
const MAX_BYTE = 20;
let present_byte = 0;
$('#form_nickname_update').submit(function() {

    if(!chkNick.test($('#username').val())) {
        alert('닉네임이 규정에 맞지 않습니다');
        $('#username').focus();
        return false;
    }

    if(chkKorean.test($('#username').val())) {
        let str = $('#username').val();

        present_byte=0;
        for(let i = 0; i < str.length; ++i) {
            if(koreanRegex.test(str.charAt(i))) {
                present_byte += 3;
            } else {
                present_byte += 1;
            };
        }

        if(present_byte > MAX_BYTE) {
            alert('닉네임이 너무 깁니다');
            return false;
        }
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

/* 개인 정보 업데이트 기능 관련 */

// 업데이트 form 보이기
$('#personal_info_on_btn').click(function() {
    $('#personal_info_content').hide();
    $('#personal_info_on_btn').hide();
    $('#form_userinfo_update').show();
});

// 업데이트 form 숨기기
$('#userinfo_cancel_btn').click(function() {
    $('#personal_info_content').show();
    $('#personal_info_on_btn').show();
    $('#form_userinfo_update').hide();
});

// 변경 버튼 on/off
$('.info_input').change(function() {
    
    if(!chkEmail.test($('#user_id').val())) {
        $('#userinfo_update_btn').attr('disabled', true);
        return;
    }

    if(!chkName.test($('#user_name').val())) {
        $('#userinfo_update_btn').attr('disabled', true);
        return;
    }

    if(!chkPhone.test($('#phone_number').val())) {
        $('#userinfo_update_btn').attr('disabled', true);
        return;
    }

    $('#userinfo_update_btn').attr('disabled', false);

});

// 개인정보 변경 버튼 눌렀을 때
$('#form_userinfo_update').submit(function() {

    if(!chkEmail.test($('#user_id').val())) {
        alert('이메일확인');
        $('#user_id').focus();        
        return;
    }

    if(!chkName.test($('#user_name').val())) {
        alert('이름확인');
        $('#user_name').focus();
        return;
    }

    if(!chkPhone.test($('#phone_number').val())) {
        alert('전화번호확인');
        $('#phone_number').focus();
        return;
    }

    confirm('개인정보가 변경되었습니다.');
});


/* 탈퇴 관련 기능 */

// 회원 탈퇴 모달 on/off
function user_withdrawal_cancel() {
    $('#user_withdrawal_modal').hide();
    $('body').css('overflow', 'auto');
}

$('#user_withdrawal_modal_open').click(function() {
    $('#user_withdrawal_modal').show();
    $('body').css('overflow', 'hidden');
});

$('#user_withdrawal_modal_close').click(function() {
    user_withdrawal_cancel();
});

$('#user_withdrawal_modal_close_btn').click(function() {
    user_withdrawal_cancel();
});

$('#form_user_withdrawal').submit(function() {
    let confirm_str = $('#withdrawal_confirm').data('str');

    if($('#withdrawal_confirm').val() !== confirm_str) {
        alert('확인문구를 정확하게 입력해주세요');
        return false;
    }

    let final_answer = confirm('정말 탈퇴하시겠습니까?');

    if(!final_answer) {
        alert('회원탈퇴가 취소되었습니다.');
        return false;
    }
    
    alert('회원탈퇴가 완료되었습니다.');
});










