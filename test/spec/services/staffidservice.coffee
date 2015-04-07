'use strict'

describe 'Service: staffIdService', ->

  # load the service's module
  beforeEach module 'projectRobinApp'

  # instantiate service
  staffIdService = {}
  beforeEach inject (_staffIdService_) ->
    staffIdService = _staffIdService_

  it 'should do something', ->
    expect(!!staffIdService).toBe true
