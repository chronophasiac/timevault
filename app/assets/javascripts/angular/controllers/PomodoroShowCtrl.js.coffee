@timevault.controller 'RestaurantShowCtrl', ['$scope', '$http', '$routeParams', 'Pomodoro', ($scope, $http, $routeParams, Pomodoro) ->
  $scope.init = ->
    @pomodorosService = new Pomodoro
    $scope.pomodoro = @pomodorosService.find $routeParams.id
]
