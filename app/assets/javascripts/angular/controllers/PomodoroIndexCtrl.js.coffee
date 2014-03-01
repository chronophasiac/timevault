@timevault.controller 'PomodoroIndexCtrl', ['$scope', '$location', '$http', '$filter', 'Pomodoro', ($scope, $location, $http, $filter, Pomodoro) ->
  $scope.pomodoros = []

  $scope.init = ->
    @pomodorosService = new Pomodoro
    $scope.pomodoros = @pomodorosService.all()

    now = $filter('date')(Date.now(), "yyyy-MM-dd'T'HH:mm:ss")
    $scope.pomodoro = {start: now, set_duration: 1500}

  $scope.viewPomodoro = (id) ->
    $location.url "/pomodoros/#{id}"

  $scope.addPomodoro = ->
    pomodoro = @pomodorosService.create start: $scope.pomodoro.start, set_duration: $scope.pomodoro.set_duration
    $scope.pomodoros.unshift(pomodoro)
]
