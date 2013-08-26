

app.controller 'WhoamiCtrl', ($scope, $location, session) ->
  $scope.user = session.user
  $scope.refresh = ->
    session.whoami()
  $scope.logout = ->
    session.logout()
  $scope.refresh()
