(function() {
  App.AuthenticatedRoute = Ember.Route.extend({
    redirectToLogin: function(transition) {
      var loginController;
      loginController = this.controllerFor('login');
      loginController.set('attemptedTransition', transition);
      return this.transitionTo('login');
    }
  });

}).call(this);
