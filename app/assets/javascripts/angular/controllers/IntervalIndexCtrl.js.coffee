@timevault.controller 'IntervalIndexCtrl', ['$scope', '$location', '$http', 'Interval', ($scope, $location, $http, Interval) ->
  $scope.init = ->
    @intervalsService = new Interval
    $scope.intervals = @intervalsService.all()

  $scope.viewInterval = (id) ->
    $location.url "/intervals/#{id}"
]
