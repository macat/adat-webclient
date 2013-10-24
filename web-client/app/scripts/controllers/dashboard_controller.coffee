

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
    newWidget: ->
      widget = @store.createRecord('widget')
      widget.set('type', @get('newWidgetType'))
      widget.set('dashboard', @content)
      widget.set('title', 'Untitled')
      widget.get('items').createRecord
        type: 'line',
        title: 'Home Page',
        color: '#f00',
        dataType: 'statsd',
        dataMetric: 'pageviews.home',
        dataChannel: 'counter',

      widget.save().then =>
        @content.get('widgets').pushObject(widget)



