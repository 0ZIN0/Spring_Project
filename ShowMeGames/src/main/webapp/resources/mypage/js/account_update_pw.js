let chkPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$/;

// 비밀번호 유효성 체크
let validPwd = 0;

// 비밀번호 입력 칸 기능
$('#pw_input').change(function() {  

    validPwd = 0;
    $('#pw_chk_input').val('');

    let input = $('#pw_input');
    let pw_text = $(input).val();
    let span = $('#pw_span');

    if(!pw_text) {
        $(span).hide();
        $(input).css("border-color", "#808080");
        return;
    }

    if(!chkPwd.test(pw_text)) {
        $(span).css("color", "red");
        $(span).text("비밀번호가 규정에 맞지 않습니다.");
        $(span).show();
        $(input).css("border-color", "red");
        return;
    }

    // ajax로 기존 비밀번호와 대조함
    $.post('./pwd_dupl_chk',
    {user_num: Number($('#input_user_num').data('user_num')), user_pw: pw_text}
    , function(data) {
        let dupl_chk = data;       
    
        if(dupl_chk != 'N') {
            $(span).css("color", "red");
            $(span).text("기존 비밀번호와 같은 비밀번호입니다.");
            $(span).show();
            $(input).css("border-color", "red");
            return;
        }
    
        $(span).css("color", "green");
        $(span).show();
        $(span).text("규정에 맞는 비밀번호입니다.");
        $(input).css("border-color", "green");
    }).fail(function() {
        alert('서버 통신 중 오류가 발생했습니다.');
    });
});



// 비밀번호 확인 칸 기능
$('#pw_chk_input').change(function() {

    validPwd = 0;

    let pw_text = $(this).val();
    let span = $('#pw_chk_span');

    if(!pw_text) {
        $(span).hide();
        $(this).css("border-color", "#808080");
        return;
    }

    if(pw_text != $('#pw_input').val()) {
        $(span).css("color", "red");
        $(span).text("비밀번호가 일치하지 않습니다.");
        $(span).show();
        $(this).css("border-color", "red");
        return;
    }

    $(span).css("color", "green");
    $(span).show();
    $(span).text("비밀번호와 일치합니다.");
    $(this).css("border-color", "green");

    validPwd = 1;
});

// 제출 기능
$('#form_pwd_update').submit(function() {
    if(validPwd !== 1) {
        alert('비밀번호를 확인해주세요.');
        return false;
    }
});

// 취소버튼 기능
$('#pw_update_cancel_btn').click(function() {
    location.href('./security');
});
