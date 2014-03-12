@timevault.controller 'UserSignInCtrl', ['$scope', 'Auth', ($scope, Auth) ->
  $scope.init = ->
    $scope.user = {}
    # console.log(Auth.isAuthenticated())
    Auth.currentUser().then (user) ->
      console.log user

  $scope.login = ->
    Auth.login($scope.user).then (user) ->
        console.log(user)
    
]
