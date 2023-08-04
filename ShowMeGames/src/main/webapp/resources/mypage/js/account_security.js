function pwd_modal_cancel() {
    $('#pwd_update_modal').hide();
    $('body').css('overflow', 'auto');
}

$('#pwd_modal_open_btn').click(function() {
    $('#pwd_update_modal').show();
    $('body').css('overflow', 'hidden');
});

$('#modal_close').click(function() {
    pwd_modal_cancel();
});

$('#modal_close_btn').click(function() {
    pwd_modal_cancel();
})

$('#form_pwd_chk').submit(function() {
    if(!$('#pwd_chk_input').val()) {
        alert('비밀번호를 입력해주세요');
        $('#pwd_chk_input').focus();
        return false;
    }
});