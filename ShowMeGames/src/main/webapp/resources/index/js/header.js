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

