@timevault.controller 'IntervalIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.intervals = []
  $http.get('./intervals.json').success((data) ->
    $scope.intervals = data
  )
]
