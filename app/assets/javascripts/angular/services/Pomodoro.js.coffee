@timevault.factory 'Pomodoro', ($resource) ->
  class Pomodoro
    constructor: ->
      @service = $resource('/api/pomodoros/:id',
        {id: '@id'})

    create: (attrs) ->
      new @service(pomodoro: attrs).$save (pomodoro) ->
        attrs.id = pomodoro.id
      attrs

    all: ->
      @service.query()

    find: (id) ->
      @service.get id: id
