const inputField = $('#notice-title');
const noticeText = $('#notice-text');
const imgFile = $('#img-file');
const submitBtn = $('#submit-btn');

submitBtn.attr('disabled', 'disabled');

inputField.on('keyup', function () {
  if (noticeText.val() !== '' && inputField.val() !== '') {
    console.log("input: ", inputField.val());
    console.log('1');
    submitBtn.removeAttr("disabled");
  } else {
    console.log('2');
    console.log("input none: ", inputField.val());
    submitBtn.attr('disabled', 'disabled');
  }
});

noticeText.on('keyup', function () {
  if (noticeText.val() !== '' && inputField.val() !== '') {
    console.log("text: ", noticeText.val());
    console.log('1');
    submitBtn.removeAttr("disabled");
  } else {
    console.log('2');
    console.log("text none: ", noticeText.val());
    submitBtn.attr('disabled', 'disabled');
  }
});

// 이미지 확장자 검사
function isImageFile(file) {
  let ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
  return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
}

imgFile.on('change', function () {
  let file = $(this)[0].files[0];

  if (!isImageFile(file)) {
    imgFile.val('');
    alert('파일 확장자를 확인해주세요');
    return;
  }

  if (noticeText.val() !== '' && inputField.val() !== '') {
    console.log("img: ", imgFile.val());
    console.log('1');
    submitBtn.removeAttr("disabled");
  } else {
    console.log('2');
    console.log("img none: ", imgFile.val());
    submitBtn.attr('disabled', 'disabled');
  }
});