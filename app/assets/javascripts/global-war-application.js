var globalWarApp = angular.module('globalWarApp', [
  'ngRoute'
]);

globalWarApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/games', {
        templateUrl: 'assets/partials/games.html',
        controller: 'GamesListCtrl'
      }).
      when('/games/:game_id', {
        templateUrl: 'assets/partials/show.html',
        controller: 'GamesDetailCtrl'
      }).
      otherwise({
        redirectTo: '/games'
      });
  }
]);
