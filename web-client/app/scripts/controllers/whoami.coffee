

app.controller 'WhoamiCtrl', ['$scope', '$http', '$location', ($scope, $http, $location) ->
  $scope.user = {}
  $http({ method: 'GET', url: "#{ app.apiUrl }/whoami" }).
    success (data, status, headers, config) ->
      $scope.userId = data.id
      if !$scope.userId
        $location.url('/login')
]
