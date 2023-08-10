$(".board").on('click', function(e) {		
	$(this).find('.board_detail').toggleClass('show');	
});

$(".myImg").on('click', function(e) {
	$(this).find('.modal').css('display', 'block');
});

$(".close").on('click', function(e) {
	$(this).find('.modal').css('display', 'none');
});

