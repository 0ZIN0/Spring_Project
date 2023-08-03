let chkPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$/;

// 비밀번호 입력 칸 기능
$('#pw_input').change(function() {  

    let pw_text = $(this).val();

    let span = $('#pw_span');

    if(!pw_text) {
        $(span).hide();
        $(this).css("border-color", "#808080");
        return;
    }

    if(!chkPwd.test(pw_text)) {
        $(span).css("color", "red");
        $(span).text("비밀번호가 규정에 맞지 않습니다.");
        $(span).show();
        $(this).css("border-color", "red");
        return;
    }

    $(span).css("color", "green");
    $(span).show();
    $(span).text("규정에 맞는 비밀번호입니다.");
    $(this).css("border-color", "green");
});

// 비밀번호 확인 칸 기능
$('#pw_chk_input').change(function() {
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
});

// 취소버튼 기능
$('#pw_update_cancel_btn').click(function() {
    location.href('./security');
});
