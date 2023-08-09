$('.page_btn').click(function() {
    let page = $(this).data('page');
    location.href=`./admin_game?page=${page}`;
});

$('.navi_btn').click(function() {
    let page = $(this).data('page');
    location.href=`./admin_game?page=${page}`;
});
