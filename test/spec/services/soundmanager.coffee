'use strict'

describe 'Service: soundmanager', () ->

  # load the service's module
  beforeEach module 'www.universdj.comApp'

  # instantiate service
  soundmanager = {}
  beforeEach inject (_soundmanager_) ->
    soundmanager = _soundmanager_

  it 'should do something', () ->
    expect(!!soundmanager).toBe true;
