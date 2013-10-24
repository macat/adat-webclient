App.LineChartView = Ember.View.extend
  tagName: 'section'
  classNames: ['chart', 'widget']
  templateName: 'chart'
  layoutName: 'widget'

  didInsertElement: ->
    elementId = @get('elementId');
    nv.addGraph =>
      chart = nv.models.lineChart()
      chart.xAxis.axisLabel "X-axis Label"
      chart.yAxis.axisLabel("Y-axis Label").tickFormat d3.format("d")
      d3.select("##{ elementId } svg").datum(@myData()).transition().duration(500).call chart
      nv.utils.windowResize ->
        chart.update()

      chart

  myData: ->
    series1 = []
    for i in [1..100]
      series1.push
        x: i
        y: 100 / i
    @content.get('items').map (item) ->
      key: item.get('title')
      values: series1
      color: item.get('color')
