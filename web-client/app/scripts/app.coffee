app = angular.module('adminApp', [])

app.config ($routeProvider) ->
  app.apiUrl = $('body').data('api')
  $routeProvider
    .when '/',
      controller: 'IndexCtrl'
    .when '/login',
      controller: 'LoginCtrl'
    .otherwise
      redirectTo: '/'
