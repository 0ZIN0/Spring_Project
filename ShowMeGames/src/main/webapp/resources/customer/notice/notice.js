// notice sort select css active
var noticeSelectYear = $('#notice-year-select');
noticeSelectYear.on('click', (e) => {
    noticeSelectYear.addClass("select-click");
    noticeSelectYear.removeClass("select-none");
    noticeSelectDate.removeClass("select-click");
    noticeSelectDate.addClass("select-none");
});

var noticeSelectDate = $('#notice-date-select');
noticeSelectDate.on('click', (e) => {
    noticeSelectDate.addClass("select-click");
    noticeSelectDate.removeClass("select-none");
    noticeSelectYear.removeClass("select-click");
    noticeSelectYear.addClass("select-none");
});

$('html').click(function (e) {
    if (!$(e.target).hasClass("select-click")) {
        if (!$(e.target).hasClass("select-year")) {
            noticeSelectYear.addClass("select-none");
            noticeSelectYear.removeClass("select-click");
        }
        if (!$(e.target).hasClass("select-date")) {
            noticeSelectDate.addClass("select-none");
            noticeSelectDate.removeClass("select-click");
        }
    }
});


  