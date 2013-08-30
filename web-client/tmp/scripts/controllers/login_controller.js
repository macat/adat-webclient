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
