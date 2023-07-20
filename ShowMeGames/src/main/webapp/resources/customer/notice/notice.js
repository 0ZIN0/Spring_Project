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

// select year ajax
$('#notice-year-select').click(function (e) {
    
    console.log($("#notice-year-select").val());
    console.log($("#notice-date-select").val());

    $.ajax({
        url: `./select-notice?year=${$("#notice-year-select").val()}&date=${$("#notice-date-select").val()}`,
        type: 'GET',
        dataType: 'json' // 받는 데이터의 타입
        // success: (emps, state, xhttp) => {
        //     emps.forEach((emp) => {
        //         // document.createElement + document.createTextNode()를 생략
        //         const newDiv = $(`<div id=${emp.employee_id}>${emp.first_name} ${emp.last_name}</div>`);

        //         $('#out').append(newDiv); // appendChilde()
        //     });
        // }
    });
});
