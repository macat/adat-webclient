

App.SessionController = Ember.Controller.extend
  userId: localStorage.userId
  user: null
  init: ->
    @_super()
    $.getJSON('/whoami').then(
      (data) =>
        if @get("userId") != data.id
          @set("userId", data.id)
      ,( => @set("userId", null))
    )

  userChanged: (->
    if @get("userId")? && @get("userId").trim() != ''
      @set "user", @store.find('user', @get("userId"))
      localStorage.userId = @get("userId")
    else
      @set "user", null
      delete localStorage.userId
  ).observes("userId")

  isAuthenticated: (->
    @get("userId")? && @get("userId").trim() != ''
  ).property("userId")

  logout: ->
    $.post('/logout').always (response) =>
      @set 'userId', null
