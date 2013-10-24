App.WidgetItemController = Ember.ObjectController.extend

  actions:
    colorpick: (args) ->
      @content.set('color', args)
