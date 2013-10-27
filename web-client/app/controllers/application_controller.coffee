App.ApplicationController = Ember.ObjectController.extend
  needs: ['session']
  dashboards: (->
    @store.find('dashboard')
  ).property()

  isAuthenticatedBinding: 'controllers.session.isAuthenticated'

  isSettings: (->
    console.log('test')
  ).property()
