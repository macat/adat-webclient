App.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      @transitionTo('logout')

  redirectToLogin: (transition) ->
    if transition?
      loginController = @controllerFor('login')
      loginController.set('attemptedTransition', transition)
    @transitionTo('login')


  beforeModel: (transition) ->
    unless @session.get('isAuthenticated')
      @redirectToLogin(transition)
