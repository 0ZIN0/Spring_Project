const keyBtn = $(".key-btn");
const orderBtn = $(".game-detail-btn");

keyBtn.click(function (e) {
  console.log("key: ", e.target.dataset.key);
  const backDiv = "#" + e.target.dataset.key;

  $(backDiv).css("top", "0");
});

orderBtn.click(function (e) {
  console.log("key: ", e.target.dataset.key);
  const backDiv = "#" + e.target.dataset.key;

  $(backDiv).css("top", "100%");
});
