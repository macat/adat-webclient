Ember.Application.initializer
  name: "session"
  initialize: (container, application) ->

    App.Session = Ember.Object.extend(
      store: container.lookup('store:main')
      init: ->
        @_super()
        @set "userId", localStorage.userId
        if @get("userId")?
          $.getJSON('/whoami').then(
            (data) =>
              if @get("userId") != data.id
                @set("userId", data.id)
            ,( => @set("userId", null))
          )

      userChanged: (->
        if @get("userId")?
          @set "user", @store.find('user', @get("userId"))
        else
          @set "user", null
      ).observes("userId")
      
      isAuthenticated: ->
        @get("userId")?
    ).create()

