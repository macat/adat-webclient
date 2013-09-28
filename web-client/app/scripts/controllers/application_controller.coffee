App.ApplicationController = Ember.ObjectController.extend

  dashboards: (->
    @store.find('dashboard')
  ).property("isAuthenticated")

  isAuthenticated: Ember.Binding.oneWay('App.Session.isAuthenticated')

