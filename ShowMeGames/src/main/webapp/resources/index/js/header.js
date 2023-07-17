<!-- 고객지원 토글기능 -->

$("#customer-btn").on("click", (e) => {
    e.preventDefault();
    
    $("#customer-ul").toggle();
});

<!-- 상단바 게임버튼, 공지사항버튼 호버기능 -->
$("#notices-btn").on("mouseover", () => {
    $("#notices-btn-underline").css("backgroundColor", "white");
    $("#notices-btn-underline").css("transition", "background-color 0.3s ease");
});

$("#notices-btn").on("mouseout", () => {
    $("#notices-btn-underline").css("backgroundColor", "");
    $("#notices-btn-underline").css("transition", "background-color 0.4s ease");
});

$("#customer-btn").on("mouseover", () => {
    $("#customer-btn-underline").css("backgroundColor", "white");
    $("#customer-btn-underline").css("transition", "background-color 0.3s ease");
});

$("#customer-btn").on("mouseout", () => {
    $("#customer-btn-underline").css("backgroundColor", "");
    $("#customer-btn-underline").css("transition", "background-color 0.4s ease");
});