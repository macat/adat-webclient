App.ApplicationController = Ember.ObjectController.extend
  dashboards: (->
    @store.find('dashboard')
  ).property()

