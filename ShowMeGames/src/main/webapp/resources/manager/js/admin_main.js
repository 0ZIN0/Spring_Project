
// 버튼 이동 기능
$(document).on("click", ".select_btn_div", function() {
    console.log('클릭');
    let id = $(this).data("id");
    $(location).attr('href', `./${id}`);
});
