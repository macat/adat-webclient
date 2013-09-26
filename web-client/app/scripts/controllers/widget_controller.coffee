App.WidgetController = Ember.ObjectController.extend
  actions:
    delete: ->
      @content.deleteRecord()
      @content.save()
