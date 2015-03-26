'use strict'

###*
 # @ngdoc function
 # @name projectRobinApp.controller:BoxGridVizCtrl
 # @description
 # # BoxGridVizCtrl
 # Controller of the projectRobinApp
###
angular.module 'projectRobinApp'
  .controller 'BoxGridVizCtrl', ['$scope', '$http', ($scope, $http) ->
  		$http.get 'data/data.json'
  		.success (data) ->
  			$scope.message = 'data loaded!'
  			$scope.data = data
    ]
		