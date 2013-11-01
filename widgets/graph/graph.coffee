class Dashing.Graph extends Dashing.Widget

  @accessor 'current', ->
    return @get('displayedValue') if @get('displayedValue')
    points = @get('points')
    if points
      points[points.length - 1].y

  ready: ->
    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey"))
    @graph = new Rickshaw.Graph(
      element: @node
      width: width
      height: height
      renderer: 'bar' #@get("graphtype")
      series: [ 
                {
                    data: [ { x: 0, y: 40 }, { x: 1, y: 49 }, { x: 2, y: 38 }, { x: 3, y: 30 }, { x: 4, y: 32 } ],
                    color: '#4682b4'
                }, {
                    data: [ { x: 0, y: 20 }, { x: 1, y: 24 }, { x: 2, y: 19 }, { x: 3, y: 15 }, { x: 4, y: 16 } ],
                    color: '#9cc1e0'

                } ]
    )

    @graph.renderer.unstack = true
    #x_axis = new Rickshaw.Graph.Axis.Time(graph: @graph)
    #y_axis = new Rickshaw.Graph.Axis.Y(graph: @graph, tickFormat: Rickshaw.Fixtures.Number.formatKMBT)
    @legend = new Rickshaw.Graph.Legend({
      graph: @graph,
      element: @node })
    @shelving = new Rickshaw.Graph.Behavior.Series.Toggle({
      graph: @graph,
      legend: @legend })
    
    hoverDetail = new Rickshaw.Graph.HoverDetail( {                                                                                                                                                                                          
                                                    graph: @graph                                                                                                                                                                                                                             
                                                  } )
    
    @graph.render()

  onData: (data) ->
    if @graph
      #@graph.series[0].data = {4}#data.points
      #@graph.series[1].data = {10}#data.points
      @graph.render()
