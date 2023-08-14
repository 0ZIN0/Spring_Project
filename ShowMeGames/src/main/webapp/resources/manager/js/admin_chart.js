const labels1 = [];
const data1 = [];
let myChart = null; // Chart.js 객체를 저장할 변수

getChart("day", 2023);
function getChart(tag, year) {
  $.ajax({
    url: `./admin_chart_ajax?tag=${tag}&year=${year}`,
    type: "GET",
    dataType: "json",
    success: (sales) => {
      // 데이터 배열 비우기
      labels1.length = 0;
      data1.length = 0;

      sales.forEach(function (salesData) {
        labels1.push(
          new Date(salesData.order_date).toLocaleDateString("ko-KR")
        );
        data1.push(salesData.total_sales);
      });

      // 차트 객체가 없으면 생성, 있으면 업데이트
      if (!myChart) {
        myChart = new Chart(document.getElementById("bar-chart"), {
          type: "bar",
          data: {
            labels: labels1,
            datasets: [
              {
                label: "Sales",
                backgroundColor: [
                  "#3e95cd",
                  "#8e5ea2",
                  "#3cba9f",
                  "#e8c3b9",
                  "#B3923E",
                  "#8E825E",
                  "#BA3C4A",
                  "#BA783C",
                  "#B9C4E8",
                  "#58AEC4",
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
      } else {
        myChart.update();
      }
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

$("#year").on("click", function () {
  getChart("year", 2023);
});
