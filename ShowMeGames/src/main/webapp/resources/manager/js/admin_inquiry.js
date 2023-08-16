// 문의사항 게시판 상세보기
$(".board").on('click.board_show', function(e) {		
	$(this).find('.board_detail').toggleClass('show');		
});

// 이미지 확대 관련 js
$(".myImg").on('click', function(e) {
	$(this).parent().next().show();
	e.stopPropagation();
	console.log($(this).parent());
});

$(".close").on('click', function(e) {
	$(this).parent().hide();
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
	$(this).parent().next().find('.admin_answer').toggleClass('paddingTopBottom');
	e.stopPropagation();
	console.log($(this).parent().next().find('.admin_answer'));
});

$(".cancle_btn").on('click', function(e) {
	$(this).off('click.board_show');	
	$(this).parent().closest('.admin_answer').css('max-height', '0px');	
	$(this).parent().closest('.paddingTopBottom').css({'padding-bottom':'0px', 'padding-top':'0px'});
	e.stopPropagation();	
	console.log($(this).parent().parent().find('.admin_answer'));
});

$(".cancle").on('click', function(e) {
	$(this).off('click.board_show');
	e.stopPropagation();
	$(this).parent().parent().find('.answer_detail').css('max-height', '100vh');
	$(this).parent().parent().find('.admin_edit').css('max-height', '0px');
	console.log($(this).parent().parent().find('.admin_edit'));
	console.log($(this).parent().parent().find('.answer_detail'));
});

$(".answer_edit").on('click', function(e) {
	e.stopPropagation();
	$(this).off('click.board_show');
	$(this).parent().next().find('.answer_detail').css('max-height', '0px');
	$(this).parent().next().find('.admin_edit').css('max-height', '100vh');
});
