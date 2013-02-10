'use strict'

describe 'Service: mixshow', () ->

  # load the service's module
  beforeEach module 'www.universdj.comApp'

  # instantiate service
  mixshow = {}
  beforeEach inject (_mixshow_) ->
    mixshow = _mixshow_

  it 'should do something', () ->
    expect(!!mixshow).toBe true;
