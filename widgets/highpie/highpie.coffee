class Dashing.Highpie extends Dashing.Widget
 
  createChart: (series, categories, color) ->
    container = $(@node).find('.highpie-container')
    if $(container)[0]
      @chart = new Highcharts.Chart(
        chart:
          renderTo: $(container)[0]
          plotBackgroundColor:"#FF5F00"
          plotBorderWidth: 0
          plotShadow: false
          backgroundColor:"#FF5F00"

         title:
              text: "HOY"

         tooltip:
              pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>"

         plotOptions:
              pie:
                  allowPointSelect: true
                  dataLabels:
                      enabled: true
                      color: "#000000"
                      formatter: ->
                         "<b>" + @percentage + " %"

         series: [
            type: "pie"
            name: "Porcentaje"
            data: [{
              name: "Feliz"
              y: 10},
              {name: "No Feliz"
              y: 40
              sliced: true
              selected: true}]
          ]
      )
 
  onData: (data) ->
    @createChart(data.series, data.categories, data.color)
