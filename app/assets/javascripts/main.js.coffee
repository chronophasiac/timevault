@timevault = angular.module('timevault', ['ngRoute', 'ngResource'])

@timevault.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)

  $routeProvider.
    when('/intervals', {
      templateUrl: '../templates/intervals/index.html',
      controller: 'IntervalIndexCtrl'
    }).
    when('/intervals/:id', {
      templateUrl: '../templates/intervals/show.html',
      controller: 'RestaurantShowCtrl'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })
])
