@timevault.controller 'RestaurantShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/api/intervals/#{$routeParams.id}.json").success((data) ->
    $scope.interval = data
  )
]
