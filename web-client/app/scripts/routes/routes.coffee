App.IndexRoute = App.ApplicationRoute.extend()

App.UsersRoute = App.ApplicationRoute.extend()

App.UserRoute = App.ApplicationRoute.extend()

App.LogoutRoute = Ember.Route.extend
  renderTemplate: (controller) ->
    controller.logout()
