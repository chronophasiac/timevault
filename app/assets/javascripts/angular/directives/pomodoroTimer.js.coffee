@timevault.directive 'pomodoroTimer', ['$interval', ($interval, startTime) ->
  link = (scope, element, attrs) ->
    updateTime = ->
      pomodoroEnd = new Date(scope.pomodoro.projected_end)
      remainingMinutes = (((pomodoroEnd - new Date()) / 1000) / 60)
      element.text remainingMinutes
    element.on '$destroy', ->
      $interval.cancel(timeoutId)
    timeoutId = $interval ->
      updateTime()
    , 1000
  return {
    link: link
  }
]
