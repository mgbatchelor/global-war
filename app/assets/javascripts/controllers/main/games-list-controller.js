globalWarApp.controller('GamesListCtrl', ['$scope', '$http', function($scope, $http){

  $http.get('api/v1/games').success(function(data){
    $scope.games = data;
  });

  $scope.create = function(form) {
    $http.post('api/v1/games', form).success(function(data){
      $scope.games.push(data);
      form.name = ''; // clear form
    });
  };

  $scope.destroy = function(game) {
    $http.delete('api/v1/games/' + game.id).success(function(data){
      $scope.games.splice(_.indexOf(_.pluck($scope.games, 'id'), game.id), 1);
    });
  };

}]);
