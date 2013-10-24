App.LineChartView = Ember.View.extend
  tagName: 'section'
  classNames: ['chart', 'widget']
  templateName: 'chart'
  layoutName: 'widget'

  didInsertElement: ->
    @draw()

  draw: (->
    elementId = @get('elementId');
    nv.addGraph =>
      chart = nv.models.lineChart()
      chart.xAxis.axisLabel "X-axis Label"
      chart.yAxis.axisLabel("Y-axis Label").tickFormat d3.format("d")
      d3.select("##{ elementId } svg").datum(@myData()).transition().duration(500).call chart
      nv.utils.windowResize ->
        chart.update()

      chart
  ).observes('controller.editing')

  myData: ->
    @content.get('items').map (item) =>
      key: item.get('title')
      values: @series()
      color: item.get('color')

  series: ->
    series = []
    for i in [1..100]
      series.push
        x: i
        y: (100 / i) + @getRandom()
    series

  getRandom: ->
    Math.floor(Math.random() * (20 - 0 + 1) + 0);
