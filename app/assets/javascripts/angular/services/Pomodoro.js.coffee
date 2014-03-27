@timevault.factory 'Pomodoro', ($resource) ->
  class Pomodoro
    constructor: ->
      @service = $resource('/api/pomodoros/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})

    create: (attrs) ->
      new @service(pomodoro: attrs).$save (pomodoro) ->
        attrs.id = pomodoro.id
        attrs.start = pomodoro.start
      attrs

    all: ->
      @service.query()

    find: (id) ->
      @service.get id: id

    minutesLeft: (pomodoro) ->
      pomodoroStart = new Date(pomodoro.start)
      endSeconds = pomodoroStart.getSeconds() + pomodoro.set_duration
      pomodoroEnd = pomodoroStart.setSeconds(endSeconds)
      now = new Date()
      remaining = pomodoroEnd - now
      
      if remaining > 0
        (remaining / 1000) / 60
      else
        0
