
app.controller 'PageCtrl', ($scope, $routeParams, Restangular) ->
  page = Restangular.one('dashboards', $routeParams.id)

  $scope.page = page.get()

