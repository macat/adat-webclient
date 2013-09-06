App.ApplicationController = Ember.ObjectController.extend
  dashboards: (->
    @store.find('dashboard')
  ).property()

  isAuthenticated: ->
    App.Session.isAuthenticated()

