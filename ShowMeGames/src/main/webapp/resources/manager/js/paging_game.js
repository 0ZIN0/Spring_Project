// 검색창 분류 선택 시
const input_search = $('#input_search');

$("#select_search").change(function() {
    if($(this).val() == 'game_id') {
        $(input_search).attr('type', 'number');
    } else {
        $(input_search).attr('type', 'text');
    }
})

// 추가 버튼 누를 시
$('#game_add_btn').click(function() {
    location.href='./admin_game_add';
});

// DOM 구성 완료 후
$(document).ready(function() {

    const page_name = $("#pagingDiv").data('id');
    const param_type = $("#pagingDiv").data('type');
    const param_key = $("#pagingDiv").data('key');
    
    if(param_type != false) {
        $('#select_search').val(param_type).prop("selected", true);
        if(param_type != 'game_id') {
            $(input_search).attr('type', 'text');
        }
        $('#input_search').val(param_key);
            
        $('.page_btn').click(function() {
            let page = $(this).data('page');
            location.href=`./${page_name}?page=${page}&&type=${param_type}&&key=${param_key}`;
        });
        $('.navi_btn').click(function() {
            let page = $(this).data('page');
            location.href=`./${page_name}?page=${page}&&type=${param_type}&&key=${param_key}`;
        });
    } else {
        $('.page_btn').click(function() {
            let page = $(this).data('page');
            location.href=`./${page_name}?page=${page}`;
        });
        $('.navi_btn').click(function() {
            let page = $(this).data('page');
            location.href=`./${page_name}?page=${page}`;
        });
    }

});
