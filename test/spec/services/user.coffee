'use strict'

describe 'Service: user', () ->

  # load the service's module
  beforeEach module 'www.universdj.comApp'

  # instantiate service
  user = {}
  beforeEach inject (_user_) ->
    user = _user_

  it 'should do something', () ->
    expect(!!user).toBe true;
