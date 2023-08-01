$('#top_bar_account').click(function(e) {
	e.stopPropagation();
    $('#logout_button').toggleClass('active');
});

$('#logout_button').click(function(e) {
	e.stopPropagation();
});

$(document).click(function(){
    $('#logout_button').removeClass('active');
});