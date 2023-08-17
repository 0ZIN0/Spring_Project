const game_id = $('main').data('id');

// 업데이트 하지 않고 나갈 때 확인창
let checkUnload = true;
$(window).on("beforeunload", function(){
    if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
});

// 뒤로가기 버튼
$('.back').click(function() {
    location.href=`./admin_game_detail?game_id=${game_id}`;
});

// 등록 버튼 눌렀을 때
$('#form_layout').submit(function() {
    checkUnload = false;
});