$('.game_name_span').click(function() {
    let id = $(this).data('id');
    location.href = `./admin_game_detail?game_id=${id}`;
});