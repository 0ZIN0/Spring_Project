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


// header-bottom list css active
function openOthers(list) {
  var tablinks = $('.sub-ul');
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" list-active", "");
  }
  list.addClass('list-active');
  list.css({'display':'grid'});
}

// header-bottom title css active
function clickChangeColor(btn, list, arrow) {
    if (btn.hasClass('title-active')) {
      btn.className = btn.removeClass('title-active');
      list.className = list.removeClass('expand_more-active');
      return;
    } else {
      var tablinks = $('.header-bottom-btn');
      console.log(tablinks);
      for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" title-active", "");
      }
      btn.addClass('title-active');
      openOthers(list);
      spinActive(arrow);
    }
  }
  
  // header-bottom 버튼 기능 구현
  $("#category").on("click", (e) => {
    console.log("11111");
    e.preventDefault();
    var category =  $('#category-li');
    var categoryBtn = $('#category');
    var categoryArrow = $('#category-arrow');
    
    $('#category-li').toggle();
    $('#genre-li').hide();
    $('#editor-pink-li').hide();
    
    clickChangeColor(categoryBtn, category, categoryArrow);
});

$("#header-genre").on("click", (e) => {
    e.preventDefault();
    var genre =  $('#genre-li');
    var genreBtn = $('#header-genre');
    var genreArrow = $('#genre-arrow');

    $('#category-li').hide();
    $('#genre-li').toggle();
    $('#editor-pink-li').hide();
    
    clickChangeColor(genreBtn, genre,genreArrow);
});

$("#editor").on("click", (e) => {
    e.preventDefault();
    var editor =  $('#editor-pink-li');
    var editorBtn =  $('#editor');
    var editorArrow = $('#editor-arrow');

    $('#category-li').hide();
    $('#genre-li').hide();
    $('#editor-pink-li').toggle();

    clickChangeColor(editorBtn, editor, editorArrow);
});

$('html').click(function(e) {   
	if($(e.target).hasClass("sub-ul") || $(e.target).hasClass("title-div") || $(e.target).hasClass("bottom-btns")) {
  } else {
   
    $('#category-li').hide();
    $('#genre-li').hide();
    $('#editor-pink-li').hide();
    
    var tablinks = $('.header-bottom-btn');
    var tablinks2 = $('.sub-ul');
    var tablinks3 = $('.expand_more');
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = 
        tablinks[i].className.replace(" title-active", "");
      tablinks2[i].className = 
        tablinks2[i].className.replace(" active", "");
      tablinks3[i].className = 
        tablinks3[i].className.replace(" expand_more-active", "");
    }
  }
});

// header scroll 기능 구현
$(window).scroll(function () {
  if ($(document).scrollTop() >= 200) {
    $('#header-top').css({'height':'1px', 'transition':'0.3s'});
    $('#header-bottom').css({'top':'0', 'transition':'0.3s'});
  } else {
    $('#header-top').css({'height':'54px', 'transition':'0.3s'});
    $('#header-bottom').css({'top':'54px', 'transition':'0.3s'});
  }
});

let lastScroll = 0;
$(window).on('scroll', function() {
    let scrollTop = $(this).scrollTop();

    if (scrollTop <= 200) {
        return;
    }

    var logo =  $('#header-bottom-logo');
    var headerBottom =  $('#header-bottom');
    if(scrollTop > lastScroll) {
        //down
        $('#header-top').css({'height':'1px', 'transition':'0.3s'});
        $('#header-bottom').css({'top':'0', 'transition':'0.3s'});
        logo.css('display', 'block');
        headerBottom.addClass('header-bottom-drop');
        headerBottom.removeClass('header-bottom-up');
      } else {
        // up
        $('#header-top').css({'height':'54px', 'transition':'0.3s'});
        $('#header-bottom').css({'top':'54px', 'transition':'0.3s'});
        logo.css('display', 'none');
        headerBottom.addClass('header-bottom-up');
        headerBottom.removeClass('header-bottom-drop');
    }
    lastScroll = scrollTop;
});

// arrow spin active css
function spinActive(list) {
  var tablinks = $('.expand_more');
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" expand_more-active", "");
  }
  list.addClass('expand_more-active');
}