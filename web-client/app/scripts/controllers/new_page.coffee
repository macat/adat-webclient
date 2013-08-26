
app.controller 'NewPageCtrl', ($scope, $routeParams, $location, Page) ->
  $scope.page = {title: '', id: null, slug: '', category: $routeParams.category}
  $scope.editmode = true

  $scope.save = ->
    Page.create($scope.page).then (data) ->
      $location.path "p/#{ data.id }"


