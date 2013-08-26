
app.controller 'PageCtrl', ($scope, $routeParams, $location, Page) ->
  if $routeParams.id == 'new'
    $scope.page = {title: '', id: null, slug: '', category: $routeParams.category}
    $scope.editmode = true
  else
    $scope.page = Page.get($routeParams.id)
    $scope.editmode = false


  $scope.save = ->
    Page.create($scope.page).then (data) ->
      $location.path "p/#{ data.id }"


