App.WidgetController = Ember.ObjectController.extend
  editing: false

  actions:
    edit: ->
      @set('editing', true)
    save: ->
      @set('editing', false)
      @content.save()

    delete: ->
      @content.deleteRecord()
      @content.save()

    addItem: ->
      @content.get('items').createRecord
        title: 'Untitled'
        color: '#f00'

