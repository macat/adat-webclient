App.ApplicationRoute = Ember.Route.extend

  redirectToLogin: (transition) ->
    loginController = @controllerFor('login');
    loginController.set('attemptedTransition', transition);
    @transitionTo('login');
