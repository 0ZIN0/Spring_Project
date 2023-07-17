$("#customer-btn").on("click", (e) => {
    e.preventDefault();
    
    $('#category-li').hide();
    $('#genre-li').hide();
    $('#editor-pink-li').hide();
    $("#customer-ul").toggle();
});

$("#category").on("click", (e) => {
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