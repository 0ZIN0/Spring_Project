$('.user_name_span').click(function() {
    let id = $(this).data('id');
    location.href = `./admin_user_edit?userNum=${id}`;
}); 

function searchBoard() {
   var keyword = document.getElementById("search-input").value.toLowerCase();
   var users = document.querySelectorAll(".content_grid");

   for (var i = 0; i < users.length; i++) {
       var userName = users[i].querySelector(".content_grid_item:nth-child(2) span").textContent.toLowerCase();
       var display = userName.indexOf(keyword) > -1 ? "flex" : "none"; // 변경된 부분

       users[i].style.display = display;
       users[i].style.flexDirection = "row"; // 추가된 부분
       if (display === "flex") {
        users[i].style.gridTemplateColumns = "11% 50% 30% 40% 15%";
    } else {
        users[i].style.gridTemplateColumns = "none"; // 검색 결과가 없을 경우 그리드 컬럼을 없애거나 필요에 따라 수정합니다.
    }
   }
}