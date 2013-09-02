App.LoginController = Ember.ObjectController.extend
  loginFailed: false
  isProcessing: false
  email: ''
  password: ''
  attemptedTransition: null

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

  success: (data) ->
    @reset()
    App.Session.set('userId', data.id)
    if @get('attemptedTransition')?
      @set('attemptedTransition', null)
      @transitionTo(@get('attemptedTransition'))
    else
      @transitionTo('index')


  # sign in logic
  failure: ->
    @reset()
    @set "loginFailed", true

  reset: ->
    @setProperties isProcessing: false

