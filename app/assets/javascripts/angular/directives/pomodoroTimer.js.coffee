@timevault.directive 'pomodoroTimer', ['$interval', ($interval) ->
  link = (scope, element, attrs) ->
    updateTime = ->
      element.text scope.timeLeft()
    element.on '$destroy', ->
      $interval.cancel(timeoutId)
    timeoutId = $interval ->
      updateTime()
    , 1000
  return {
    link: link
  }
]
