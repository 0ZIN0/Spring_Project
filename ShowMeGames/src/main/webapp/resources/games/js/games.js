$('.filter_toggle').on('click', function() {
  // 이벤트 핸들러에서 this를 사용하여 클릭된 요소를 참조합니다.
  var el = this;
  if ($(el).parent().hasClass('active')) {
    $(el).parent().removeClass('active');
    $(el).find('.arrow').removeClass('reverse');
  } else {
    $(el).parent().addClass('active');
    $(el).find('.arrow').addClass('reverse');
  }
});
/*sort_selector*/ 
const label = $('.label');
const options = $('.option_item');
const text = $('.label_text');
const arrow = $('.arrow');

const handleSelect = (item) => {
  label.parent().removeClass('active');
  const itemText = $(item).text();
  text.text(itemText);
}

options.on('click', function(e) {
  var el = $(this);
  $('label .arrow').removeClass('reverse');
  handleSelect(el);
});

// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.on('click', () => {
  if(label.parent().hasClass('active')) {
  	label.parent().removeClass('active');
    label.find('.arrow').removeClass('reverse');
  } else {
  	label.parent().addClass('active');
    label.find('.arrow').addClass('reverse');
  }
});

label.on('blur', function(e) {
  $(this).parent().removeClass('active'); // 라벨(label) 요소의 부모에서 'active' 클래스를 제거합니다.
  $(this).find('.arrow').removeClass('reverse'); // 라벨(label) 요소 내부에서 .arrow 클래스를 가진 요소의 'reverse' 클래스를 제거합니다.
});

/*filter logic*/
const filter_item = $('.filter_item');
const tag_container = $('.tag_container');
filter_item.on('click', function() {
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
  }
});

$(document).on('click', '.remove_filter', function() {
  var remove_filter = this;
  var tag = $(remove_filter).parent();
  tag.remove();
  $.each(filter_item, function(index, el){
    var checkbox = $(el).find('input');
    if(checkbox.val() == tag.find('.tag_title').text()){
      console.log('통과');
      checkbox.prop('checked', false);
      return false;
    }
  })
});