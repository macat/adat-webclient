App.LineChartView = Ember.View.extend
  tagName: 'section'
  classNames: ['chart', 'widget']
  templateName: 'chart'
  layoutName: 'widget'

  didInsertElement: ->
    @draw()

  draw: (->
    statsd = new StatsdCache(new StatsdClient("http://localhost:5999/"))
    #statsd.granularity(300000000)
    sources = @content.get('items').map (item) ->
      item.get('dataMetric') + ":" + item.get('dataChannel')

    statsd.sources(sources)
    statsd.query 1377660000e3, 20, (error, response) =>
      chart = new Chart("##{@get('elementId')} svg")
      chart.settings(data: response.data, ts: 1377660000e3)
  ).observes('controller.editing')

