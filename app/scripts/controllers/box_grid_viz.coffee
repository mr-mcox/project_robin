'use strict'

###*
 # @ngdoc function
 # @name projectRobinApp.controller:BoxGridVizCtrl
 # @description
 # # BoxGridVizCtrl
 # Controller of the projectRobinApp
###
angular.module 'projectRobinApp'
  .controller 'BoxGridVizCtrl', ['$scope', '$http', '$routeParams', 'GAService', 'staffIdService', ($scope, $http, $routeParams, GAService, staffIdService) ->
        self = this
        self.data_error_message = null
        GAService.send_pageview('/box_grid_viz')
        if $routeParams.staff_id
            staffIdService.set($routeParams.staff_id)
        staff_id = staffIdService.get()
        $http.get 'data/' + staff_id + '.json'
        #$http.get 'https://s3.amazonaws.com/projectrobinjson/' + staff_id + '.json'
        .success (data) ->
            $scope.data = data
        .error (data, status) ->
            console.log 'Error loading data'
            self.data_error_message = 'Unable to load data for staff with id ' + staff_id
    ]
        