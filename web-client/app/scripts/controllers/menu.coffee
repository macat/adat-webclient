

app.controller 'MenuCtrl', ($scope, $location, session, Page) ->

  $scope.categories = []
  if session.isLoggedIn()
    Page.pages.getList().then (pageList) ->
      $scope.pageList = pageList

      _.each pageList, (page) ->
        if !_.contains $scope.categories, page.category
          $scope.categories.push page.category


  else
    $scope.pageList = [
      {
        category: "",
        position: 0,
        id: 'help',
        title: "Help"
      }
    ]

  $scope.addPage = (category) ->
    $location.path "/p/new/#{ category }"

