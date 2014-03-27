@timevault.controller 'NavbarCtrl', ['$scope', '$location', 'Auth', ($scope, $location, Auth) ->
  $scope.init = ->
    $scope.currentUser = {}
    Auth.currentUser().then(
      (user) ->
        $scope.currentUser = user
      (error) ->
        console.log error)

  $scope.userSignedIn = ->
    !!$scope.currentUser.email

  $scope.login = ->
    Auth.login($scope.user).then (user) ->
      $scope.currentUser = user

  $scope.logout = ->
    Auth.logout().then (oldUser) ->
      $scope.currentUser = {}
      $location.path( '/' )
]
