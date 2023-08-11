const labels1 = [];
const data1 = [];

function getChart(tag) {
  $.ajax({
    url: `./admin_chart_ajax?tag=${tag}`,
    type: "GET",
    dataType: "json", // 받는 데이터의 타입
    success: (sales, state, xhttp) => {
      console.log("success");
      console.log(sales);
      sales.forEach(function (salesData) {
        console.log(salesData.order_date);
        console.log(salesData.total_sales);
        labels1.push(
          new Date(salesData.order_date).toLocaleDateString("ko-KR")
        );
        data1.push(salesData.total_sales);
      });

      // Chart 객체 생성을 여기로 이동
      new Chart(document.getElementById("bar-chart"), {
        type: "bar",
        data: {
          labels: labels1,
          datasets: [
            {
              label: "Population (millions)",
              backgroundColor: [
                "#3e95cd",
                "#8e5ea2",
                "#3cba9f",
                "#e8c3b9",
                "#B9C4E8",
                "#BA783C",
                "#BA3C4A",
                "#8E825E",
              ],
              data: data1,
            },
          ],
        },
        options: {
          legend: { display: false },
          title: {
            display: true,
          },
        },
      });
    },
    error: () => {},
  });
}

$("#day").on("click", function () {
  getChart("day");
});

$("#month").on("click", function () {
  getChart("month");
});

$("year").on("click", function () {
  getChart("year");
});
