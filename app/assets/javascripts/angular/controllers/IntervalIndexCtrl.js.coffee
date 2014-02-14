@timevault.controller 'IntervalIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.intervals = []
  $http.get('/api/intervals.json').success((data) ->
    $scope.intervals = data
  )

  $scope.viewInterval = (id) ->
    $location.url "/intervals/#{id}"
]
