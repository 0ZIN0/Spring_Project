// refund btn click event
$('#refund-btn').click(function (e) {
    $('#refund-popup').show();
    $('body').css({ 'overflow': 'hidden', 'height': '100%' });
});

$('#refund-close-btn').click(function (e) {
    $('#refund-popup').hide();
    $('body').css({ 'overflow': 'visible', 'height': '100%' });
});


// checkout-cart-bottom active
$('#checkout-cart-bottom').click(function (e) {
    if ($('#checkout-cart-mid').hasClass('display-none')) {
        $('#checkout-cart-mid').removeClass('display-none');
        $('#checkout-cart-mid').addClass('display-flex');
        $('.expand_more').addClass('expand_more-active');
    } else {
        $('#checkout-cart-mid').addClass('display-none');
        $('#checkout-cart-mid').removeClass('display-flex');
        $('.expand_more').removeClass('expand_more-active');
    }
});

// input
$(document).ready(function () {
    $('#first-name').focus();
});

const first_name = $('#first-name');
const last_name = $('#last-name');
const address = $('#address');
const post_num = $('#post-num');

$('#first-name-p').hide();
$('#last-name-p').hide();
$('#address-p').hide();
$('#post-num-p').hide();

first_name.keydown(function(e) {
    if (first_name.val() == "") {
        console.log('비어있음');
        $('#first-name-p').show();
        first_name.addClass('input-none');
        first_name.removeClass('input-ok');
    } else {
        console.log("있다");
        $('#first-name-p').hide();
        first_name.removeClass('input-none');
        first_name.addClass('input-ok');
    }
});

last_name.keydown(function(e) {
    if (last_name.val() == "") {
        console.log('비어있음');
        $('#last-name-p').show();
        last_name.addClass('input-none');
        last_name.removeClass('input-ok');
    } else {
        console.log("있다");
        $('#last-name-p').hide();
        last_name.removeClass('input-none');
        last_name.addClass('input-ok');
    }
});

address.keydown(function(e) {
    if (address.val() == "") {
        console.log('비어있음');
        $('#address-p').show();
        address.addClass('input-none');
        address.removeClass('input-ok');
    } else {
        console.log("있다");
        $('#address-p').hide();
        address.removeClass('input-none');
        address.addClass('input-ok');
    }
});

post_num.keydown(function(e) {
    if (post_num.val() == "") {
        console.log('비어있음');
        $('#post-num-p').show();
        post_num.addClass('input-none');
        post_num.removeClass('input-ok');
    } else {
        console.log("있다");
        $('#post-num-p').hide();
        post_num.removeClass('input-none');
        post_num.addClass('input-ok');
    }
});


$('html').click(function (e) {

    if (first_name.val() == "") {
        $('#first-name-p').show();
        first_name.addClass('input-none');
        first_name.removeClass('input-ok');
    }
    if (last_name.val() == "") {
        $('#last-name-p').show();
        last_name.addClass('input-none');
        last_name.removeClass('input-ok');
    }
    if (address.val() == "") {
        $('#address-p').show();
        address.addClass('input-none');
        address.removeClass('input-ok');
    }
    if (post_num.val() == "") {
        $('#post-num-p').show();
        post_num.addClass('input-none');
        post_num.removeClass('input-ok');
    }
});

// checkout api
$("#check-out-btn").click(function (e) {

    if ($('checkout-input-form').hasClass('input-none')) {
        return;
    }
    
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
