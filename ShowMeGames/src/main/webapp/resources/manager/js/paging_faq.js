const page_name = $("#pagingDiv").data('id');
const topic = $("#topicData").data('topic');

$('.page_btn').click(function() {
    let page = $(this).data('page');
    location.href=`./${page_name}?page=${page}&topic=${topic}`;
});

$('.navi_btn').click(function() {
    let page = $(this).data('page');
    location.href=`./${page_name}?page=${page}&topic=${topic}`;
});
