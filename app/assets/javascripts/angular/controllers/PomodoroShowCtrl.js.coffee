@timevault.controller 'PomodoroShowCtrl', ['$scope', '$http', '$routeParams', 'Pomodoro', ($scope, $http, $routeParams, Pomodoro) ->
  $scope.init = ->
    @pomodorosService = new Pomodoro
    $scope.pomodoro = @pomodorosService.find $routeParams.id

    $scope.timeLeft = ->
      @pomodorosService.minutesLeft($scope.pomodoro)
]
