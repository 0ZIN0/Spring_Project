// 업데이트 하지 않고 나갈 때 확인창
let checkUnload = true;
$(window).on("beforeunload", function(){
    if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
});

// 뒤로가기, 취소버튼 기능
const game_id = $('main').data('id');

function back_btn() {
    location.href = `./admin_game_detail?game_id=${game_id}`;
}
$('.btn.cancel').click(back_btn);

// 폼 제출 될 때 
$('#game_update_form').submit(function() {
    checkUnload = false;
});