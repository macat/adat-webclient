(function() {
  var App;

  App = window.App = Ember.Application.create();


(function() {
  App.LoginController = Ember.ObjectController.extend({
    loginFailed: false,
    isProcessing: false,
    email: '',
    password: '',
    actions: {
      test: function() {
        return alert('hello');
      },
      login: function() {
        var request;
        this.setProperties({
          loginFailed: false,
          isProcessing: true
        });
        request = $.ajax("/login", {
          data: JSON.stringify(this.getProperties("email", "password")),
          contentType: 'application/json',
          type: 'POST'
        });
        return request.then(this.success.bind(this), this.failure.bind(this));
      }
    },
    success: function() {
      return this.reset();
    },
    failure: function() {
      this.reset();
      return this.set("loginFailed", true);
    },
    reset: function() {
      return this.setProperties({
        isProcessing: false
      });
    }
  });

}).call(this);


(function() {
  App.UserController = Ember.ObjectController.extend;

}).call(this);


(function() {
  App.UserController = Ember.ArrayController.extend;

}).call(this);


(function() {
  App.Store = DS.Store.extend({});

}).call(this);


(function() {
  App.User = DS.Model.extend({
    createdAt: DS.attr('string'),
    email: DS.attr('string'),
    name: DS.attr('string')
  });

}).call(this);


(function() {


}).call(this);


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


(function() {
  App.UsersRoute = App.AuthenticatedRoute.extend({
    model: function() {
      return App.User.find();
    }
  });

  App.UserRoute = App.AuthenticatedRoute.extend({
    model: function(params) {
      return App.User.find(params.id);
    }
  });

}).call(this);


(function() {
  App.Router.map(function() {
    this.route("login");
    this.resource("users");
    return this.resource("user", {
      path: 'users/:id'
    });
  });

}).call(this);


}).call(this);
