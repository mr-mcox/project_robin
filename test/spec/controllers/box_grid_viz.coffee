'use strict'

describe 'Controller: BoxGridVizCtrl', ->

  # load the controller's module
  beforeEach module 'projectRobinApp'

  BoxGridVizCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BoxGridVizCtrl = $controller 'BoxGridVizCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
