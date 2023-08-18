// comment 기능
const gab = $('#game_detail_comment_div').data('gab') + "";
console.log(gab);
if (gab.includes('/')) {
    const gabStr = $('#game_detail_comment_div').data('gab').split('/');
    const statusStr = $('#game_detail_comment_div').data('status').split('/');

    let i = 0;
    gabStr.forEach(function (gab) {
        if (statusStr[i] == 'G') {
            $(`.good-${gab}`).addClass('good_select');
        } else if (statusStr[i] == 'B') {
            $(`.bad-${gab}`).addClass('good_select');
        }
        ++i;
    });
} else {
    const status = $('#game_detail_comment_div').data('status');
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
    const targetDiv = $(e.target);
    const comment_id = $(e.target).data('id');
    $.ajax({
        url: `./comment-good`,
        type: 'PUT',
        data: JSON.stringify(comment_id),
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        success: function (res) {
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
    const targetDiv = $(e.target);
    const comment_id = $(e.target).data('id');
    $.ajax({
        url: `./comment-bad`,
        type: 'PUT',
        data: JSON.stringify(comment_id),
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        success: function (res) {
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
const comment_id = myComDeleteBtn.data('comid');

// delete
myComDeleteBtn.click(function (e) {
    if (confirm("리뷰를 삭제하시겠습니까?") == true) {
        $.ajax({
            url: `./delete_my_com`,
            type: 'PUT',
            data: JSON.stringify(comment_id),
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            success: function (res) {
                if (res == 1) {
                    alert("삭제되었습니다.");
                    location.href = `./detail?game=${game}&&layout=${layout}`;
                }
            }
        });
    } else {
        console.log("취소되었습니다");
    }
});

// add
$('#comment_submit_btn').click(function (e) {
    const content = $('#input_comment_content').val().trim();

    if (content !== '') {
        var result = {
            "grade" : $('#input_game_grade').val(),
            "comment_content" : content,
            "user_num" : $('#comment_submit_btn').data('user'),
            "game_id" : $('#comment_submit_btn').data('gameid'),
        }
        console.log(result);
        $.ajax({
            url: `./add_my_com`,
            type: 'POST',
            data: JSON.stringify(result, ['grade', 'comment_content', 'user_num', 'game_id']),
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            success: function (res) {
                if (res == 1) {
                    const game = $('#my_com_grid').data('game');
                    const layout = $('#my_com_grid').data('layout');
                    
                    alert("등록되었습니다.");
                    location.href = `./detail?game=${game}&&layout=${layout}`;
                }
            }
        });
    } else {
        alert('내용을 입력하세요.');
    }
});

// 별점 기능들
const my_com_id = $('#com_id_data').data('mycom');
let best_com_id = $('#com_id_data').data('bestcom') + "";
if (best_com_id.includes('/')) {
    best_com_id = $('#com_id_data').data('bestcom').split('/');

    best_com_id.forEach(function (com) {
        let best_star_span = $(`.starpoint_${com}`);
        let best_game_grade = $(`.input_game_grade_${com}`).val();
        console.log(`#best_starpoint_${com}`);
        function bestStarCal(game_grade) {
            best_star_span.css('width', `${100 * best_game_grade/5}%`);    
        }

        console.log("best_grade: "+ best_game_grade);
        bestStarCal(best_game_grade);
    });
} else {
    let best_star_span = $(`.starpoint_${best_com_id}`);
    let best_game_grade = $(`.input_game_grade_${best_com_id}`).val();

    function bestStarCal(game_grade) {
        best_star_span.css('width', `${100 * best_game_grade/5}%`);    
    }

    console.log("best_grade: "+ best_game_grade);
    bestStarCal(best_game_grade);
}

let new_com_id = $('#com_id_data').data('newcom') + "";
if (new_com_id.includes('/')) {
    new_com_id = $('#com_id_data').data('newcom').split('/');
    
    new_com_id.forEach(function (com) {
        let new_star_span = $(`.starpoint_${com}`);
        console.log(`#new_starpoint_${com}`);
        let new_game_grade = $(`.input_game_grade_${com}`).val();

        console.log("최신 리뷰 별점: " + new_game_grade);

        function newStarCal(game_grade) {
            new_star_span.css('width', `${100 * new_game_grade/5}%`);    
        }
        newStarCal(new_game_grade);
    });
} else {
    let new_star_span = $(`.starpoint_${new_com_id}`);
    let new_game_grade = $(`.input_game_grade_${new_com_id}`).val();
    
    console.log("최신 리뷰 별점: " + new_game_grade);

    function newStarCal(game_grade) {
        $(new_star_span).css('width', `${100 * new_game_grade/5}%`);    
    }
    newStarCal(new_game_grade);
}

console.log("my: " + my_com_id);
console.log("best: ", best_com_id);
console.log("new: ", new_com_id);

const my_star_span = $(`.starpoint_${my_com_id}`);
let my_game_grade = $(`.input_game_grade_${my_com_id}`).val();

// my 별점 표시 바꾸는 함수
function starCal(game_grade) {
    $(my_star_span).css('width', `${100 * my_game_grade/5}%`);
    console.log(`#my_starpoint_${my_com_id}`);    
}
starCal(my_game_grade);


const star_span = $('#starpoint');
let game_grade = $('#input_game_grade').val();

// 리뷰 작성할때
function writeStarCal(game_grade) {
    $(star_span).css('width', `${100 * game_grade/5}%`);    
}
writeStarCal(game_grade);

// 평점이 바뀔 때
$('#input_game_grade').change(function() {
    let val = $(this).val();

    if(val > 5) {
        val = 5;
        $(this).val(val);
    }
    if(val < 0) {
        val = 0;
        $(this).val(val);
    }

    starCal(val);
});

const drawStar = (target) => {
    if (target.value > 5) {
        target.value = 5;
    } else if (target.value < 0 || target.value == '') {
        target.value = 0;
    }

    $(star_span).css('width', `${100 * target.value/5}%`);
    console.log('반영: ', target.value);
    $('#input_game_grade').attr('value', target.value);
    $('#input_game_grade').val(target.value);
}