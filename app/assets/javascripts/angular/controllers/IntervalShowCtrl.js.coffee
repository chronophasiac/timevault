@timevault.controller 'RestaurantShowCtrl', ['$scope', '$http', '$routeParams', 'Interval', ($scope, $http, $routeParams, Interval) ->
  $scope.init = ->
    @intervalsService = new Interval
    $scope.interval = @intervalsService.find $routeParams.id
]
