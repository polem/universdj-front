'use strict'

describe 'Service: em', () ->

  # load the service's module
  beforeEach module 'www.universdj.comApp'

  # instantiate service
  em = {}
  beforeEach inject (_em_) ->
    em = _em_

  it 'should do something', () ->
    expect(!!em).toBe true;
