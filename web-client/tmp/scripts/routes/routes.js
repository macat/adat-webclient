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
