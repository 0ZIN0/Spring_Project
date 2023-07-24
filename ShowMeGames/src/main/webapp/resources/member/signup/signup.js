let chkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let chkPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$/;
let chkName = /^[가-힣]{2,13}$/;
let chkPhone = /^010-\d{4}-\d{4}$/
let chkNick = /^[가-힣a-zA-Z0-9_-]{3,15}$/

// 중복검사 유무
let chkEmailValid = 0;

$(document).ready(function(){
    window.resizeTo(560, 850);
});

// input 포커스 됐을 때 (공통)
$('.reg_input').focus(function() {
    $(this).closest('.reg_input_div').next('.confirm_div').hide();

    if($(this).val() != false) {
        $(this).closest('.reg_input_div').removeClass('unvalid');
        $(this).closest('.reg_input_div').removeClass('valid');
    }

    $(this).parent().prev('.reg_input_header').addClass('focused');

});

// 각 input 포커스아웃 됐을 때
$('#reg_input_id').blur(function() {
    if(!$(this).val()) {
        $(this).parent().prev('.reg_input_header').removeClass('focused');
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('이메일을 입력하세요');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    };

    if(!chkEmail.test($(this).val())) {
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('이메일이 형식에 맞지 않습니다.');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    }

    $(this).closest('.reg_input_div').addClass('valid');
});

// 이메일 값 변경시 중복검사여부 초기화
$('#reg_input_id').on('change', function() {
    chkEmailValid = 0;
});

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

$('#reg_input_name').blur(function() {
    if(!$(this).val()) {
        $(this).parent().prev('.reg_input_header').removeClass('focused');
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('이름을 입력하세요');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    };

    if(!chkName.test($(this).val())) {
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('이름이 형식에 맞지 않습니다.');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    }

    $(this).closest('.reg_input_div').addClass('valid');
});

$('#reg_input_phone').blur(function() {
    if(!$(this).val()) {
        $(this).parent().prev('.reg_input_header').removeClass('focused');
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('전화번호를 확인하세요');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    };

    if(!chkPhone.test($(this).val())) {
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').text('번호가 형식에 맞지 않습니다.');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    }

    $(this).closest('.reg_input_div').addClass('valid');
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

// 생년월일 동작 설정
$('#birth_header').on('click', function() {
    $(this).addClass('focused');
    $('#birth_input').css('opacity', 1);
    $('#birth_input').focus();
});

$('#birth_input').focus(function() {
    $(this).closest('.reg_input_div').next('.confirm_div').hide();
    $(this).prop('disabled', false);
    if($(this).val() != false) {
        $(this).closest('.reg_input_div').removeClass('unvalid');
        $(this).closest('.reg_input_div').removeClass('valid');
    }
});

$('#birth_input').blur(function() {
    if($(this).val() == false) {
        $('#birth_input').css('opacity', 0);
        $(this).prop('disabled', true);
        $('#birth_header').removeClass('focused');
        $(this).closest('.reg_input_div').addClass('unvalid');
        $(this).closest('.reg_input_div').next('.confirm_div').show();
        return;
    } 
    
    $(this).closest('.reg_input_div').removeClass('unvalid');
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

$('#email-accDiv > .accordion').click(function() {
    $(this).toggleClass('active');

    if($(this).parent().next('.acc_panel').css('display') == 'block') {
        $(this).parent().next('.acc_panel').hide();
    } else {
        $(this).parent().next('.acc_panel').show();
    }
})

// 이메일 중복체크 기능
$('#email-chkBtn').click(function() {
    let userId = $('#reg_input_id').val();

    $.ajax({
        url : "./checkEmail",
        type : "GET",
        data :  {userId: userId},
        datatype : 'json',
        success : function(result) {
            if(result == 0) {
                $('#email_input_div').removeClass('unvalid');
                $('#email_input_div').addClass('valid');
                $('#email_confirm').css('color', 'green');
                $('#email_confirm').text('사용할 수 있는 이메일.');
                $('#email_confirm').show();
                chkEmailValid = 1;
            } else {
                $('#email_input_div').removeClass('valid');
                $('#email_input_div').addClass('unvalid');
                $('#email_confirm').css('color', 'red');
                $('#email_confirm').text('중복된 이메일입니다.');
                $('#email_confirm').show();
            }
        },
        error : function() {
            alert("서버요청실패");
        }
    })
});

// 가입 버튼 누를시 동작 설정
$('#signup').submit(function() {

    if (!$("#reg_input_id").closest('.reg_input_div').hasClass('valid')) {
        alert('이메일확인');
        $('#reg_input_id').focus();
        return false;
    }

    if(chkEmailValid == 0) {
        alert('이메일 중복검사를 해주세요.');
        return false;
    }

    if(!$("#reg_input_pwd").closest('.reg_input_div').hasClass('valid')) {
        alert('비밀번호확인');
        $('#reg_input_pwd').focus();
        return false;
    }

    if(!$("#reg_input_phone").closest('.reg_input_div').hasClass('valid')) {
        alert('휴대전화 번호확인');
        $('#reg_input_phone').focus();
        return false;
    }

    if(!$("#reg_input_nick").closest('.reg_input_div').hasClass('valid')) {
        alert('닉네임 확인');
        $('#reg_input_nick').focus();
        return false;
    }

    if(!$("#birth_input").closest('.reg_input_div').hasClass('valid')) {
        alert('닉네임 확인');
        $('#birth_input').focus();
        return false;
    }

    if(!$("#terms_agree").prop('checked')){
        alert("약관에 동의해주세요");
        $("#terms_agree").focus();
        return false;
    }

    confirm('회원가입에 성공했습니다. 로그인해주세요.');
});
