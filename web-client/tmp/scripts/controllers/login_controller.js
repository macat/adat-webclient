(function() {
  App.LoginController = Ember.Controller.extend({
    loginFailed: false,
    isProcessing: false,
    isSlowConnection: false,
    timeout: null,
    login: function() {
      var request;
      this.setProperties({
        loginFailed: false,
        isProcessing: true
      });
      this.set("timeout", setTimeout(this.slowConnection.bind(this), 1));
      request = $.post("/login", this.getProperties("username", "password"));
      return request.then(this.success.bind(this), this.failure.bind(this));
    },
    success: function() {
      return this.reset();
    },
    failure: function() {
      this.reset();
      return this.set("loginFailed", true);
    },
    slowConnection: function() {
      return this.set("isSlowConnection", true);
    },
    reset: function() {
      clearTimeout(this.get("timeout"));
      return this.setProperties({
        isProcessing: false,
        isSlowConnection: false
      });
    }
  });

}).call(this);
