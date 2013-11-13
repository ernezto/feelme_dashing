class Dashing.Highpie extends Dashing.Widget
 
  createChart: (series, categories, color) ->
    container = $(@node).find('.highchart-container')
    if $(container)[0]
      @chart = new Highcharts.Chart(
        chart:
          renderTo: $(container)[0]
          plotBackgroundColor:""
          plotBorderWidth: 0
          plotShadow: true

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
              y: 10,
              color: "red"},
              {name: "No Feliz"
              y: 40
              sliced: true
              selected: true
              color: "blue"}]
          ]
      )
 
  onData: (data) ->
    @createChart(data.series, data.categories, data.color)
