App.WidgetController = Ember.ObjectController.extend
  editing: false

  actions:
    edit: ->
      @set('editing', true)
    done: ->
      @set('editing', false)
    delete: ->
      @content.deleteRecord()
      @content.save()
