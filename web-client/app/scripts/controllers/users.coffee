app.controller 'UsersCtrl', ($scope, $http) ->
  $http.get("#{ app.apiUrl }/users").success (data) ->
    $scope.users = data
