// 공지사항 호버기능
$("#notices-btn").on("mouseover", () => {
    $("#notices-btn-underline").css("backgroundColor", "white");
    $("#notices-btn-underline").css("transition", "background-color 0.3s ease");
});

$("#notices-btn").on("mouseout", () => {
    $("#notices-btn-underline").css("backgroundColor", "");
    $("#notices-btn-underline").css("transition", "background-color 0.4s ease");
});

// 고객지원 호버기능
$("#customer-btn").on("mouseover", () => {
    $("#customer-btn-underline").css("backgroundColor", "white");
    $("#customer-btn-underline").css("transition", "background-color 0.3s ease");
});

$("#customer-btn").on("mouseout", () => {
    $("#customer-btn-underline").css("backgroundColor", "");
    $("#customer-btn-underline").css("transition", "background-color 0.4s ease");
});

// 로그인 호버기능
function changeIconColor(iconId, color) {
    var icon = document.getElementById(iconId);
    icon.style.color = color;
}

// head-top 호버기능 여기까지

$("#category-btn").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').toggle();
    $('#genre-li').hide();
    $('#editor-pink-li').hide();
    $("#customer-ul").hide();
    $('#header-genre').css({'background':'white', 'border-radius':'10px'});
    $('#editor').css({'background':'white', 'border-radius':'10px'});
    $('#category').css({'background':'#E5F3F6', 'border-radius':'10px'});
});

$("#header-genre").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').hide();
    $('#genre-li').toggle();
    $('#editor-pink-li').hide();
    $("#customer-ul").hide();
    $('#header-genre').css({'background':'#E5F3F6', 'border-radius':'10px'});
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
    $('#header-genre').css({'background':'white', 'border-radius':'10px'});
    $('#category').css({'background':'white', 'border-radius':'10px'});
});

$(window).scroll(function () {
  if ($(document).scrollTop() >= 200) {
    $('#header-top').css({'height':'1px', 'transition':'0.3s'});
    $('#header-bottom').css({'top':'0', 'transition':'0.3s'});
  } else {
    $('#header-top').css({'height':'50px', 'transition':'0.3s'});
    $('#header-bottom').css({'top':'50px', 'transition':'0.3s'});
  }

}); 
let lastScroll = 0;
$(window).on('scroll', function(){
    let scrollTop = $(this).scrollTop();

    if (scrollTop <= 200) {
        return;
    }

    if(scrollTop > lastScroll) {
        //down
        $('#header-top').css({'height':'1px', 'transition':'0.3s'});
        $('#header-bottom').css({'top':'0', 'transition':'0.3s'});
    } else {
        // up
        $('#header-top').css({'height':'50px', 'transition':'0.3s'});
        $('#header-bottom').css({'top':'50px', 'transition':'0.3s'});
    }
    lastScroll = scrollTop;
});