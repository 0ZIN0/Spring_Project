let chkNick = /^[가-힣a-zA-Z0-9_-]{3,15}$/

// birth 나타나게 하기
$('#birth_input').css('opacity', 1);

// input 포커스 됐을 때 (공통)
$('.reg_input').focus(function() {
    $(this).closest('.reg_input_div').next('.confirm_div').hide();

    if($(this).val() != false) {
        $(this).closest('.reg_input_div').removeClass('unvalid');
        $(this).closest('.reg_input_div').removeClass('valid');
    }

    $(this).parent().prev('.reg_input_header').addClass('focused');

});

$('#reg_input_nick').blur(function() {
    if(!$(this).val()) {
        $(this).parent().prev('.reg_input_header').removeClass('focused');
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('닉네임을 입력하세요');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    };

    if(!chkNick.test($(this).val())) {
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('닉네임이 형식에 맞지 않습니다.');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    }

    $(this).closest('.reg_input_div').addClass('valid');
});

// 규정 부분 동작 설정
$('.accordion').click(function() {
    $(this).toggleClass('active');

    if($(this).next('.acc_panel').css('display') == 'block') {
        $(this).next('.acc_panel').hide();
    } else {
        $(this).next('.acc_panel').show();
    }
});

// 가입 버튼 누를시 동작 설정
$('#signup').submit(function() {

    if(!$("#reg_input_nick").closest('.reg_input_div').hasClass('valid')) {
        alert('닉네임 확인');
        $('#reg_input_nick').focus();
        return false;
    }

    if(!$("#terms_agree").prop('checked')){
        alert("약관에 동의해주세요");
        $("#terms_agree").focus();
        return false;
    }

    confirm('회원가입에 성공했습니다. 로그인해주세요.');
});