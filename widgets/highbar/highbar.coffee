class Dashing.Highbar extends Dashing.Widget

  createChart: (series, categories, color) ->
    container = $(@node).find('.highbar-container')
    if $(container)[0]
      @chart = new Highcharts.Chart(
        chart:
          renderTo: $(container)[0]
          type: "column"
          backgroundColor: "#008500"

        title:
          text: "Ultimas Semanas"

        subtitle:
          text: ""

        xAxis:
          categories: ["hace una semana", "hace dos semanas", "have tres semanas"]

        yAxis:
          min: 0
          title:
            text: "Votos"

        tooltip:
          headerFormat: "<span style=\"font-size:10px\">{point.key}</span><table>"
          pointFormat: "<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" + "<td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>"
          footerFormat: "</table>"
          shared: true
          useHTML: true

        plotOptions:
          column:
            pointPadding: 0.2
            borderWidth: 0

        series: [
          {name: "Feliz"
          data: [70, 60, 85]
          },
          {name: "Triste"
          data: [40, 15, 20]
          }
        ]
      )
  onData: (data) ->
    @createChart(data.series, data.categories, data.color)
