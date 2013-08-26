app = angular.module('adminApp', ['ngCookies', 'ngRoute', 'restangular'])

app.config ($routeProvider, $locationProvider) ->
  app.apiUrl = $('body').data('api')
  $routeProvider
    .when '/',
      controller: 'IndexCtrl'
      templateUrl: '/views/index.html'
    .when '/login',
      controller: 'LoginCtrl'
      templateUrl: '/views/login.html'
    .when '/p/new/:category',
      controller: 'NewPageCtrl',
      templateUrl: '/views/page.html'
    .when '/p/:id',
      controller: 'PageCtrl',
      templateUrl: '/views/page.html'
    .otherwise
      redirectTo: '/'

  #$locationProvider.html5Mode(true)

app.run ($rootScope, $location, session) ->
  $rootScope.$on "$routeChangeStart", (event, next, current) ->
    if !session.isLoggedIn()
      $location.path('/login')
