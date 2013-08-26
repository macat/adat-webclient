

app.factory 'dashboard', ($http) ->
  dashboards = []

  list: ->
    $http.get('/dashboards')
         .then (data) ->
           console.log(data)
          , ->
            console.log("failed")
  dashboards: dashboards
