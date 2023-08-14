$(".board").on('click.board_show', function(e) {		
	$(this).find('.board_detail').toggleClass('show');		
});

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

$(".textarea").on('click', function(e) {
	e.stopPropagation();
	$(this).off('click.board_show');

});

$(".answer").on('click', function(e) {
	$(this).off('click.board_show');
	$(this).parent().next().find('.admin_answer').css('max-height', '100vh');
	e.stopPropagation();
	console.log($(this).parent().next().find('.admin_answer'));
});

$(".cancle_btn").on('click', function(e) {
	$(this).off('click.board_show');
	$(this).parent().closest('.admin_answer').css('max-height', '0px');
	e.stopPropagation();
	console.log($(this).parent().closest('.admin_answer'));
});