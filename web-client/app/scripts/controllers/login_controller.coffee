App.LoginController = Ember.ObjectController.extend
  loginFailed: false
  isProcessing: false
  email: ''
  password: ''

  actions:
    test: ->
      alert('hello')
    login: ->
      @setProperties
        loginFailed: false
        isProcessing: true

      request = $.ajax("/login",
        data: JSON.stringify(@getProperties("email", "password"))
        contentType : 'application/json'
        type : 'POST'
      )
      request.then @success.bind(@), @failure.bind(@)

  success: ->
    @reset()

  # sign in logic
  failure: ->
    @reset()
    @set "loginFailed", true

  reset: ->
    @setProperties isProcessing: false

