/*filter logic*/
const genreList = new Array();
const editorList = new Array();

// genre
const genre_ul = $('.genre-list');
const genre_filter = $('.genre');
const tag_container = $('.tag_container');
const filter_item = $('.filter_item');
// checkbox를 선택했을 때
genre_ul.find($('input')).click(function(e) {
  var checkbox = this;

  // 부모 요소에게 이벤트 전가 x
  e.stopPropagation();

  if($(checkbox).is(':checked') == false) {
    var tag = tag_container.find('.tag_title');
    $.each(tag, function(index,el) {
      if($(el).text() == $(checkbox).val()) {
        $(el).parent().remove();
      }
    })
    genreList.splice(genreList.indexOf($(checkbox).val()), 1);
    getSearchList();
  } else {
    tag_container
    .prepend(`<div class="tag">
      <div class="tag_title">${$(this).val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    genreList.push($(this).val());
    getSearchList();
  }
  console.log('genreList: ' + genreList);
});

// li를 눌렀을 때
$('.genre').on('click', function() {
  var el = this;
  var checkbox = $(el).find('input');
  if(checkbox.is(':checked') == true) {
    checkbox.prop('checked', false);
    var tag = tag_container.find('.tag_title');
    $.each(tag, function(index,el) {
      if($(el).text() == checkbox.val()) {
        $(el).parent().remove();
      }
    })
    genreList.splice(genreList.indexOf(checkbox.val()), 1);
    getSearchList();
  } else {
    checkbox.prop('checked', true);
    tag_container
    .prepend(`<div class="tag">
      <div class="tag_title">${checkbox.val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    genreList.push(checkbox.val());
    getSearchList();
  }
  console.log('genreList: ' + genreList);
});

// editor
const editer_ul = $('.editor-list');
const editer_filter = $('editor');
// checkbox를 선택했을 때
editer_ul.find($('input')).click(function(e) {
  var checkbox = this;

  // 부모 요소에게 이벤트 전가 x
  e.stopPropagation();

  if($(checkbox).is(':checked') == false) {
    var tag = tag_container.find('.tag_title');
    $.each(tag, function(index,el) {
      if($(el).text() == $(checkbox).val()) {
        $(el).parent().remove();
      }
    })
    editorList.splice(editorList.indexOf($(checkbox).val()), 1);
    getSearchList();
  } else {
    tag_container
    .prepend(`<div class="tag">
      <div class="tag_title">${$(this).val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    editorList.push($(this).val());
    getSearchList();
  }
  console.log('editorList: ' + editorList);
});

// li를 눌렀을 때
$('.editor').on('click', function() {
  var el = this;
  var checkbox = $(el).find('input');
  if(checkbox.is(':checked') == true) {
    checkbox.prop('checked', false);
    var tag = tag_container.find('.tag_title');
    $.each(tag, function(index,el) {
      if($(el).text() == checkbox.val()) {
        $(el).parent().remove();
      }
    })
    editorList.splice(editorList.indexOf(checkbox.val()), 1);
    getSearchList();
  } else {
    checkbox.prop('checked', true);
    tag_container
    .prepend(`<div class="tag">
      <div class="tag_title">${checkbox.val()}</div>
      <div class="remove_filter">
        <span class="material-symbols-outlined">
          close
        </span>
      </div>
    </div>`);
    editorList.push(checkbox.val());
    console.log('editorList: ' + editorList);
    getSearchList();
  }
  console.log(editorList);
});

// remove filter
$(document).on('click', '.remove_filter', function() {
  var remove_filter = this;
  var tag = $(remove_filter).parent();
  tag.remove();
  $.each(filter_item, function(index, el){
    var checkbox = $(el).find('input');
    if(checkbox.val() == tag.find('.tag_title').text()){
      checkbox.prop('checked', false);
      genreList.splice(genreList.indexOf(checkbox.val()), 1);
      editorList.splice(editorList.indexOf(checkbox.val()), 1);
      getSearchList();
      return false;
    }
  })
});


// Search Logic
const game_list = $('.sort_result_list');
function getSearchList(){
  var genre_toString = genreList.join('%7C');
  var editor_toString = editorList.join('/');
 $.ajax ({
  url: './games-filter?genre=' + genre_toString +'&editor=' + editor_toString,
  type: 'GET',
  contentType: 'application/json',
  dataType: 'json',
  success: function(resp) {
    game_list.empty();
    if(resp.length != 0) {
      resp.forEach(function(game) {
        var card = `
          <div class="sort_result_card">
            <img src="${game.banner_img_url}" alt="banner_img"/>
          </div>
        `;
        game_list.prepend(card);
      });
    } else {
      var noResult = `<div class="filter_not_found">
      <span> 검색 결과가 없습니다</span>
      </div>`;
      game_list.prepend(noResult);
    }
  },
  error: function(error) {
    console.log("error");
    game_list.empty();
    var noResult = `<div class="filter_not_found">
      <span> 검색 결과가 없습니다</span>
      </div>`;
      game_list.prepend(noResult);
  }
 });
}