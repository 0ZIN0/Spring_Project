const inputField = $('#faq-title');
const faqText = $('#faq-text');
const faqTopic = $('#faq-topic');
const submitBtn = $('#submit-btn');

submitBtn.attr('disabled', 'disabled');

inputField.on('keyup', function () {
  if (faqText.val() !== '' && inputField.val() !== '') {
    submitBtn.removeAttr("disabled");
  } else {
    submitBtn.attr('disabled', 'disabled');
  }
});

faqText.on('keyup', function () {
  if (faqText.val() !== '' && inputField.val() !== '') {
    submitBtn.removeAttr("disabled");
  } else {
    submitBtn.attr('disabled', 'disabled');
  }
});

faqTopic.click(function () {
  if (faqText.val() !== '' && inputField.val() !== '') {
    submitBtn.removeAttr("disabled");
  } else {
    submitBtn.attr('disabled', 'disabled');
  }
});