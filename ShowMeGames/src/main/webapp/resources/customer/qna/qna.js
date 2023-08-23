const text = $('#textbox');
const textarea = $('#textarea');
const submitBtn = $('.submit-btn');

submitBtn.attr('disabled', 'disabled');

text.on('keyup', function () {
  if (text.val() !== '' && textarea.val() !== '') {
    console.log("input: ", text.val());
    console.log('1');
    submitBtn.removeAttr("disabled");
  } else {
    console.log('2');
    console.log("input none: ", text.val());
    submitBtn.attr('disabled', 'disabled');
  }
});

textarea.on('keyup', function () {
  if (text.val() !== '' && textarea.val() !== '') {
    console.log("text: ", textarea.val());
    console.log('1');
    submitBtn.removeAttr("disabled");
  } else {
    console.log('2');
    console.log("text none: ", textarea.val());
    submitBtn.attr('disabled', 'disabled');
  }
});