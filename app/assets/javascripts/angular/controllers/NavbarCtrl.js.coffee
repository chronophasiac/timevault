@timevault.controller 'NavbarCtrl', ['$scope', 'Auth', ($scope, Auth) ->
  $scope.init = ->
    $scope.currentUuser = {}
    Auth.currentUser().then (user) ->
      $scope.currentUser = user

  $scope.login = ->
    Auth.login($scope.user).then (user) ->
      $scope.currentUser = user

  $scope.logout = ->
    Auth.logout().then (oldUser) ->
      $scope.currentUser = {}
]
