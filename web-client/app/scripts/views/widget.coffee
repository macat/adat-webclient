App.WidgetView = Ember.ContainerView.extend
  classNames: ['widget', 'open']
  open: true
  content: (->
    if content.type
      [new App[content.type + 'View']]
    else
      []
  ).property('content.type')
  actions:
    collapse: (evt) ->
      console.log('test')

