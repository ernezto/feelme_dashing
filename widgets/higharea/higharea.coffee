class Dashing.Higharea extends Dashing.Widget

  createChart: (series, categories, color) ->
    container = $(@node).find('.higharea-container')
    if $(container)[0]
      @chart = new Highcharts.Chart(
        chart:
          renderTo: $(container)[0]
          type: "area"
          backgroundColor: "#FF9640"

        title:
          text: "ESTA SEMANA"

        subtitle:
          text: "11 NOV - 15 NOV"

        xAxis:
          categories: ["LUN", "MAR", "MIE", "JUE", "VIE"]
          tickmarkPlacement: "on"
          title:
            enabled: false

        yAxis:
          title:
            text: "Votos"

          labels:
            formatter: ->
              @value

        tooltip:
          shared: true
          valueSuffix: " votos"

        plotOptions:
          area:
            stacking: "normal"
            lineColor: "#666666"
            lineWidth: 1
            marker:
              lineWidth: 1
              lineColor: "#666666"

        series: [
          {name: "Triste"
          data: [2, 1, 2, 0, 4] 
          },
          {name: "Feliz"
          data: [4, 5, 4, 6, 2]
          }]      
      )

  onData: (data) ->
    @createChart(data.series, data.categories, data.color)
