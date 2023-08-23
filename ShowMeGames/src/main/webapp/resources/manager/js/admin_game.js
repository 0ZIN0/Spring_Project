// 파라미터에서 key, value 받아오기
$.urlParam = function(name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
        return null;
    } else {
        return results[1] || 0;
    }
}

let page = $.urlParam('page');
let type = $.urlParam('type');
let key = $.urlParam('key');

if(page == null) page = 1;
let prePageInfo = page;

if(type != null) {
    prePageInfo += '/' + type + '/' + key;
} 

$('.game_name_span').click(function() {
    let id = $(this).data('id');
    location.href = `./admin_game_detail?game_id=${id}&&prePageInfo=${prePageInfo}`;
});


