$("#customer-btn").on("click", (e) => {
    e.preventDefault();
    
    $("#customer-ul").toggle();
});

$("#category-btn").on("click", (e) => {
    e.preventDefault();
    
    $('.sub-ul').toggle();
});

$("#genre-btn").on("click", (e) => {
    e.preventDefault();
    
    $('.sub-ul').toggle();
});

$("#editor-pick").on("click", (e) => {
    e.preventDefault();
    
    $('.sub-ul').toggle();
});

