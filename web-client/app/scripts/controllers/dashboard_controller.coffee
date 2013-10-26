App.DashboardController = Ember.ObjectController.extend
  newWidgetType: ''
  widgetTypes: [
    'Chart',
    'Clock',
    'LineChart'
  ]

  save: ->
    @content.save()

  actions:
    createWidget: ->
      widget = @store.createRecord 'widget',
        type: @get('newWidgetType')
        dashboard: @content
        title: 'Untitled'

      widget.get('items').createRecord
        type: 'line',
        title: 'Home Page',
        color: '#f00',
        dataType: 'statsd',
        dataMetric: 'pageviews.home',
        dataChannel: 'counter',

      widget.save().then =>
        @content.get('widgets').pushObject(widget)
