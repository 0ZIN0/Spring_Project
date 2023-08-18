
// dropdown 기능
let subToggle=true;
$("#system_detail_btn").click(()=>{
  if(subToggle){
    $("#system_dropdown_wrapper").slideDown(200);
    $('#dropdown_icon').css('transform', 'scaleY(-1)');
  }else{
    $("#system_dropdown_wrapper").slideUp(200);
    $('#dropdown_icon').css('transform', '');
  }
  subToggle=!subToggle;
});

// comment 기능
const gab = $('#game_detail_comment_div').data('gab') + "";
console.log(gab);
if (gab.includes('/')) {
    const gabStr = $('#game_detail_comment_div').data('gab').split('/');
    const statusStr = $('#game_detail_comment_div').data('status').split('/');
    
    let i = 0;
    gabStr.forEach(function(gab) {
        if (statusStr[i] == 'G') {
            $(`.good-${gab}`).addClass('good_select');
        } else if (statusStr[i] == 'B') {
            $(`.bad-${gab}`).addClass('good_select');
        }
        ++i;
    });
} else {
    const status =  $('#game_detail_comment_div').data('status');
    if (status == 'G') {
        $(`.good-${gab}`).addClass('good_select');
    } else if (status == 'B') {
        $(`.bad-${gab}`).addClass('good_select');
    }
}


// comment btn
const upBtn = $('.up_btn');
const downBtn = $('.down_btn');

upBtn.click(function (e) {
    const targetDiv =  $(e.target);
    const comment_id = $(e.target).data('id');
    $.ajax({
        url : `./comment-good`,
        type : 'PUT',
        data : JSON.stringify(comment_id),
        contentType : 'application/json;charset=utf-8',
        dataType : 'json',
        success : function(res) {
            console.log(res);
            if (res[0] == 1) {
                console.log("1번도착");
                $(`.good-${comment_id}`).addClass('good_select');
                $(`.g-${comment_id}`).text(res[1]);
            } else if (res[0] == 2) {
                console.log("2번도착");
                $(`.good-${comment_id}`).removeClass('good_select');
                $(`.g-${comment_id}`).text(res[1]);
            } else if (res[0] == 3) {
                console.log("3번도착");
                alert("\'싫어요\'한 리뷰입니다.\n취소 후 수정해주세요.");
            } else { 
                console.log("0번도착");
                openLoginPopup();
            }
        }
    });
});

downBtn.click(function (e) {
    const targetDiv =  $(e.target);
    const comment_id = $(e.target).data('id');
    $.ajax({
        url : `./comment-bad`,
        type : 'PUT',
        data : JSON.stringify(comment_id),
        contentType : 'application/json;charset=utf-8',
        dataType : 'json',
        success : function(res) {
            if (res[0] == 1) {
                $(`.bad-${comment_id}`).addClass('good_select');
                $(`.b-${comment_id}`).text(res[1]);
            } else if (res[0] == 2) {
                $(`.bad-${comment_id}`).removeClass('good_select');
                $(`.b-${comment_id}`).text(res[1]);
            } else if (res[0] == 3) {
                alert("\'좋아요\'한 리뷰입니다.\n취소 후 수정해주세요.");
            } else {  
                openLoginPopup();
            }
        }
    });
});

var loginPopup = null; // 전역 변수로 팝업 창을 저장하는 변수 선언

function openLoginPopup() {
  if (loginPopup && !loginPopup.closed) {
    // 이미 팝업이 열려있으면 해당 팝업에 포커스를 줌
    loginPopup.focus();
  } else {
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;
    var popupWidth = 480;
    var popupHeight = 800;

    var left = (screenWidth - popupWidth) / 2;
    var top = (screenHeight - popupHeight) / 2;

    var popupFeatures =
      "width=" +
      popupWidth +
      ",height=" +
      popupHeight +
      ",left=" +
      left +
      ",top=" +
      top;

    // 새로운 팝업을 열고, loginPopup 변수에 할당하여 저장
    loginPopup = window.open("/smg/member/login", "_blank", popupFeatures);
  }
}

// my comment 기능
const myComUpdateBtn = $('#my_com_update_btn');
const myComDeleteBtn = $('#my_com_delete_btn');

const game = myComDeleteBtn.data('game');
const layout = myComDeleteBtn.data('layout');
const content = myComDeleteBtn.data('content');
const comment_id = myComDeleteBtn.data('comid');

myComUpdateBtn.click(function (e) {
    $('.my_com_content').remove();
    $('.my_com_gab_div').remove();
    $('#my_com_btns_div').remove();
    $('.my_com_div_right').append(`
        <input type="hidden" name="comment_id" value="${comment_id}" />
        <textarea id="input_comment_content"
        name="comment_content" placeholder="리뷰를 작성하세요.">${content}</textarea>
    `);
});

myComDeleteBtn.click(function (e) {
    if (confirm("리뷰를 삭제하시겠습니까?") == true){
        location.href = `./detail?game=${game}&&layout=${layout}`;
      }else{
        console.log("취소되었습니다");
      }
});