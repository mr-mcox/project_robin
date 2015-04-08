'use strict'

describe 'Service: GAService', ->

  # load the service's module
  beforeEach module 'projectRobinApp'

  # instantiate service
  GAService = {}
  beforeEach inject (_GAService_) ->
    GAService = _GAService_

  it 'should do something', ->
    expect(!!GAService).toBe true
