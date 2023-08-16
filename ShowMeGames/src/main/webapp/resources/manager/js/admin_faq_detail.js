// delete btn click event
$('#delete-btn').click(function (e) {
  $('#delete-popup').show();
  $('body').css({ 'overflow': 'hidden', 'height': '100%' });
});

$('#delete-close-btn').click(function (e) {
  $('#delete-popup').hide();
  $('body').css({ 'overflow': 'visible', 'height': '100%' });
});
