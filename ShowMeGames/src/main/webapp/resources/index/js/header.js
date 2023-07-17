// <!-- 고객지원 토글기능 -->

$("#customer-btn").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').hide();
    $('#genre-li').hide();
    $('#editor-pink-li').hide();
    $("#customer-ul").toggle();
});

// <!-- 상단바 게임버튼, 공지사항버튼 호버기능 -->
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


$("#category-btn").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').toggle();
    $('#genre-li').hide();
    $('#editor-pink-li').hide();
    $("#customer-ul").hide();
    $('#genre').css({'background':'white', 'border-radius':'10px'});
    $('#editor').css({'background':'white', 'border-radius':'10px'});
    $('#category').css({'background':'#E5F3F6', 'border-radius':'10px'});
});

$("#genre").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').hide();
    $('#genre-li').toggle();
    $('#editor-pink-li').hide();
    $("#customer-ul").hide();
    $('#genre').css({'background':'#E5F3F6', 'border-radius':'10px'});
    $('#category').css({'background':'white', 'border-radius':'10px'});
    $('#editor').css({'background':'white', 'border-radius':'10px'});
});

$("#editor").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').hide();
    $('#genre-li').hide();
    $('#editor-pink-li').toggle();
    $("#customer-ul").hide();
    $('#editor').css({'background':'#E5F3F6', 'border-radius':'10px'});
    $('#genre').css({'background':'white', 'border-radius':'10px'});
    $('#category').css({'background':'white', 'border-radius':'10px'});
});

