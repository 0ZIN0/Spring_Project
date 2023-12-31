// 문의사항 게시판 상세보기
$(".board").on('click.board_show', function(e) {		
	$(this).find('.board_detail').toggleClass('show');		
});

// 이미지 확대 관련 js
$(".myImg").on('click', function(e) {
	$(this).parent().next().show();
	$("body").css('overflow', 'hidden');
	e.stopPropagation();
	console.log($(this).parent());
});

$(".close").on('click', function(e) {
	$(this).parent().hide();
	$("body").css('overflow', 'unset');
	e.stopPropagation();
	console.log($(this).parent());
});

// 텍스트입력란 클릭시 접히지 않게 설정
$(".textarea").on('click', function(e) {
	e.stopPropagation();
	$(this).off('click.board_show');

});

// 답변관련
$(".answer").on('click', function(e) {
	$(this).off('click.board_show');
	$(this).parent().next().find('.admin_answer').css('max-height', '100vh');	
	e.stopPropagation();
});

$(".cancle_btn").on('click', function(e) {
	$(this).off('click.board_show');	
	$(this).parent().closest('.admin_answer').css('max-height', '0px');		
	e.stopPropagation();		
});
// 답변수정
$(".cancle").on('click', function(e) {
	e.stopPropagation();
	$(this).off('click.board_show');
	$(this).parent().parent().css('max-height', '0px');	
	$(this).parent().parent().prev().css('max-height', '100vh');	
});

$(".answer_edit").on('click', function(e) {
	e.stopPropagation();
	$(this).off('click.board_show');
	$(this).parent().next().find('.admin_answer').css('max-height', '0px');
	$(this).parent().next().find('.admin_edit').css('max-height', '100vh');
});
			