import { Controller } from "@hotwired/stimulus"
// import { Chart } from "chart.js";
// import * as Chartjs from "chart.js";

import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static values = {
    data: Array,
    labels: Array
  }

  connect() {
    console.log(this.dataValue);
    console.log(this.labelsValue);
    this.renderChart()
  }

  renderChart() {
    new Chart(
      this.element,
      {
        type: 'doughnut',
        data: {
          labels: this.labelsValue,
          datasets: [
            {
              label: 'Dreams Statistic',
              data: this.dataValue,
              backgroundColor: [
                'rgb(216, 212, 242)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
              ],
              hoverOffset: 4
            }
          ]
        },
        options: {
          responsive: true
        }
      }
    );
  }
}
