

app.controller 'LoginCtrl', ['$scope', '$location', 'session', ($scope, $location, session) ->
  $scope.auth = {}
  $scope.user = session.user
  $scope.signin = ->
    session.login($scope.auth.email, $scope.auth.password)
           .then (user) ->
             $location.path '/'
]
