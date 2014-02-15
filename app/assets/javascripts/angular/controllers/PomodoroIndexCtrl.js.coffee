@timevault.controller 'PomodoroIndexCtrl', ['$scope', '$location', '$http', 'Pomodoro', ($scope, $location, $http, Pomodoro) ->
  $scope.pomodoros = []

  $scope.init = ->
    @pomodorosService = new Pomodoro
    $scope.pomodoros = @pomodorosService.all()

  $scope.viewPomodoro = (id) ->
    $location.url "/pomodoros/#{id}"

  $scope.addPomodoro = ->
    pomodoro = @pomodorosService.create(start: $scope.pomodoroStart, end: $scope.pomodoroEnd)
    $scope.pomodoros.unshift(pomodoro)
]