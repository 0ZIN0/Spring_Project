$(".board").on('click', function(e) {		
	$(this).find('.board_detail').toggleClass('show');	
});

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
