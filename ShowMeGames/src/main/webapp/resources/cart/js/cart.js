// refund btn click event
$('#refund-btn').click(function (e) {
    $('#refund-popup').show();
    $('body').css({ 'overflow': 'hidden', 'height': '100%' });
});

$('#refund-close-btn').click(function (e) {
    $('#refund-popup').hide();
    $('body').css({ 'overflow': 'visible', 'height': '100%' });
});


// checkout api
$("#check-out-btn").click(function (e) {

    IMP.init('imp10327314');

    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "2",   // 주문번호
        name: "카트라이더",   // 상품명
        amount: 1,                         // 숫자 타입 (가격)
        buyer_email: "gildong@gmail.com", // 회원 아이디
        buyer_name: "홍길동", // 회원 실제 이름
        buyer_tel: "010-4242-4242", // 전화번호
        buyer_addr: "서울특별시 강남구 신사동",  // null로도 테스트가 되는지 체크
        buyer_postcode: "12345"
    }, function (rsp) { // callback
        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        console.log(rsp);
    });
});

// platform select active 
$('.options-ok').click(function (e) {
    const options = "#" + $('.options-ok').data('game');
    $(options).css('display', 'grid');
});

$('html').click(function (e) {
    console.log($(e.target));
    if (!$(e.target).hasClass("options-ok")) {
        $('.plat-form-options').hide();
    }
});

const options = $('.option');
options.click(function (e) {
    if ($(e.target).hasClass("PC")) {
        $('#platform-view').text("PC");
        options.css('background-color', 'transparent');
        $('.PC').css('background-color', '#35C1CF4D');
    } else if ($(e.target).hasClass("Xbox")) {
        $('#platform-view').text("Xbox");
        options.css('background-color', 'transparent');
        $('.Xbox').css('background-color', '#35C1CF4D');
    } else {
        $('#platform-view').text("PlayStation");
        options.css('background-color', 'transparent');
        $('.PlayStation').css('background-color', '#35C1CF4D');
    }
});

// cart-list delete
$('.cart-delete').click(function (e) {
    const game_id = {
        game_id: e.target.dataset.gameid,
    };
    $.ajax({
        url: `./cart-delete?game_id=./cart-delete?game_id=${e.target.dataset.gameid}`,
        method: 'GET',
        dataType: 'json',
        success: () => {
            console.log('ajax put xhreq success');
        }
    })
});