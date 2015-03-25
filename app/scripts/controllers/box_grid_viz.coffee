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
  			$scope.first_field = data[0].field_name
  			$scope.first_cm = data[0].cms[0].cm_name
    ]
		