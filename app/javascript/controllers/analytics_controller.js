import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto";

export default class extends Controller {
  connect() {
    this.renderChart();
  }

  renderChart() {
    const chartCanvas = this.element.querySelector("#dreamPieChart");
    const labels = JSON.parse(this.data.get("labels"));
    const data = JSON.parse(this.data.get("data"));

    new Chart(chartCanvas, {
      type: "pie",
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4CAF50'],
        }],
      },
    });
  }
}
