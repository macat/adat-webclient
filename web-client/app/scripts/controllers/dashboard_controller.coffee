

App.DashboardController = Ember.ObjectController.extend
  isEditing: false
  newWidgetType: ''
  widgetTypes: [
    'Chart',
    'Clock'
  ]

  actions:
    edit: ->
      @set 'isEditing', true
    save: ->
      @content.save()
      @set 'isEditing', false
    deleteWidget: (widget) ->
      console.log(this)
      console.log(widget)
      widget.deleteRecord()
      widget.save()
    newWidget: ->
      widget = @store.createRecord('widget')
      widget.set('type', @get('newWidgetType'))
      widget.set('dashboard', @content)
      widget.set('config',
        type: 'LineGraph',
        items: [{
          type: 'line',
          title: 'Home Page',
          color: '#f00',
          dataType: 'statsd',
          dataMetric: 'pageviews.home',
          dataChannel: 'counter',
        }]
      )

      widget.save().then =>
        @content.get('widgets').pushObject(widget)



