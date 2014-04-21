@timevault.controller 'PomodoroIndexCtrl', ['$scope', '$location', '$filter', '$interval',  'Pomodoro', ($scope, $location, $filter, $interval, Pomodoro) ->
  $scope.pomodoros = []

  $scope.init = ->
    @pomodorosService = new Pomodoro
    $scope.pomodoros = @pomodorosService.all()
    $scope.ps = @pomodorosService

    now = $filter('date')(Date.now(), "yyyy-MM-dd'T'HH:mm:ss")
    $scope.pomodoro = {start: now, set_duration: 1500}

    timeoutId = $interval ->
      $scope.updateRemaining()
    , 1000

  $scope.updateRemaining = ->
    for pom in $scope.pomodoros
      pom.percentageLeft = @pomodorosService.percentageLeft(pom)

  $scope.viewPomodoro = (id) ->
    $location.url "/pomodoros/#{id}"

  $scope.addPomodoro = ->
    pomodoro = @pomodorosService.create start: $scope.pomodoro.start, set_duration: $scope.pomodoro.set_duration
    $scope.pomodoros.unshift(pomodoro)
]
