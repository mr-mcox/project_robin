'use strict'

###*
 # @ngdoc directive
 # @name projectRobinApp.directive:d3BoxGrid
 # @description
 # # d3BoxGrid
###
angular.module 'projectRobinApp'
  .directive 'd3BoxGrid', ->
    restrict: 'EA'
    template: '<div></div>'
    link: (scope, element, attrs) ->
      element.text 'this is the d3BoxGrid directive'
