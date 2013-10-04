App.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      @session.logout()
      @transitionTo('login')

  redirectToLogin: (transition) ->
    loginController = @controllerFor('login')
    loginController.set('attemptedTransition', transition)
    @transitionTo('login')


  beforeModel: (transition) ->
    unless @session.get('isAuthenticated')
      @redirectToLogin(transition)
