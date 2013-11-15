class Dashing.Highpie extends Dashing.Widget
 
  createChart: (series, categories, color) ->
    container = $(@node).find('.highpie-container')
    if $(container)[0]
      @chart = new Highcharts.Chart(
        chart:
          renderTo: $(container)[0]
          plotBackgroundColor:"#009999"
          plotBorderWidth: 0
          plotShadow: false
          backgroundColor:"#009999"

         title:
              text: "HOY"

         tooltip:
              pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>"

         plotOptions:
              pie:
                  allowPointSelect: true
                  dataLabels:
                      enabled: true
                      formatter: ->
                        "<b>" + Math.round(@percentage) + " %"
                  showInLegend: true

         series: [
          type: "pie"
          name: "Porcentaje"
          data: [
              {
                name: "Feliz"
                y: parseInt(@get('happy_value'))
              },
              {
                name: "Triste"
                y: parseInt(@get('unhappy_value'))
                sliced: true
                selected: true
              }]
          ]
      )
 
  onData: (data) ->
    @createChart(data.series, data.categories, data.color)
