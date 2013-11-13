App.InlineTextField = Ember.View.extend
  layoutName: "views/text_field"
  isEditing: false
  click: ->
    unless @get("isEditing")
      @set "isEditing", true
      Ember.run.scheduleOnce "afterRender", this, @focusTextField

  focusTextField: ->
    val = @$("input").val()
    @$("input").focus()
    @$("input").val ""
    @$("input").val val

  textField: Ember.TextField.extend
    focusOut: ->
      @save()

    save: ->
      parentView = @get("parentView")
      controller = parentView.get("controller")
      controller.save()  if controller.save
      parentView.set "isEditing", false
