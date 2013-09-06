

App.DashboardController = Ember.ObjectController.extend
  isEditing: false
  newWidgetType: ''

  actions:
    edit: ->
      @set 'isEditing', true
    save: ->
      @content.save()
      @set 'isEditing', false
    newWidget: ->
      widget = @store.createRecord('widget')
      widget.set('type', @get('newWidgetType'))
      widget.set('dashboard', @content)
      widget.save()


