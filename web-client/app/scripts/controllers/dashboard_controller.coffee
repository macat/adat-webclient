

App.DashboardController = Ember.ObjectController.extend
  isEditing: false

  actions:
    edit: ->
      @set 'isEditing', true
    save: ->
      @content.save()
      @set 'isEditing', false


