(function() {
  App.Router.map(function() {
    this.route("login");
    this.resource("users");
    return this.resource("user", {
      path: 'users/:id'
    });
  });

}).call(this);
