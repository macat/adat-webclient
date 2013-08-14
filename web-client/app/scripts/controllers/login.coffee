

app.controller 'LoginCtrl', ['$scope', '$http', '$location', ($scope, $http, $location) ->
  $scope.auth = {}
  $scope.signin = ->
    $http.post("#{ app.apiUrl }/login", $scope.auth,
               {headers: {'Content-Type': 'application/json'}})
         .success (data, status, headers, config)->
           alert('ok')
    
]
