'use strict'

###*
 # @ngdoc overview
 # @name projectRobinApp
 # @description
 # # projectRobinApp
 #
 # Main module of the application.
###
angular
  .module 'projectRobinApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/box_grid_viz',
        templateUrl: 'views/box_grid_viz.html'
        controller: 'BoxGridVizCtrl'
      .otherwise
        redirectTo: '/'

