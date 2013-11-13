App.LoginController = Ember.Controller.extend
  loginFailed: false
  isProcessing: false
  email: ''
  password: ''
  attemptedTransition: null


  reset: ->
    @setProperties isProcessing: false

