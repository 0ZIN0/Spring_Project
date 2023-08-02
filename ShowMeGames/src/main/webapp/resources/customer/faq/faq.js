let topic = document.querySelector('#select');
let result = topic.nextElementSibling;

topic.onfocus = function(e) {
    result.setAttribute('transform', 'rotate(180)');
};

topic.onblur = function (e) {
    result.setAttribute('transform', '');
}

topic.addEventListener('change', () => {
    topic.blur();
});
