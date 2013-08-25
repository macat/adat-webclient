app = angular.module('adminApp', ['ngCookies'])

app.config ($routeProvider, $locationProvider) ->
  app.apiUrl = $('body').data('api')
  $routeProvider
    .when '/',
      controller: 'IndexCtrl'
      templateUrl: '/views/index.html'
    .when '/login',
      controller: 'LoginCtrl'
      templateUrl: '/views/login.html'
    .otherwise
      redirectTo: '/'

  #$locationProvider.html5Mode(true)

app.run ['$rootScope', '$location', 'session', ($rootScope, $location, session) ->

  $rootScope.$on "$routeChangeStart", (event, next, current) ->
    $rootScope.error = null
    if !session.isLoggedIn()
      $location.path('/login')
]
