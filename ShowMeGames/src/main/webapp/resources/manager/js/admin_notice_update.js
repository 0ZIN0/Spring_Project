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

imgFile.on('change', function () {
  console.log("img : " , imgFile.val());
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