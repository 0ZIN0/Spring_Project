const page_name = $("#pagingDiv").data('id');

$('.page_btn').click(function() {
    let page = $(this).data('page');
    location.href=`./${page_name}?page=${page}`;
});

$('.navi_btn').click(function() {
    let page = $(this).data('page');
    location.href=`./${page_name}?page=${page}`;
});