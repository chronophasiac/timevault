@timevault = angular.module('timevault', ['ngRoute', 'ngResource'])

@timevault.config(['$routeProvider', '$locationProvider', '$httpProvider', ($routeProvider, $locationProvider, $httpProvider) ->
  # Enable HTML5 History API for modern browsers
  $locationProvider.html5Mode(true)

  # Add CSRF tokens
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  # Add support for HTTP PATCH
  defaults = $httpProvider.defaults.headers
  defaults.patch = defaults.patch || {}
  defaults.patch['Content-Type'] = 'application/json'

  $routeProvider.
    when('/pomodoros', {
      templateUrl: '../templates/pomodoros/index.html',
      controller: 'PomodoroIndexCtrl'
    }).
    when('/pomodoros/:id', {
      templateUrl: '../templates/pomodoros/show.html',
      controller: 'RestaurantShowCtrl'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })
])
