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
      pomodoroEnd = new Date(pomodoro.projected_end)
      ((pomodoroEnd - new Date()) / 1000) / 60
