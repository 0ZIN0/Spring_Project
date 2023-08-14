let chkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let chkName = /^[가-힣]{2,13}$/;
let chkPhone = /^010-\d{4}-\d{4}$/
let chkNick = /^[가-힣a-zA-Z0-9_-]{3,15}$/


// 변경 버튼 누를 시 
$('#form_nickname_update').submit(function() {

    if(!chkNick.test($('#username').val())) {
        alert('닉네임이 규정에 맞지 않습니다');
        $('#username').focus();
        return false;
    }

});


// 개인정보 변경 버튼 눌렀을 때
$('#form_userinfo_update').submit(function() {

    if (!chkEmail.test($('#user_id').val())) {
        alert('이메일확인');
        $('#user_id').focus();
        return false;
    }

    if (!chkName.test($('#user_name').val())) {
        alert('이름확인');
        $('#user_name').focus();
        return false;
    }

    if (!chkPhone.test($('#phone_number').val())) {
        alert('전화번호확인');
        $('#phone_number').focus();
        return false;
    }

    // 변경 완료 메시지
    alert('개인정보가 변경되었습니다.');
});


// 취소 버튼 클릭 시 admin_user 페이지로 이동
$('#userinfo_cancel_btn').click(function() {
    window.location.href = '/smg/admin/manage/admin_user'; // 변경할 URL을 여기에 입력
});