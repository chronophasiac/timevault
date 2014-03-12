@timevault.controller 'HomeCtrl', ['$scope', 'Auth', ($scope, Auth) ->
  $scope.appName = 'Timevault'
  Auth.currentUser().then (user) ->
    console.log user

  $scope.logout = ->
    Auth.logout().then (oldUser) ->
      console.log oldUser
]
