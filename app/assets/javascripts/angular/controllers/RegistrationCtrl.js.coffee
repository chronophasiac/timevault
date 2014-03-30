@timevault.controller 'RegistrationCtrl', ['$scope', '$location', 'Auth', '$modalInstance', 'user', ($scope, $location, Auth, $modalInstance, user) ->
  $scope.user = user

  $scope.register = ->
    credentials =
      email: $scope.user.email
      password: $scope.user.password
      password_confirmation: $scope.user.passwordConfirmation
      phone_number: $scope.user.phoneNumber

    Auth.register(credentials).then(
      (registeredUser) ->
        $modalInstance.close registeredUser
      (response) ->
        console.log errorType, errorMessage for errorType, errorMessage of response.data.errors)

  $scope.close = ->
    $modalInstance.close()

]
