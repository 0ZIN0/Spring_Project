$('.user_name_span').click(function() {
    let id = $(this).data('id');
    location.href = `./admin_user_edit?userNum=${id}`;
}); 

// function searchBoard() {
//     var keyword = document.getElementById("search-input").value.toLowerCase();
//     var users = document.querySelectorAll(".content_grid");
 
//     for (var i = 0; i < users.length; i++) {
//         var userName = users[i].querySelector(".content_grid_item:nth-child(2) span").textContent.toLowerCase();
//         var display = userName.indexOf(keyword) > -1 ? "flex" : "none";
 
//         users[i].style.display = display;
        
//         if (display === "flex") {
//             users[i].style.flexDirection = "row";
//             users[i].style.gridTemplateColumns = "2% 50% 30%"; // 검색 결과가 있을 경우 그리드 컬럼 값을 유지
//         } else {
//             users[i].style.flexDirection = "column"; // 검색 결과가 없을 경우 수직 정렬로 변경
//             users[i].style.gridTemplateColumns = "none"; // 검색 결과가 없을 경우 그리드 컬럼을 없애거나 필요에 따라 수정
//         }
//     }
//  }

function searchBoard() {
    var searchInput = document.getElementById('search-input').value.trim().toLowerCase();
    var userNames = document.getElementsByClassName('user_name_span');

    for (var i = 0; i < userNames.length; i++) {
        var userName = userNames[i].innerText.trim().toLowerCase();
        var contentGrid = userNames[i].closest('.content_grid');

        if (userName.includes(searchInput)) {
            contentGrid.classList.remove('hide'); // 검색 결과 항목은 보이도록 클래스 제거
        } else {
            contentGrid.classList.add('hide'); // 검색 결과가 아닌 항목은 숨김 클래스 추가
        }
    }
}