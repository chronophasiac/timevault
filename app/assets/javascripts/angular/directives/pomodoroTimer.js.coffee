@timevault.directive 'pomodoroTimer', ['$interval', 'Pomodoro', ($interval, Pomodoro) ->
  link = (scope, element, attrs) ->
    @pomodorosService = new Pomodoro
    updateTime = ->
      element.text @pomodorosService.minutesLeft(scope.pomodoro)
    element.on '$destroy', ->
      $interval.cancel(timeoutId)
    timeoutId = $interval ->
      updateTime()
    , 1000
  return {
    link: link
  }
]
