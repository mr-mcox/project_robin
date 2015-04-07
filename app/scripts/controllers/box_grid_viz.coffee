'use strict'

###*
 # @ngdoc function
 # @name projectRobinApp.controller:BoxGridVizCtrl
 # @description
 # # BoxGridVizCtrl
 # Controller of the projectRobinApp
###
angular.module 'projectRobinApp'
  .controller 'BoxGridVizCtrl', ['$scope', '$http', 'staffIdService', ($scope, $http, staffIdService) ->
  		staff_id = staffIdService.get()
  		$http.get 'data/' + staff_id + '.json'
  		.success (data) ->
  			$scope.data = data
  		.error (data, status) ->
  			console.log 'Unable to load data for staff with id ' + staff_id
    ]
		