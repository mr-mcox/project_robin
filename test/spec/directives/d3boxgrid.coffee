'use strict'

describe 'Directive: d3BoxGrid', ->

  # load the directive's module
  beforeEach module 'projectRobinApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<d3-box-grid></d3-box-grid>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the d3BoxGrid directive'
