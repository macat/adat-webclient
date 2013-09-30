App.ApplicationController = Ember.ObjectController.extend
  needs: ['session']
  dashboards: (->
    @store.find('dashboard')
  ).property()

  isAuthenticatedBinding: 'controllers.session.isAuthenticated'

  #isAuthenticated: (->
  #  @get('controllers.session').get('isAuthenticated')
  #).property()

