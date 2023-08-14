const labels1 = [];
const data1 = [];
let myChart = null; // Chart.js 객체를 저장할 변수

getChart("day", 0);
getGenderRate();
getGenreRate();
getEditorSales();

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
          //   new Date(salesData.order_date).toLocaleDateString("ko-KR")
          salesData.order_date
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

function getGenderRate() {
  $.ajax({
    url: `./admin_chart_ajax/gender`,
    type: "GET",
    dataType: "json",
    success: (gender) => {
      const genders = [];
      const rate = [];
      gender.forEach(function (genderData) {
        if (genderData.gender == 0) {
          genders.push("무응답");
        } else if (genderData.gender == 1) {
          genders.push("남성");
        } else if (genderData.gender == 2) {
          genders.push("여성");
        }

        rate.push(genderData.rate);
      });
      // 차트 객체가 없으면 생성, 있으면 업데이트
      myChart2 = new Chart(document.getElementById("gender-chart"), {
        type: "doughnut",
        data: {
          labels: genders,
          datasets: [
            {
              label: "gender",
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
              data: rate,
            },
          ],
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: "top",
            },
            title: {
              display: true,
              text: "성별 비율",
            },
          },
        },
      });
      myChart2.update();
    },
    error: () => {},
  });
}

function getGenreRate() {
  $.ajax({
    url: `./admin_chart_ajax/genre`,
    type: "GET",
    dataType: "json",
    success: (genre) => {
      console.log(genre);
      const genres = [];
      const rate = [];
      genre.forEach(function (genreData) {
        genres.push(genreData.genre);
        rate.push(genreData.rate);
      });
      // 차트 객체가 없으면 생성, 있으면 업데이트
      myChart3 = new Chart(document.getElementById("genre-chart"), {
        type: "doughnut",
        data: {
          labels: genres,
          datasets: [
            {
              label: "genre",
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
              data: rate,
            },
          ],
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: "top",
            },
            title: {
              display: true,
              text: "장르",
            },
          },
        },
      });
      myChart3.update();
    },
    error: () => {},
  });
}

function getEditorSales() {
  $.ajax({
    url: `./admin_chart_ajax/editorSales`,
    type: "GET",
    dataType: "json",
    success: (sales) => {
      console.log(sales);
      const editors = [];
      const rate = [];
      sales.forEach(function (salesData) {
        editors.push(salesData.genre);
        rate.push(salesData.rate);
      });
      console.log(editors);
      // 차트 객체가 없으면 생성, 있으면 업데이트
      myChart4 = new Chart(document.getElementById("editorSales-chart"), {
        type: "bar",
        data: {
          labels: editors,
          datasets: [
            {
              label: editors,
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
              data: rate,
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
      myChart4.update();
    },
    error: () => {},
  });
}

$("#day").on("click", function () {
  getChart("day", 0);
});

$("#month").on("click", function () {
  getChart("month", 2023);
});

$("#year").on("click", function () {
  getChart("year", 2023);
});
