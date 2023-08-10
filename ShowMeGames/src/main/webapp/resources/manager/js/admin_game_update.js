$(document).ready(function() {
    const game_korean = $('#input_korean_wrapper').data('korean');
    
    let input_korean_arr = $('input[name=korean]');

    $(input_korean_arr).each(function(index, item) {
        if($(item).val() == game_korean) {
            $(item).attr('checked', true);
        }
    })

});
