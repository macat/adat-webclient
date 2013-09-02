
App.LogoutController = Ember.ObjectController.extend
  logout: ->
    $.post('/logout').always (response) =>
      App.Session.set 'userId', null
      @transitionToRoute('login')
