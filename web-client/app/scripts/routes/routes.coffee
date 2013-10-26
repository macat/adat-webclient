App.LoginRoute = Ember.Route.extend
  setupController: ->
    if @session.get('isAuthenticated')
      @transitionTo('index')

  actions:
    login: ->
      @controller.setProperties
        loginFailed: false
        isProcessing: true

      request = $.ajax("/login",
        data: JSON.stringify(@controller.getProperties("email", "password"))
        contentType : 'application/json'
        type : 'POST'
      )
      request.then @success.bind(@), @failure.bind(@)

  success: (data) ->
    if data.id
      @controller.reset()
      @session.set('userId', data.id)
      @transitionTo('index')
    else
      @failure()

  # sign in logic
  failure: ->
    @controller.reset()
    @controller.set "loginFailed", true


App.LogoutRoute = Ember.Route.extend
  renderTemplate: (controller) ->
    if @session.get('isAuthenticated')
      @session.set('userId', null)
      $.post('/logout')
    @transitionTo('login')

App.AdminRoute = Ember.Route.extend()

App.UsersRoute = Ember.Route.extend
  model: ->
    console.log('route')
    @store.find('user')

App.UserRoute = Ember.Route.extend
  model: (params) ->
    @store.find('user', params.id)

App.GroupsRoute = Ember.Route.extend
  model: ->
    @store.find('group')

App.GroupRoute = Ember.Route.extend
  model: (params) ->
    @store.find('group', params.id)

