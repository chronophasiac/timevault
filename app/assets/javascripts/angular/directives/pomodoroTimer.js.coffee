@timevault.directive 'pomodoroTimer', ['$interval', '$filter', 'startTime', ($interval, $filter, startTime) ->
  link = (scope, element, attrs) ->
    updateTime = ->
      element.text ((new Date()) - startTime)
    element.on '$destroy', ->
      $interval.cancel(timeoutId)
    timeoutId = $interval ->
      updatetime()
    , 1000
  return {
    link: link
  }
]
