@timevault.factory 'Pomodoro', ($resource) ->
  class Pomodoro
    constructor: ->
      @service = $resource('/api/pomodoros/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})

    create: (attrs) ->
      new @service(pomodoro: attrs).$save (pomodoro) ->
        attrs.id = pomodoro.id
      attrs

    all: ->
      @service.query()

    find: (id) ->
      @service.get id: id

    minutesLeft: (pomodoro) ->
      pomodoroStart = new Date(pomodoro.start)
      pomodoroEnd = pomodoroStart.setSeconds(pomodoroStart.getSeconds() + pomodoro.set_duration)
      minutes = ((pomodoroEnd - new Date()) / 1000) / 60
      if minutes > 0
        minutes
      else
        0
