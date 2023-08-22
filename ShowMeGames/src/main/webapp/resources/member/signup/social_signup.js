let chkNick = /^[가-힣a-zA-Z0-9_-]{3,15}$/
let chkPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$/;

let chkKorean = /^.*[가-힣].*$/;
let koreanRegex = /^[가-힣]$/;

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

const MAX_BYTE = 20;
let present_byte = 0;
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
            $(this).closest('.reg_input_div').addClass('unvalid');
            $(this).closest('.reg_input_div').next('.confirm_div').text('닉네임이 너무 깁니다.');
            $(this).closest('.reg_input_div').next('.confirm_div').show();
            return false;
        }
    }

    $(this).closest('.reg_input_div').addClass('valid');
});

// 비밀번호 검사
$('#reg_input_pwd').blur(function() {
    if(!$(this).val()) {
        $(this).parent().prev('.reg_input_header').removeClass('focused');
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('패스워드를 입력하세요');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    };

    if(!chkPwd.test($(this).val())) {
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('패스워드가 형식에 맞지 않습니다.');
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

    if(!$("#reg_input_pwd").closest('.reg_input_div').hasClass('valid')) {
        alert('비밀번호확인');
        $('#reg_input_pwd').focus();
        return false;
    }

    if(!$("#terms_agree").prop('checked')){
        alert("약관에 동의해주세요");
        $("#terms_agree").focus();
        return false;
    }

    confirm('회원가입에 성공했습니다. 로그인해주세요.');
});