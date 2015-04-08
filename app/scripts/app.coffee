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
      .when '/box_grid_viz/:staff_id?',
        templateUrl: 'views/box_grid_viz.html'
      .when '/register_staff',
        templateUrl: 'views/register_staff.html'
        controller: 'StaffIdCtrl'
      .when '/tracking',
        templateUrl: 'views/set_tracking.html'
      .otherwise
        redirectTo: '/'

