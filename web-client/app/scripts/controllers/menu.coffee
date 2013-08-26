

app.controller 'MenuCtrl', ($scope, session, Restangular) ->
  dashboards = Restangular.all('dashboards')

  setMenuItems = ->
    if session.isLoggedIn()
      $scope.categories = dashboards.getList()
    else
      $scope.categories = [{
        title: "",
        dashboards: {
          category: "",
          position: 0,
          slug: "help",
          title: "Help"
        }
      }]

  $scope.$on('sessionChange', setMenuItems)
  setMenuItems()
