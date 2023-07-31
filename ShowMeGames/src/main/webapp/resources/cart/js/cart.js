// refund btn click event
$('#refund-btn').click(function (e) {
    $('#refund-popup').show();
    $('body').css({ 'overflow': 'hidden', 'height': '100%' });
});

$('#refund-close-btn').click(function (e) {
    $('#refund-popup').hide();
    $('body').css({ 'overflow': 'visible', 'height': '100%' });
});

// platform select active 
$('.options-ok').click(function (e) {
    const options = "#" + e.target.dataset.game;
    $(options).addClass('display-grid');
});

$('html').click(function (e) {
    if (!$(e.target).hasClass(e.target.dataset.game)) {
        $('.plat-form-options').removeClass('display-grid');
    }
});

const options = $('.option');
options.click(function (e) {
    if ($(e.target).hasClass(e.target.dataset.platform)) {
        console.log(e.target.dataset.id);
        $('#platform-view-' + e.target.dataset.id).text(e.target.dataset.platform);
    }
});

// cart-list delete
$('.cart-delete').click(function (e) {
    $.ajax({
        url: `./cart-delete?game_id=${e.target.dataset.gameid}`,
        method: 'GET',
        success: () => {
            location.href = "./cart";
        }
    })
});