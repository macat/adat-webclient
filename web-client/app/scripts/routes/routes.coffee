App.UsersRoute = App.AuthenticatedRoute.extend
  model: ->
    App.User.find()

App.UserRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    App.User.find(params.id)
