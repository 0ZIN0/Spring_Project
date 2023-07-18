// 에디터 버튼 

$('#editer-next-button').on('click', function() {
	$('.editer-container').scrollLeft($('.editer-container').scrollLeft() + 1600);
	if ($('.editer-container').scrollLeft() >= 1700) {
		$('#editer-next-button').css({
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
	console.log($('.editer-container').scrollLeft());
});

$('#editer-prev-button').on('click', function() {
	$('.editer-container').scrollLeft($('.editer-container').scrollLeft() - 1600);
	if ($('.editer-container').scrollLeft() <= 50) {
		$('#editer-prev-button').css({
			'visibility': 'hidden'
		});
	} else {
		$('#editer-prev-button').css({
			'visibility': 'visible'
		});
		$('#editer-next-button').css({
			'visibility': 'visible'
		});
	}
});


$('#cms-next-button').on('click', function() {
	$('.cms-container').scrollLeft($('.cms-container').scrollLeft() + 1600);
	if ($('.cms-container').scrollLeft() >= 3000) {
		$('#cms-next-button').css({
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
	console.log($('.cms-container').scrollLeft());
});
$('#cms-prev-button').on('click', function() {
	$('.cms-container').scrollLeft($('.cms-container').scrollLeft() - 1600);
	if ($('.cms-container').scrollLeft() <= 50) {
		$('#cms-prev-button').css({
			'visibility': 'hidden'
		});
	} else {
		$('#cms-prev-button').css({
			'visibility': 'visible'
		});
		$('#cms-next-button').css({
			'visibility': 'visible'
		});
	}
	console.log("먹히냐");
});
