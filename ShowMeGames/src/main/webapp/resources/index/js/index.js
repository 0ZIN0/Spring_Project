// 스크롤 이동 버튼

$('#editer-next-button').on('click', () => {
	$('.editer-container').scrollLeft($('.editer-container').scrollLeft() + 1600);	
});
$('#editer-prev-button').on('click', () => {
	$('.editer-container').scrollLeft($('.editer-container').scrollLeft() - 1600);	
});

// 스크롤이 멈췄을 때 버튼 숨김
$('.editer-container').scroll(() => {
	var Top = $('.editer-container').scrollLeft();
	var Width = $('.editer-container').width();
	
	clearTimeout($.data(this, 'scrollTimer'));
	
	$.data(this, 'scrollTimer', setTimeout(() => {
		
		if (top <= 1700) {
			$('#editer-next-button').css({
				'visibility': 'hidden'
			});
		} else if (Top <= 30) {
			$('#editer-prev-button').css({
				'visibility': 'hidden'
			});
		} else {
			$('#editer-next-button').css({
				'visibility': 'visible'
			});
			$('#editer-prev-button').css({
				'visibility': 'visible'
			});
		}	
	}, 50));
});



$('#cms-next-button').on('click', () => {
	$('.cms-container').scrollLeft($('.cms-container').scrollLeft() + 1600);	
});
$('#cms-prev-button').on('click', () => {
	$('.cms-container').scrollLeft($('.cms-container').scrollLeft() - 1600);	
});

$('.cms-container').scroll(() => {
	var Top = $('.cms-container').scrollLeft();
	var Width = $('.cms-container').width();	
	
	clearTimeout($.data(this, 'scrollTimer'));
	
	$.data(this, 'scrollTimer', setTimeout(() => {
		if ((Width - Top) <= 50) {
			$('#cms-next-button').css({
				'visibility': 'hidden'
			});
		} else if (Top <= 30) {
			$('#cms-prev-button').css({
				'visibility': 'hidden'
			});
		} else {
			$('#cms-next-button').css({
				'visibility': 'visible'
			});
			$('#cms-prev-button').css({
				'visibility': 'visible'
			});
		}		
	}, 50));
});
