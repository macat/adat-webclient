Ember.Application.initializer
  name: "session"
  initialize: (container, application) ->

    App.Session = Ember.Object.extend(
      store: container.lookup('store:main')
      userId: localStorage.userId
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
        @get("userId")?
      ).property("userId")
    ).create()

