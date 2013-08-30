App.LoginController = Ember.Controller.extend(
  loginFailed: false
  isProcessing: false
  isSlowConnection: false
  timeout: null
  login: ->
    @setProperties
      loginFailed: false
      isProcessing: true

    @set "timeout", setTimeout(@slowConnection.bind(this), 1)
    request = $.post("/login", @getProperties("username", "password"))
    request.then @success.bind(this), @failure.bind(this)

  success: ->
    @reset()

  # sign in logic
  failure: ->
    @reset()
    @set "loginFailed", true

  slowConnection: ->
    @set "isSlowConnection", true

  reset: ->
    clearTimeout @get("timeout")
    @setProperties
      isProcessing: false
      isSlowConnection: false

)
