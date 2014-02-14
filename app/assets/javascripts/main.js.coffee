@timevault = angular.module('timevault', ['ngRoute'])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
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
