// refund btn click event
$('#refund-btn').click(function (e) {
    $('#refund-popup').show();
    $('body').css({'overflow':'hidden', 'height':'100%'});
});

$('#refund-close-btn').click(function (e) {
    $('#refund-popup').hide();
    $('body').css({'overflow':'visible', 'height':'100%'});
});