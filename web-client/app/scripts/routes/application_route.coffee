App.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      App.Session.logout()
      @transitionToRoute('login')

  redirectToLogin: (transition) ->
    loginController = @controllerFor('login')
    loginController.set('attemptedTransition', transition)
    @transitionToRoute('login')


  beforeModel: (transition) ->
    unless App.Session.get('isAuthenticated')
      @redirectToLogin(transition)
