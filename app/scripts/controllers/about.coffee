'use strict'

###*
 # @ngdoc function
 # @name projectRobinApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the projectRobinApp
###
angular.module 'projectRobinApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.message = "All about me!"
