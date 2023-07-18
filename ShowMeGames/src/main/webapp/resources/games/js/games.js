const filter_dropdowns = document.querySelectorAll('.filter_toggle');

filter_dropdowns.forEach(dropdown => {
	console.log(dropdown);
  dropdown.addEventListener('click', () => {
    console.log(dropdown.querySelector('.arrow'));
    if(dropdown.parentNode.classList.contains('active')) {
      dropdown.parentNode.classList.remove('active');
      dropdown.querySelector('.arrow').classList.remove('reverse');
    } else {
      dropdown.parentNode.classList.add('active');
      dropdown.querySelector('.arrow').classList.add('reverse');
    }
  })
})
  
/*sort_selector*/ 
const label = document.querySelector('.label');
const options = document.querySelectorAll('.option_item');
const text = document.querySelector('.label_text');
console.log(text);
// 클릭한 옵션의 텍스트를 라벨 안에 넣음
const handleSelect = (item) => {
  label.parentNode.classList.remove('active');
  text.textContent = item.textContent;
}
// 옵션 클릭시 클릭한 옵션을 넘김
options.forEach(option => {
	option.addEventListener('click', (e) => {
	label.querySelector('.arrow').classList.remove('reverse');
	handleSelect(option);
	})
})

// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.addEventListener('click', () => {
  if(label.parentNode.classList.contains('active')) {
  	label.parentNode.classList.remove('active');
    label.querySelector('.arrow').classList.remove('reverse');
  } else {
  	label.parentNode.classList.add('active');
    label.querySelector('.arrow').classList.add('reverse');
  }
})

label.onblur = function(e) {
  label.parentNode.classList.remove('active');
  label.querySelector('.arrow').classList.remove('reverse');
}
