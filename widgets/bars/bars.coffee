class Dashing.Bars extends Dashing.Widget

  @accessor 'current', ->
    return @get('displayedValue') if @get('displayedValue')
    points = @get('points')
    if points
      points[points.length - 1].y

  ready: ->
    numbers = @get('points')
    colors = ["#ccc","#dfdf"]#@get('colors')
    chartHeight = 180
    barsWidth = 40

    x = d3.scale.linear().domain([0, d3.max(numbers)]).range(["0px", "180px"]);

    factor = (chartHeight - 22) / d3.max(numbers)


    @chart = d3.select(@node)
     .append("svg")
     .attr("width", "100%")
     .attr("height", "100%");

    @chart.selectAll("rect")
     .data(numbers)
     .enter().append("rect")
     .attr("x", (d, i) -> i * barsWidth)
     .attr("y", (d, i) -> chartHeight - (d * factor))
     .attr("width", barsWidth)
     .attr("height", (d) -> d * factor)
     .attr("fill", (d, i) -> colors[i])

    @chart.selectAll("text")
    .data(numbers).enter().append("text")
    .attr("x", (d, i) -> i * 40 + 40)
    .attr("y", (d, i) -> chartHeight - (d * factor) - 13)
    .attr("dx", -10) # padding-right
    .attr("dy", ".35em") # vertical-align: middle
    .attr("text-anchor", "end") # text-align: right
    .attr("class", "bar-text")
    .text(String)


  onData: (data) ->
    if @chart
        @chart.remove("svg")
    @ready()

