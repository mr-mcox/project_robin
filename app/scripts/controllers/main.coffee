'use strict'

###*
 # @ngdoc function
 # @name projectRobinApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the projectRobinApp
###
angular.module 'projectRobinApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.message = "Here's the main page!"
