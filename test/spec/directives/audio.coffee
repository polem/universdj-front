'use strict'

describe 'Directive: audio', () ->
  beforeEach module 'www.universdj.comApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<audio></audio>'
    element = $compile(element) $rootScope
    expect(element text()).toBe 'this is the audio directive'
