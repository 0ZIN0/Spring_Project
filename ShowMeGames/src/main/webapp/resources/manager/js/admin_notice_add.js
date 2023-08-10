const inputField = $('#notice-title');
const submitButton = $('#submit-btn');

console.log("input: ", inputField);
console.log("h1");

submitButton.disabled = true;

inputField.on('input', function() {
  if (inputField.val() !== '') {
    console.log('1');
    submitButton.disabled = false;
} else {
    console.log('2');
    submitButton.disabled = true;
  }
});