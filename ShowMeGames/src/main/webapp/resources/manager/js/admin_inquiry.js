$(".board").on('click', function(e) {		
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
