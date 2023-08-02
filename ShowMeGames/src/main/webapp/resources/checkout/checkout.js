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
$('#post-num-regex').hide();

first_name.keydown(function (e) {
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

last_name.keydown(function (e) {
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

address.keydown(function (e) {
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

post_num.keydown(function (e) {
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

first_name.blur(function (e) {
    if (first_name.val() == "") {
        $('#first-name-p').show();
        first_name.addClass('input-none');
        first_name.removeClass('input-ok');
    }
});

last_name.blur(function (e) {
    if (last_name.val() == "") {
        $('#last-name-p').show();
        last_name.addClass('input-none');
        last_name.removeClass('input-ok');
    }
});

address.blur(function (e) {
    if (address.val() == "") {
        $('#address-p').show();
        address.addClass('input-none');
        address.removeClass('input-ok');
    }
});

let is_post_ok = false;

post_num.blur(function (e) {
    if (post_num.val() == "") {
        $('#post-num-p').show();
        post_num.addClass('input-none');
        post_num.removeClass('input-ok');
    }
    let regex = /[0-6][0-3]\d{3}/;
    if (!regex.test(post_num.val())) {
        $('#post-num-regex').show();
        is_post_ok = false;
    } else {
        $('#post-num-regex').hide();
        is_post_ok = true;
    }
});

//point js
function inputNumberOnly(el) {
    let havePointVal = $('#have-unit').data('haveunit');
    el.value = el.value.replace(/[^0-9]/g, '');
    if (havePointVal < 1000) {
        el.value = el.value.replace(/./, '');
    }
}