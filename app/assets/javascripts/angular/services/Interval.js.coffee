@timevault.factory 'Interval', ($resource) ->
  class Interval
    constructor: ->
      @service = $resource('/api/intervals/:id',
        {id: '@id'})

    create: (attrs) ->
      new @service(interval: attrs).$save (interval) ->
        attrs.id = interval.id
      attrs

    all: ->
      @service.query()

    find: (id) ->
      @service.get id: id
