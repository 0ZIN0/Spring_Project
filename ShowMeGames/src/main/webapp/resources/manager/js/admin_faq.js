$("#faq-topic").click(function (e) {
  $.ajax({
    url: `./select-faq?topic=${$("#faq-topic").val()}`,
    type: "GET",
    dataType: "json", // 받는 데이터의 타입
    success: (faqs, state, xhttp) => {
      $('.faq-div').remove();
      $('#pagingDiv').remove();
      $('#pageDiv').remove();
      if (faqs.length != 0) {

        faqs.forEach((faq) => {
          const faqContent = $(
            `<a href="./admin_faq_detail?id=${faq.qna_id}" class="faq-div">
            <div>${faq.qna_id}</div>
            <div>${faq.qna_topic}</div>
            <div class="qna-title">${faq.qna_title}</div>
          </a>`
          );
          
          $("#faq-list").append(faqContent);
        });
      }
    },
  });
});