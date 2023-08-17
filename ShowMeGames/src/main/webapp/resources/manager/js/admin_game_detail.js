let game_id = $('main').data('id');

// 수정 버튼
$('#admin_update_btn').click(function() {
    location.href = `./admin_game_update?game_id=${game_id}`;
});

// 목록 버튼
$('#admin_cancel_btn').click(function() {
    window.history.back();
});

$('#game_delete_btn').click(function() {
    let result = confirm('정말 이 게임을 데이터베이스에서 삭제하시겠습니까? \n결정은 되돌릴 수 없습니다.');
    
    if(!result) return;

    location.href = `./admin_game_delete?game_id=${game_id}`;
});

// 상세페이지 설정 버튼
const layout = $('#game_layout_btn').data('layout');
$('#game_layout_btn').click(function() {
    location.href = `./admin_game_layout?game_id=${game_id}&&layout=${layout}`;
});

