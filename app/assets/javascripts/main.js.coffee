@timevault = angular.module('timevault', ['ngRoute', 'ngResource'])

@timevault.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)

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
