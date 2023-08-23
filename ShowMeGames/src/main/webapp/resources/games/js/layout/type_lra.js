const infoBtn = $('#tab_game_info_div');
const comBtn = $('#tab_game_comment_div');
const reqBtn = $('#tab_game_req_div');

const infoDiv = $('#game_detail_info_div');
const comDiv = $('#game_detail_comment_div');
const reqDiv = $('#game_detail_req_div');

infoDiv.css('display', 'flex');
comDiv.css('display', 'none');
reqDiv.css('display', 'none');

infoBtn.click(function (e) {
    if (!infoBtn.hasClass('tab_selected')) {
        comBtn.removeClass('tab_selected');
        reqBtn.removeClass('tab_selected');
        infoBtn.addClass('tab_selected');

        infoDiv.css('display', 'flex');
        comDiv.css('display', 'none');
        reqDiv.css('display', 'none');
    }
});

comBtn.click(function (e) {
    if (!comBtn.hasClass('tab_selected')) {
        infoBtn.removeClass('tab_selected');
        reqBtn.removeClass('tab_selected');
        comBtn.addClass('tab_selected');

        comDiv.css('display', 'flex');
        infoDiv.css('display', 'none');
        reqDiv.css('display', 'none');
    }
});

reqBtn.click(function (e) {
    if (!reqBtn.hasClass('tab_selected')) {
        comBtn.removeClass('tab_selected');
        infoBtn.removeClass('tab_selected');
        reqBtn.addClass('tab_selected');

        reqDiv.css('display', 'block');
        infoDiv.css('display', 'none');
        comDiv.css('display', 'none');
    }
});

$("#play-btn").on("click",function(){
    $('html, body').animate({
    scrollTop : 120
    },400)
    return false;
});