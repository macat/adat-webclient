

app.factory 'session', ['$http', '$q', '$cookies', '$timeout', ($http, $q, $cookies, $timeout) ->
  user = null

  fetchUser = (userId, deferred) ->
    $http({method: 'GET', url: "#{ app.apiUrl}/users/#{ userId }"}).
      success (data, status) ->
        user = data
        deferred.resolve(data) if deferred

  if uid = $cookies.uid
    user = {id: uid}
    fetchUser(uid)

  user: user
  whoami: ->
    deferred = $q.defer()
    if user
      deferred.resolve(user)

    $http({ method: 'GET', url: "#{ app.apiUrl }/whoami" }).
      success (data, status, headers, config) ->
        if data.id
          fetchUser(data.id, deferred)
        else
          deferred.reject()

    deferred.promise
  isLoggedIn: ->
    user?
  login: (email, password) ->
    deferred = $q.defer()
    if user
      deferred.resolve(user)

    $http.post("#{ app.apiUrl }/login", {email: email, password: password},
               {headers: {'Content-Type': 'application/json'}})
         .success (data, status, headers, config) ->
           if data.success
             fetchUser(data.id, deferred)
           else
             deferred.reject()

    deferred.promise
  logout: ->
    deferred = $q.defer()
    $http.post("#{ app.apiUrl }/logout", {},
               {headers: {'Content-Type': 'application/json'}})
         .success (data, status, headers, config) ->
           user = null
           deferred.resolve()

    deferred.promise

]
